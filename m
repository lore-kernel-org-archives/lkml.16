Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2FD21CC41
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460221; cv=none; b=bFceZF90tNescUjPrJ9D+/k7/QwNo80KWdU5JtkERrixx4r0kfbQTeffMAyoxC5pEKOqTIEHsjrNI0s6KP+kqiFnHfr2ppHOk2MpUzLGkYhsN9SWD8DFtn7In7+mfRs+4ut4ZiXJ0l08Ich0HX6bSmYk16JuMi4CSUZPkOaj/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460221; c=relaxed/simple;
	bh=YtbJtZ9j42kmjKldmJQf5mvGbou/uTiDwtCn4zRVBzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIe9WYNZVns7ORxcFH9e9R+hB+auWSSdN9cPvla/KYdQu5O+UReW3v7oWdafW0vMzzDdHB1YCxBTP7wxGYf5AErq6/X3xEC0g2QoZmd51SbpoldLdtC9ZT2BioWQu2BAUKuADIYZXjNJHNqnirA13mfOx40v7XTmAxFczfjHoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhTYe1pv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhTYe1pv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SEtPZG002206
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkw5mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac4878cfcso1861006d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=U7LqN7m3S73gwITgKIZRr46WEG26NvxM5yT/cjt5DoTgH5TxoG1NDyaTNG4FWqBQwR
         dD235av2NEu1gCHRTG3A+ameTVJrkpdWomrH+LYQATgFSQmvpeKut8toBtv7QCw9Dph6
         lP4mI+dH0l4Du03RXLeankEFdDtCwSnAZmHJv1EokKr+9Yu26LAQHHvdX5xhOf9nMoYF
         PPDvpPf4R+uswCV+dOKYbL4CZxnUk0vqhbrJ+3mOIDbs2G1KZ8sBh878woXR54ARc6Hn
         fRyO4n9jeRxpQf0yOPS51ejK+6b3xd3O4PfKsYBLsDpg4wtMFXPeyw/19hbggzw4evKv
         eRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRCx/87gMWK9PM3MRPJI86wnzkqvJPhGJTtUWwRYn24R1XPcOhWORwe14wo5nIUuDY0jRwAo5DGw0bKBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkrecbRwt3+mvFDDHO3rPIQ/YR2b2eV0mNpoS8ptS36aRhuLFF
	eD3cYOJkKJNmrJiPjwdj+UAqljhz+YxKtLdqJZIohnnR5SOjMP42vVnD6baoBbs/4ociTU3YN8f
	fIEnPGw+HfqNbFLp932P8jRzOsppuvBbj3PWjHWFTmNElfwctAsFKkZDPvSK9K5F/R1Q=
X-Gm-Gg: ASbGncv1I5VD9DwpoSZrmXnsZlDK37KaERAZmm781LIj0PkaZKFENMsoMQmv1V5VFMW
	66OToRlJwXGPQ+XcAVADOaw8S5u0Z7JKRZN9t1uivODidDsl1kH4GZZPsmOCMwOKIpChcTObNFt
	29JEEo3QL84O/39BIQbC1gq+YvWKkJlAMZEdkcyQxpbG/ORIs3LY9BKnF4YijdlXEKtfFI85HnD
	ndp1Ji9FW8L9SDSsr6Dmffv0FR0KVWqmWynw/OUNzixi20svhOiiTsWCoglw19gPLFwdtsB3t1m
	ecPu4OusLKC5rM+lvxZA6hO8z0dyNUsbYT/59mkf9Xz9j3RLdbSVLUfgZsZX0/i/c2EUmLd/8zU
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028046d6.11.1748460217320;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Proofpoint-GUID: R8nqMKNtVhgfuDuw_6gG-nWLgqNrzkMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX300Gv60+z+Kn
 oa+iB35jpaO+6vvkN1kesFqzYXthd0fFIDkyVwR7KVJ2Tr23zVjkS7YlD+xb3LrjPznclKdeJ9J
 1bhl8pQ2QQDPOqKjdOaKRBWUdvGjBpzVEb8XJQZj+jqcqTYOREll/XVTUmSx+RRxZRt6CKjOiRs
 YQOP5/5cOvrr4JY23fcRAonuai53aMcWxE4I60eSp9ipFOyhTqlqP97zaH/tNlBZDVvJVqNn0gS
 NR4BjKVv/ewPp1K47RK6+fcy4o1ZMkExMbirHRc0bAs2V+PfR6gUr7UuAUziDNyvFc1keEEi0uD
 3k2VQpczSgglfAQKo/q9tYGMDZCi5nMK9U3MlpYCtn8PrfPHO140y74unI5soRomszZRHzONBjM
 nP+lCSLc6Qelss+K6UJFOaRaUGp6oxUxia7BtzCfN/nMmwHSsWxYrUReNvYb74F4nbQyVUR/
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: R8nqMKNtVhgfuDuw_6gG-nWLgqNrzkMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=436 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry
