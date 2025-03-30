Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3A8F6C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354885; cv=none; b=Ovn9jDWSO3iA2AAH/ty/Prliv5bqm+rl+voS0+D3Ido7Vlq3WjxydAo3yn92jnQIqwx1E4IuJVb59YqPtUyz9E7/mpdUoaDlNaSftoYK3Zb98SaTrmBjEYifKq0D2LU5iQsm/su4mU6uwcBFX+ULTHwwuEVhn/HJzxNtEja1ndM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354885; c=relaxed/simple;
	bh=wkagIR5FLAk8HgfoJCiDVW0JJkVVFpH+cJJWFoeb5pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJ0B2CVHskCicy5NPl/c71ypMdfI8Fs2GhLtNuQXMoCpRaFE+IEIfjE9aMxIRk/Ojq+WqzoAAOb71JTvYrJ/SbpQGWTCCWMyVoWMU3gprIEQlIAYjOyo+OhaBUql/t7cAOa/1LuB1murwD+gWQVZ9qaYwtck5wyZ1udPEGt3H0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4ZMEK63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4ZMEK63"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDanCZ000891
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i3eDoRwfxAXyOJNfAoWRrpjX5DTKwyAl2h3Ll2a+Ck=; b=n4ZMEK63TxeG6m9O
	ItDJchUK4hSWpjPBrvdt06ROOOq+vnSD9gFiYAA5gN2R1uPAofD0G8ZUITuDcKlv
	3CCJkytVNn3z3KiMXmLU21Kc1/lfREtaEWvphgWtRjCIt3wOg7zdQvLSTFn8P6pg
	rZOYKhces30KsuyImsNeDT2ibbTwNtdKG6bEm3Z4+SycRBd5iqCkq4lcH52fVhp5
	wSZ9Nu9vHfTVl0homIOtuTJl84pHNDCZu/XG3cR4T9LdyPAtHXfuLlFyND06ovON
	rlEufN7nf3V/gKWkTAvtEfdywzMUKHzqewm6tbIy5zbWRqv7uQX+UCXyCLeo3smN
	ToEiUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjfy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:14:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso611940785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354881; x=1743959681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5i3eDoRwfxAXyOJNfAoWRrpjX5DTKwyAl2h3Ll2a+Ck=;
        b=gbeU4AZW5IUgXgkh7f3ThNKe+nssR1otCNAQ1QoZFRQaunKgczhAAOwtt+FbXmOQzw
         M2YiACScUs3p0K9jnd+RhHYU0nUDaVDZcjz6ylqrOwCOJSITY8MvNO3K36mEa0RHWIZ/
         Vy75Qx7Ae/i2FCgf6UKM7sa+Oy29WI2RLhRYyowt0zQ8c35KqFgxXLUiYZQEjva9lDug
         peCLGZUEDTQqzXi2YKR5+xbTsMTifopBl9Q+CuWChWzGzRJ/gOCHTlJXU0Sr3iOpqVeY
         BbFlEw5O7DCNuT4s1CBQjotXFWC3hmzYTaCUtjUjmTkaHXN8JMK55gijk3alpTXViqwD
         7EOA==
X-Forwarded-Encrypted: i=1; AJvYcCWQDMq41+mPKpMzhGZa+gUI2YFSSu1eFBVbFf5g95ujT6EC/JyPbe2ZEMilkYaYe6cJY1DNEYhjHmCX39c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoqQ3uS2hpMSaXFpTJ/NdE+6moXjbvOwm2OURZMPeHgN3Xh5PF
	fK2qb5/g4rZTHnlChKRch5T790hEre2PYNSs+BZEU3vYBtLHC8+tXomv+UNZfomsWZcHnxW71QL
	s9qU9qYFw6RibdF/j9hF4sPxVDoFsG2e1wVVOR89Ux0YxlKxeNxcqo86RffgSpdEkQN7SfKlau8
	l+
X-Gm-Gg: ASbGncuQCp6mLth7WsBOkQV4A6stTXKdPOzDcR46k5zZIzl+VxEgZXfoszOPtjDCogW
	UuwlJa4TrHy1o3w3XzB3sx3ziDS57I1/A0eY3F0SUyc7aNQX3Ldd+6hvGPru9ADJupHrBDQZDYn
	7lRti6RTIctwbLRg/tQEoD0yEA7RNHyO544+Ocy3C7QrOwGdS0mK1VOtmNFVr/aXisKPSZ5gmor
	gjaROvby/EmI7BkQAPtRvpAzfhXICfet5T+7P7YkAknjOiJE1k5PUoOwl/6xCPgVWf+N/pTO8NE
	nd5fTI5OGwWeBB6OQPKSX2Sr4gIX28bZ8Gp6uYFb+hjF7Dg38eY+2a/D/NNvmJS8ewc=
X-Received: by 2002:a05:620a:4103:b0:7c5:467f:d130 with SMTP id af79cd13be357-7c69087cf02mr1038533185a.36.1743354881377;
        Sun, 30 Mar 2025 10:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6ouIKg8DzyniG2QRhNtOGX2OqcIrcPRuppMODsS9RbSuUxUY5ZbhZt97wTj9QrUTaz/fM/w==
X-Received: by 2002:a05:620a:4103:b0:7c5:467f:d130 with SMTP id af79cd13be357-7c69087cf02mr1038530785a.36.1743354881076;
        Sun, 30 Mar 2025 10:14:41 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4c82dsm11838891fa.72.2025.03.30.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:14:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Anusha Srivatsa <asrivats@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tejas Vipin <tejasvipin76@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
Date: Sun, 30 Mar 2025 20:14:35 +0300
Message-ID: <174335487030.2561144.6278208739964228205.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
References: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e97c02 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=dR6xgOBWzFjIgz3fxCEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ixzO-2Mnm6R16ZuuBEy29ysG2z_cPKLW
X-Proofpoint-GUID: ixzO-2Mnm6R16ZuuBEy29ysG2z_cPKLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300120

On Wed, 26 Mar 2025 23:29:19 -0400, Anusha Srivatsa wrote:
> Move away from using deprecated API and use _multi variants
> if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
> instead of msleep() and usleep_range() respectively.
> 
> Used Coccinelle to find the _multi variant APIs,replacing
> mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> does not have a corresponding _multi() variant. Replacing it with
> mipi_dsi_dcs_write_seq_multi() instead. This change is manual.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/panel/sharp-ls043t1le01: Use _multi variants
      commit: 20e8219205145e1af3b98b6a0a3cc59568116a05

Best regards,
-- 
With best wishes
Dmitry

