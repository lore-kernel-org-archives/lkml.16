Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0DC13C918
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452125; cv=none; b=XVLn8Zxsdq0QmcTeGThhsJgh+9V1tJy99RvwoLtbTwcopnR9P0bTXxy2eKEe4knhkcmEzfYemlXWpSw/LyWXfShyMkGwifUg+fTf02OTQYoFPUtN6mFj3u3WTNRmKp3nXwtm2REkU+OHEXwczK55s/7v9dM/nMQqqik10Uf5gFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452125; c=relaxed/simple;
	bh=oEJY2EVDpbVKzLnNdc4SsWD4KYiEEXQWdxvbRXqQlzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PK9GoOdA9bl9XhLEi5tiYNo1C/P72sjxTwNPONtV2rqoDl3OKazD+xzNFmIO7FzBcWjNQ6/t7c/jY1dIMl6kOIQ3wTDNxWCsdYhzBy9wZ74WvZTm8F/Ab4rMk1DoIySArsCtn2Pk4wtVQp2cJhSwoaYUWMzM7EPS4xH7bOiUu2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl9sGznp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl9sGznp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFD4ea026983
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P7h2H2RFCRb2YsO4A892b5k/
	ijCEEmlIfVrXjiYPjNQ=; b=Zl9sGznp5LDLRfqQ2jmXtpyabN7IlCPZdjV1ocVW
	jgp/gRZQ0npLfeT0UsNezchWnplSBF3NgKh9z/SytoAyX6nLVRLWzfUSQ1rvwhgO
	aWlk7bFhQAGXglIUJfcxLitiThKcAUYzVn+/Uvv8M+LeTY543Sv+5fGfyiNq3xSB
	VflJhDAWuwESJEc7/DaNmpOOrRHAIc3BR135VoQqw3CkT1LeExzEq3JK30qbGwiX
	Tk0tz4QHJiYCY8SJr2f0leGDaZW9+azVK+JA1ndTLpTbMmIlvhr4JQSvddErcNHl
	9uIwvkuvgutYsv+aklVAoaGSsjf/k2iaLQKdHlJu8/hOCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhnqs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:15:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so380112285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452121; x=1744056921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7h2H2RFCRb2YsO4A892b5k/ijCEEmlIfVrXjiYPjNQ=;
        b=Ar+cz70l9owRxue6xHihC7jN6uSPoWC0YPeLq5FSBKfodBi6GWgdIgh17RxTOpHEhr
         /tHtsOyL3052Q7fjEzNQQxndXeK+96VFtgUkFD7O/kB1OQpGknJMr2iTbxzJtQki42cq
         C+ps+sc9bJQ2GSZimCxXlgn0L9N/Cl4ySSoMlkGB+lRB3nveNr7I9E++BK6ADWAZNbPf
         tkRKkEr2MzeTgUbeptnnkOpjV6FLSp5irwg5ynZzBHoIknAdlFBscBbxVagfmJ/DHviR
         jFehvXEnICwSLeINssZoQ4hBtzQfamycoYlmPE4/BwQUQ21AU03q4I6SoM7/1m8zrWQ3
         HVXg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtsEK7RpZCXSr0pSL0WumcRIAxkydBELW806McXZbesXd7x8Zafa1c7M2HKLDE5B6s5PziR9vpcbVs5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YySt0133/4jgeOJ7qbqD3RgeeGVBp8SnQk0ii5CVTNhyIfwDDL3
	Uo+mDThJ0QhRP3cMQWqR/8xAHdXeMP1ONA8Np8Q4kk23sf2EpUmC0MMzpugKT5nK2BknbLVdAi1
	CLz+yEzl35XjgoCo7aqT/x/0wYY3r1bMKUyxd6mAkACEpegQ+kM91v6EK8suzCHg=
X-Gm-Gg: ASbGnct0Vxtp7x76sSurVcK+Ld6f7oSv14XwoAWH4Aq2wWGl0eKdp7jcoWHGXZFfNmr
	SzcmWkFvX5kcby9xh0GWG9syPnbW56d9wdmnJwE9n442hfSvmm+NaBGJlcQqAlrRpR44ZUNPNVR
	/tkSBGPynLqtT4IBi6H6BRJKvClzS1prFU9YL7tycLMBxbX7ITmPvP3TllOmgnkWWK3gISFFe9t
	D4Xtlesv0cm7rVXxQRSWnWeeimBIbATKuz5S0H3TBYRgh3/Sqa+Yw9k8JnrLN5vkB2p1kQmXu6f
	MWwh4oDLoPWjSb/n1UG/7LX7A5sXY9casOrqNabqfCndqLciAGEra4BD7CAqH5+3o7rYNeb2O8/
	DvvU=
