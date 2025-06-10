Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F171A5BA8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544323; cv=none; b=RVy5ozleztyKGdXMqSPPDlp59rhuheJInP5zUzc8ub0qIPsXDPn8zdYhyotD3LS/7jW3d5pyrL7O4qfeBCJ8mJZoHaG5EuYnc/D5McChX2bTPUqbOP3GY3/ci4ZOjc2B8gyhHXPi6hzQYf9G3Du88IWysMYw8iyqtv7B+t5cvBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544323; c=relaxed/simple;
	bh=2rFBM+nV8Qx5zRHwP9cKtT+1/KwBzM5Hc92iTCtLRU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9npLoHHpfCTP5WAQj7c3Qvs+u1XJplYSr4Yftqv/GFUHEBJHJIkWT7huY7NGRnRp0x8sjx8wBuUpEAn/Z96i0DOccNbGk4BsPSBhxq6JsjeCVCTMMYWvMrgh9iV6sjxbydVKulhVOd+p6i0kgwKEkzGptpfEQSfhR+ji/gxUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEaqjg1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEaqjg1a"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559MhF0J029522
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JZrn3vl29ETLeyef2H75LJZ8
	lkv5P66IpdGTrgWehgc=; b=bEaqjg1awy/7I7egSy8etrDgmlBdeP4BmIFkyrfY
	xFealOQ2CNUsbNraFymUckpY12Jebk448A4LgGD9pgCRgb/AJQ+fXATCn0ySSoIW
	UpuwKg7uZC62LzmAik9nZWOKPiyZKR39qXfo2DrMVLBDmI7U89mkbXI4srQmNeAT
	iCy08G8a36Jbwf/M/mTvfU6y1fWgiZch+RGe/M7OceP33oXruxnhMmsnXYeTSgpF
	Z/vJiy3SuSBCX+nfiFkTaYGhFo4NnCv5UfEzHMMGlf4Jw/0wTUrYX4E34+XiEFqI
	Lmfnw/8+DSckF8MC0qJCKdMuiZUMskX6H2z0PK83/7EaCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d120sxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:32:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so883573685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544319; x=1750149119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZrn3vl29ETLeyef2H75LJZ8lkv5P66IpdGTrgWehgc=;
        b=DkRNxgFJlU6RBSMVOXe1lGu61FuK+M2iOF5/dsMSHB25QueABOLokZdMVllMFQEJWi
         avy6h5IKFuyebugPo9KOJpqdKqXBi4u271Ozeb8oDAL9a12Vs+jPyTkqMQbGYwqJqeic
         SWl6zGkkAPmqLxTaWVUXnzD3M1oFryx4KwLmNsaSW/MoO0KTTgQVgvH6Rz8KMolHzfaS
         V2f+1k0ubG/pgYV0m2EVIB6vr+zhUUZgiicKp+1Wy4mLtx8woO/zWKVgJOOoSDSvIldq
         Hap+YHaxn2j/79Yka2FpMPmE5MigENixUlkHbKSYIjRc4KoyHq49mxlFmFTpXgxeSVWS
         LKLg==
X-Forwarded-Encrypted: i=1; AJvYcCWy2oxZoHFazNIUDX3UPSaph+m1v29rkBF2zvt/F0lUO8/cAwu6dKswlgMJCGFlZgQ8ot+UjHcQG6vAaMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YycjKNHymTTRqRWrgD/zB+xgLKoc/+Te1RcJH+QLd2086yTr/HQ
	YPNsVLlIjnzpMGYv6KCLPfG8fsePi/NTmfPeM+MbegzpjiyThPiUUIpAlPZuSchgBeLCitEZU0X
	W4ZpgwZqHpJ+IPWdtgPwszH+giuO9rKpKaDMy+cFSdXg3VO/cto5ncIgSi7JU5JRj1FU=
X-Gm-Gg: ASbGncsNec1v99TAI8Xu9YblL3LZP5jHFVlhSq+D3fHAJfs3mNQdvfh/FCBSQAQBCXo
	+LFXsx9OPq4s4d20LAJMcxJq2dy/zdMCEEYRqzaoHCCLLLVX8RdxJpzFC+dDZ+npjSJ2y/4MPr3
	DKPR+g0XHTcHm7/+7oHh0czqfDyps+CGV63S6aXBqsFUTUQ0wdOZ02s33yPHTtlgOLSjr4qx8x2
	fWZLol+6MVA+XDTu5xV18hnCCy5VuLkvJpYFSlzHCo/iveGJioDQ75zx+Bp5/BbavGTzaym/S6K
	vhoe2+u1NgKH0Dpoompq8m7wkXpwsvqqzII7i3NLp3yXGXuBardyEQ7ssMv9pPygPltf0no+8vV
	NSZXlnNvFkHyfvbSTPAL/lq1wel3nbu/r8ug=
