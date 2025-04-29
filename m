Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B22750E6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909204; cv=none; b=Dtqjz1EsD7+3wpqj2gm79T4yY4AEMvN6ENF807bibhBOMbGT6Clw9hoFn/Nh37nsBa/rBXsB9/0Y5fN9gGyU7/GoerdU+TmozfLZfKY23iLFEB/DaV80cjXK8fakazjzzHDmMAf1gqN4MGrzMO7yl7N7HGGQueloi8aoTXQcl8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909204; c=relaxed/simple;
	bh=1pIprI0EO05HFaFO5ZwHNaOGBqkqOpeJf8DkIAD7OnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGz+ydER1edqBGZoQ6RInnexQyzM4y3mqAo2dKIZl6gTsLZdH3v4IB0ZwRXIAK36UaGRfpaOUFBPhkYpSuKJnTKewIX/5Mdhl43QZq3eHZn63uvEjla6FPLJZHmSApjI8Gxw5YDio2zee5PIbEk8WJ886Qe0AjwbDSr+CTyGvc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6XDVcY+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6XDVcY+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqK0p012626
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DZu3TV8trj7jEXy9C3oxl4Sy
	0FYWykPDbiLWiHrWJao=; b=N6XDVcY+mrQT+m461o4bwqUWem/L+QiXXwUoTQT0
	lyHKLGcln/unMyGQcwf3WRs2L8baOoyGPxiO8Fi/7QY863ItKpelgREWLF4Q56DY
	a2y4pMer6xyrT7r6p+TKDcBBG6Yyfj5B3/+xfPSX+CXgBLj+VrNHcsfk5JHYW6rG
	0bQA4qxj155NOjhDwrUTJwVwUNCzpyzqoR4s2q1rTWv5/UL0JWpMaFZnnCOodCbY
	8Sbji9o/STMdR9CM3wM6C16DPPrgryVadXWag3uF19gcNf8KURm4R2fLwomWVN46
	8XbEMtYYzl9uMe1NEUhr/iq9Bha0/5C7U3N1Xo83+s6ZJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323g60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:46:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476900d10caso131540191cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909200; x=1746514000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZu3TV8trj7jEXy9C3oxl4Sy0FYWykPDbiLWiHrWJao=;
        b=RoFpvOI7HPvpIttH9sn9MOBQ4NTq8KV/9molhrL60GrqlTQMTdgRXqfCln+sGleUoz
         12YUM+lTWkkJ3GIVw1xBgL82DacDl5GI0tlra5Yyoa9K9Y6wH+SiMEFlArd6JoiMTs0G
         51tn3w3cEUEqfNzz1USVo3vsVjmjZaGtRH/QQwmgav1x/h57V7/FeETaDyCDLDJjN0hj
         YU5wYTTdQboJJSao8i7VA3gVtrl9n3LGucUhx7OlZvx8J+Zz6NnlqMpwNVakzFGP/eP9
         4Ju7RYswu4SPMnMM0BByyEkZlSKVAJ/GQb2hTSqmkDVsMquItXDMIOF9NRijk2V00BFF
         /Vmw==
X-Forwarded-Encrypted: i=1; AJvYcCURej/OR3sy50M2IfOpF4zbbAmizHOa6RPQkz9y8JNiQZ6B/XDROt0uEs7SDlNH/07Zw2w3iYU3R5RhVeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3ObeshuUNF8RAX7JsQy2wJO+enLewy/nBVGjF2PDIVF/vWBx
	ZUWPmCgpDNv8yI0gk2tvBgwiZWyX21AnpNfNlqcnKaMgGPHRqpNs/Frd6z8xW/5buInFlz5flWY
	n/+00i7G2OXzha1TpyJBgIEhro1aSORc4ZfBXcXo98KZ8VfZu1imKoqIGUbZj8Lk=