X-Received: by 2002:a05:620a:280d:b0:7c5:592c:c26 with SMTP id af79cd13be357-7c69071e24emr1336194885a.19.1743452121300;
        Mon, 31 Mar 2025 13:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFygEmRexkMbZHd10mpwj4qICazFurscUAIaegGy19d58q/5qJ2VH9/SymkMH9e6R4pPM1+A==
X-Received: by 2002:a05:620a:280d:b0:7c5:592c:c26 with SMTP id af79cd13be357-7c69071e24emr1336184485a.19.1743452120123;
        Mon, 31 Mar 2025 13:15:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1682sm1203296e87.66.2025.03.31.13.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:15:17 -0700 (PDT)
Date: Mon, 31 Mar 2025 23:15:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
Message-ID: <siktv5i4fnkbjgzfwkztp3px3cxlhxuoxssmksr4ww5voe5heq@ttzkhisnyxl6>
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com>
 <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
 <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com>
 <Z-p1uADNVAM9NcAW@hovoldconsulting.com>
 <CAMcHhXqO2Ej3UAej9QodX1NNCHAk956++=oakPxx-MkpOucJ2Q@mail.gmail.com>
 <Z-rnvSKEysdDyj4s@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-rnvSKEysdDyj4s@hovoldconsulting.com>
X-Proofpoint-GUID: J9jGPjLyrwD4sYkpa2daTfbH30GmYQ7v
X-Proofpoint-ORIG-GUID: J9jGPjLyrwD4sYkpa2daTfbH30GmYQ7v
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eaf7da cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=OER9kIcIPobgsStsnq8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310140

On Mon, Mar 31, 2025 at 09:06:37PM +0200, Johan Hovold wrote:
> On Mon, Mar 31, 2025 at 06:51:03PM +0200, Aleksandrs Vinarskis wrote:
> > On Mon, 31 Mar 2025 at 13:00, Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, Mar 31, 2025 at 11:38:25AM +0200, Aleksandrs Vinarskis wrote:
> > > > On Mon, 31 Mar 2025 at 10:09, Johan Hovold <johan@kernel.org> wrote:
> > > > > On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> > > > > > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > > > > > combo chip using the new power sequencing bindings. All voltages are
> > > > > > derived from chained fixed regulators controlled using a single GPIO.
> > > > > >
> > > > > > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > > > > > WiFi/BT pwrseq").
> 
> > > > > > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > > > > > X1-based Dell XPS 13 9345")
> > > > >
> > > > > Not sure what happened here.
> > > >
> > > > Bluetooth and WLAN definitions were missing, as at the time I only
> > > > knew the UART port being used for bluetooth, and was missing
> > > > everything else to describe it.
> > >
> > > Ah, ok. The above sentence looked like some left-over copy paste. I
> > > guess you don't need to mention it at all since this does not seem to
> > > warrant a proper Fixes tag.
> > 
> > It was a suggestion from Dmitry in v1. Though indeed it does not
> > warrant a proper Fixed tag, as it is something  that was left out from
> > the initial series, I think it's fine to keep it like this, if it's
> > okay with you?
> 
> I think you misinterpreted Dmitry here. He just said that after you
> added the reference to the commit you based this on to the commit
> message you could add his reviewed-by tag ("With that fixed: R-B: Dmitry
> ...")
> 
> 	https://lore.kernel.org/all/ou7w4hvbbz72nzrm45gfhpq2uzkuwpfudqeh2o34tcnbnazxgz@glmuryu5dh3s/
> 
> As it stands it's hard to understand what that sentence means and why
> it is there (looks like a copy paste mistake). I suggest you just drop
> it.

I disliked the original phrase "Derived from: commit subject". Instead I
suggested a different, more standard way, '... commit abcdefabcdef
("commit subject")'. With that phrase in place Aleksandrs can add my R-B
tag.

-- 
With best wishes
Dmitry