X-Received: by 2002:a05:620a:4415:b0:7ce:ea5d:abfb with SMTP id af79cd13be357-7d39d8ad67fmr414411085a.12.1749544319533;
        Tue, 10 Jun 2025 01:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFRon5fmkrg0jRZltDF8NJeGjA/n00qtehYkJGydzz1jCNf65GDG05D22qeb1dd2ENpeasmg==
X-Received: by 2002:a05:620a:4415:b0:7ce:ea5d:abfb with SMTP id af79cd13be357-7d39d8ad67fmr414408585a.12.1749544319133;
        Tue, 10 Jun 2025 01:31:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cad354sm13794281fa.65.2025.06.10.01.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:31:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:31:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <20250610083155.cag3de7l727zkcxf@umbar.lan>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
 <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
X-Proofpoint-GUID: 3wLTJMdcC_Gwi83VC0ivCwRNxOqD62s-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2MyBTYWx0ZWRfX84HJVMs9JbQH
 /YKvAGdfFisj4n1dRqpQ9uBTO38UuH9fNAm9917ttzdlw5j7uNLWPiTWa77rdZg3tEDjzUkB0/w
 DUTF5eLGu3Xt7LHqfZCSfz/JcbyophxuqTYyTDJp3C35PeI0USy7A2K3c/c1IZA79GtrSkBPq2u
 tO/GuLdC4CWoH33OjNSh5Zxh+JoZw0qezTASK8aHUU92TfgFSrVL38rbeo4EZfPoK6U2h65D1J7
 RksrNPgJt4m1/Pycy5piH5jsZYlHAjwIPYf6F/Ydc6nEF22g0ugQqW0xnwBYHkxnHo0tsIaZ0Al
 Mfp9iwS4uh51oLBYC1s5pztzZNpjCUI2zrpI4NmdDJhGT0CS7Jq6QBNMl3xDxAE8yqtAWgF87u3
 2frogzH6pY/gimvxyOtOHSiTeFjwgILEgD19iK+RzpQkqWH09+yUk5DPAOQxB/ZfxpUDoxDK
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6847ed80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kJDM2j0BT9hQBkDc-9QA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 3wLTJMdcC_Gwi83VC0ivCwRNxOqD62s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100063

On Tue, Jun 10, 2025 at 12:31:40PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/10 0:07, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> > > Add support for Multi-stream transport for MSM chipsets that allow
> > > a single instance of DP controller to send multiple streams.
> > > 
> > > This series has been validated on sa8775p ride platform using multiple
> > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > > 
> > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > work but this can be supported as well after some rework on the DPU side.
> > > 
> > > In addition, SST was re-validated with all these changes to ensure there
> > > were no regressions.
> > > 
> > > This patch series was made on top of:
> > > 
> > > [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> > > 
> > > Bindings for the pixel clock for additional stream is available at :
> > > 
> > > [2] : https://patchwork.freedesktop.org/series/142016/
> > > 
> > > Overall, the patch series has been organized in the following way:
> > > 
> > > 1) First set are a couple of fixes made while debugging MST but applicable
> > > to SST as well so go ahead of everything else
> > > 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> > > of the work as current DP driver design had to be adjusted to make this happen.
> > > 3) Finally, new files to handle MST related operations
> > > 
> > > Validation was done on the latest linux-next on top of above changes and
> > > both FB console and weston compositors were validated with these changes.
> > 
> > I went about a halfway through the series. During that I noticed ignored
> > feedback, missing reviewer tags, invalid or strange authorship / SoB
> > tags, overgrown functions, one line wrappers, etc.
> > 
> > Please rebase on top of [3], review the patch series on your own,
> > removing / reworking all the bits that can catch my eye, implement the
> > feedback, ask questions where you don't understand it, etc. After that
> > please post v3. I'll most likely skip the rest of the patches for now.
> > 
> > [3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> > 
> Hi, Dmitry, thanks for your reviewing very much. Actually i have reviewed
> all the comments on Patch v1. Sorry for not cleaning up everything as
> expected. I will address and discuss all the remaining items in the comments
> for Patch v2, and will follow up with Patch v3 accordingly.

Please discuss the items where they have been raised - either in v1 or
v2 thread.

> 
