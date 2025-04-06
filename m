Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF313C8E8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 21:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743975408; cv=none; b=SkHK6DiTiiK526NzvE8ch72foFCEfDHcOBAf/853Fr2/N0lDghZX6A8Gwx7TStuKMqHD4SSyXdODHv5GcgjlPMIeLu/p7Ce2WSAVaEvGOVScfJpjgA/pyOFqiRClXQeSUTVBSfJiFfDXrBUucf+/QPclpFgcOs8f2AcofQHxBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743975408; c=relaxed/simple;
	bh=QIPh/3ojkhjZ9qgDVHKg/wBsn9s4t/UW3jZ2wCoHoWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgvmsVehceWbo/qKUF2HYj4gbtRofgCq/vShyBrO2aoqojU7Y/lRCmf8r8i7vpLllSmU/gynqy7tVIy6A+JMw0oej22IzqCmF7q/u9fQUfSgHkWxs8A9J4ma/Lzfo6aANHnmmMSWvuLRVJsrK1bNjbICny50I6Ofh3aOm0P6kgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGyNsMyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGyNsMyU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536H1492009224
	for <linux-kernel@vger.kernel.org>; Sun, 6 Apr 2025 21:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LA2b95tB59ohrGjXN2aVGAOl
	vonTQAAFKlsjkjBixBc=; b=EGyNsMyUldVu6C5qhZQSv7k16yAgHi5EqiOUGDiY
	F9qf+RuVJefw06PwfjKDTVaqq1JvH742nks58yEepT+NBd1L3Q0XSp8bWf+LISRZ
	2oCZ9hP+CGLZkRd7umFBMjyyszsdBe4gKiW4EVLnD9sKDo8kgXnOMgbl2lIKyxKu
	OGIFEqF+Vb9u+x9bGfUerRo98K+6KWTACuYHd8YXqZFruNY/e7IA5FfqSgTBJAlp
	MBLISR8lHejDqwrb3+s88WASZ8ODDCdGGKPWgN8MYd58k964+LYIOCPLCaodUjYh
	78b5kRq2HtpqnUukviQBgKgHzV5YUlPDLbk5T7JGO7Ke9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe2cdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:36:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so670887785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 14:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743975405; x=1744580205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA2b95tB59ohrGjXN2aVGAOlvonTQAAFKlsjkjBixBc=;
        b=MNCKX7pRSp3Gym3gGRR5gKflP2m2smKqXGP2Qfy1bVqNiDcOSsYhNLTBh5e+6vqYtx
         +mo4ETsMV4Q0DJv6HYUrlIqAkx6vAdE4Uj1ThOvmXuqqm7uc+CPXda3FdrX0FRzsuvQk
         yI+XP3UatN/J8guvVplNrFibOlVwj5oS5JKKGhGXV/Wb0Oi/qfOEgm76qF3x6t8v8046
         6KZHFxkmgCgkhXVpttHkPD6YHg84bVBr/aYRdW2Qg2/zlBLKdfJWeL+NjtwrdMPeojVF
         he2Ga3BMaEc73ur3LbBTQlOxX7kkJm6vooNp2DHe4E3Plx91LX4+m6V/vP1XwAaL7So8
         djug==
X-Forwarded-Encrypted: i=1; AJvYcCUvmDlwKmWWxwbv0JIddgFhl5bBjd9Ci54pxXVQGCN36396ylwQFWDqXIYEQmsa3+RCCvD/0+zIwWCRH6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmx+eW3Uu4K62RzdBLEvmE48+gEor2emb1whSy3eAwJES9tZhU
	MIM/5pgpQqkkGXunm7IPdWCX50VyJO4uVFjvb2I/+LdsRD3Ur0CGD9VQgWysQc+W5fvAVHRF21M
	92uaIysaeKK7uhz3uzTU1RmytiY5hKmP/oksCc933sgfeTU+XCojBlzoCoU1v620=
X-Gm-Gg: ASbGncuPUNE2mFBZqjBdnqy/+fL1WEoKyHUmbaDAkzCHaYsUECW9K+lB+MG0BZfk9bS
	v9A/rVvg2PlzpMfUVeJhpFbsFb0NFX+6/7JZ7psTHzujCE8MCD1Ybph6Cg4x+nooQ8Zjv71NxgG
	lXI1uMKwPgcsAMDWPNztzv/68tT1IxVd6ntuN6jcfdFF2uY4d1l4pS05g2AL8AXeeDRmZa8tpAh
	JHiR9kE6gattAI+K0tlbJAJVNnt2U8pe6Z0+HAtOq8L9mOGJka5d5XnV2Y5qETZ2sh5wxWcYEkV
	P3IFLnHtzCNeCOC+CaXMiMniiQpAUSP2dSoAhY96f8js2e71yw3VwlaodVDLyUQ0lFybZ8blghN
	hxpw=
X-Received: by 2002:a05:620a:170a:b0:7c5:aeb9:b156 with SMTP id af79cd13be357-7c774d25490mr1222759185a.2.1743975405033;
        Sun, 06 Apr 2025 14:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXOIrDHONKlmIGfRGduQF9wgQXrsQc1m26S1z8TJbNPef5cMDCD02IbAks0R2tS+ktHBCXFQ==
X-Received: by 2002:a05:620a:170a:b0:7c5:aeb9:b156 with SMTP id af79cd13be357-7c774d25490mr1222757685a.2.1743975404737;
        Sun, 06 Apr 2025 14:36:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e63708fsm1037160e87.124.2025.04.06.14.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:36:43 -0700 (PDT)
Date: Mon, 7 Apr 2025 00:36:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] extcon: adc-jack: Fix wakeup source leaks on device
 unbind
Message-ID: <brvru6m6fkvxfqr5w2wxirrwgnuai76ciaqvs6jwtkzji3kq2t@jebft6ckvgmy>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
 <xosjgzwpwz3rnqt4wybekzuaag4na7vbfn6et46omkqyy6nvs7@zqoswpjy6srh>
 <80a8a1c5-843c-46e3-83ac-93e5af3aad67@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80a8a1c5-843c-46e3-83ac-93e5af3aad67@linaro.org>
X-Proofpoint-GUID: IgesSM33Wq0GvkUfiM6mENUkJoS2X9gR
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f2f3ee cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=3Z5a0wXc1gOgKeFd5GoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IgesSM33Wq0GvkUfiM6mENUkJoS2X9gR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060158

On Sun, Apr 06, 2025 at 10:43:35PM +0200, Krzysztof Kozlowski wrote:
> On 06/04/2025 22:27, Dmitry Baryshkov wrote:
> > On Sun, Apr 06, 2025 at 10:16:39PM +0200, Krzysztof Kozlowski wrote:
> >> Device can be unbound, so driver must also release memory for the wakeup
> >> source.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/extcon/extcon-adc-jack.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
> >> index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..d7e4b1418d7e6b242780b3511f2a49def3acb7a6 100644
> >> --- a/drivers/extcon/extcon-adc-jack.c
> >> +++ b/drivers/extcon/extcon-adc-jack.c
> >> @@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
> >>  {
> >>  	struct adc_jack_data *data = platform_get_drvdata(pdev);
> >>  
> >> +	device_init_wakeup(&pdev->dev, 0);
> > 
> > s/0/false/
> 
> Sure
> 
> > 
> > It might be better to use devm_ though
> 
> Entire driver would need to be converted, otherwise you got entirely
> different order of cleanup. I explained this in cover letter.

Please move this to the commit message. There are enough developers who
skip cover letters.

-- 
With best wishes
Dmitry