X-Gm-Gg: ASbGncsohHFxvqgeqUKF8FILla6/2lAFjMPD8n/ZW+e10jLsKkqs4WzTCnBRJUJoWG9
	4O66qgOBVHMG/CQwN6sflaCNHZOQeVg8dWfVhoM5VkIGHBGloN1QnFH1CueMTPgw8PxHUPj8o2D
	scfycknputKeNERmgMMcTc5frOFgdu9V8FgEurJTBPJIhthG55vhe12hXg8ujCB0NsXu+IVkv8d
	3kqYLh3z6HCLiFZc4n8FgOhCXSK7a0xLK2o+bBr2B4MBLe+0LU1V59N71J4tC/QBKn0dQdbeSuD
	VjGmmcNayeb9DczJwCUwhF0DKC/cjd4h/q7huCNDWALnXbtASBWyIlEtrmwkPB+osCAuguq1Ang
	=
X-Received: by 2002:ac8:7f8e:0:b0:476:a967:b247 with SMTP id d75a77b69052e-48133562059mr203907681cf.47.1745909199808;
        Mon, 28 Apr 2025 23:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMg1rHdHs2/nbrDBu8fCMcRUEKSoFdhUgPQjOmgqhIt37Lk0kiYKjrtVvVlpe5Endpr+SpyQ==
X-Received: by 2002:ac8:7f8e:0:b0:476:a967:b247 with SMTP id d75a77b69052e-48133562059mr203907431cf.47.1745909199361;
        Mon, 28 Apr 2025 23:46:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm22953181fa.114.2025.04.28.23.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:46:38 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:46:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
Message-ID: <zjofw6fe5aznnqphtneccj426vqpbimm23kcpi3xts6p6zhftk@kjhrxvhanamm>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-2-swboyd@chromium.org>
 <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
 <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681075d0 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=yV4NexEFXbUgmP4BVSMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NhEPoFrrIGjKi4FCrXXSA1RX3TxdP2jj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1MCBTYWx0ZWRfXwo8Hp+tEhpz0 PuEDYY3M3uMae+/hJHPyKdyg4WCXP94KFRmcHWoqaHkqqdc3hUhX+Te3bw/6OJtXXIk+L2+KGmp VBRKLxJLnfsgD3MUgGfMlzuUrpn1zv+tXVGv7BBhSqf1WfmmPHGv3YfHcn0LwFohFtXH8Is8eiZ
 9+BgbKjTFZEr+yfiWCj2LZ9rYE57nTIuZMNaVTIZYiJEFSvt9cAXCMyVMyZ06dg0hMeZ4EJOq/7 qsmhTHXTC9WDx5gd7N3LFBBl9rm1xj0A5IsJqscN28yJGQlF7dmNO58HldW7USZ2lTGWtuPZtL0 I5JTMY5zksrEW9VjIblknkyQKqM1ggdlL7kYe96IfHKpkTH5/AM8BaP4TwJ6hDQ05gHfpI2WJbb
 0p+I9p5QxL720noDb8Ql+QEFlabK6tCfXcST/O9HrzKZ3RrzkAbzZd4J6zfxRhgnvLajn/Nq
X-Proofpoint-ORIG-GUID: NhEPoFrrIGjKi4FCrXXSA1RX3TxdP2jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=579 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290050

On Mon, Apr 28, 2025 at 04:55:27PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2025-04-22 06:38:17)
> > On 16/04/2025 03:02, Stephen Boyd wrote:
> > > If we aren't expecting a status update when
> > > cros_typec_displayport_status_update() is called then we're handling an
> > > attention message, like HPD high/low or IRQ. Call
> > > typec_altmode_attention() in this case so that HPD signaling works in
> > > the DP altmode driver.
> >
> > Fixes?
> 
> I didn't put a fixes because it only matters to make the displayport
> altmode driver work with the typec port which isn't used so far on DT
> platforms. I view it as a new feature, not a fix for an existing
> feature, because we don't use the altmode driver.
> 
> It also seems like it was intentional on ACPI systems to only handle
> mode entry/exit and not HPD signaling per my reading of the mailing
> list.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
