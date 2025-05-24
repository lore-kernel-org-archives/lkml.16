Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1698494
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748074303; cv=none; b=gsjQwQXX14UfUEf1uFMT5DG3BQlUR6Md3XsBxGvcO6vO/7Dzumb+CL+AVc7m33UE/lYMFRCxC2peEKfjVs8rRnR75Xv8uLj5tg1bBr/E93mLfhGx4bhDjBveiMXeAxpEhIPb8MjOQ8NAm4dGbHBDuW487u+n1cgrZfFVsO5Sr1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748074303; c=relaxed/simple;
	bh=uvuc86gKOWODjnW+UMCTvkJfo63qplzFHhIneB8zt/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/iRVy8s5lEmyoN9Fky8XA7Ia5koKv6RDScIeLaVUw1f+xnHvnr1RbGeNm79abkq+g8oboOm7kQZy3HUAsGv8KnAWmFz3zZfUdg2aVLygLtHnNFw/v+ZfeB2svv4Br/++3VXx40KboFaargX2l9OMn9nIK0EHrDQveT6bjkno5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OU1yU/ep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OU1yU/ep"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O2rBNi020968
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=; b=OU1yU/epswZPLPX3
	EaLw6wAQmJII3aCjx2G8e++6kSShC1uOQNWeZ7FyISn2eh49vSYnb9uPO/l6oTMo
	cSjjfkEP2cKScFD+l0XiDv997FNeF+qIby5KVSfIUNUrODDLvL1WV5dDZLC7e81j
	JLQJQJVtZDIH0wZlxdb3whIyQ36l1woQ7SS3lv1LaOmx6lqwWjLt3C252y7tmkpf
	gVoxXBEtmA+jRfK68RYdQYSjUWuHUnhenLro9YvyNlkMtEzWhwxvn+86rS9nGUgm
	Ft/sZXL/YCiQv5WtTN2rC8HmyJdV/muwiuqSvOwRR/v0RpAKnianiCdVQem5IOjr
	KqKOPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5q1rcm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:11:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a527so177254385a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 01:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748074300; x=1748679100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=;
        b=Lea3EKzSP847zGOg7QUjzU3O3KRw7VPEqWNMTEjUWY7AzGYUBhJwblLSRKkiWUv8Gt
         bjKEYPVy0LH9LvF17WiE09qPyt0nBN9U8qZNIz5Oz++rdjbO7xZJcs8Wtuc5/eZWl+Fu
         CfHe2x43+eT/kWL5jgkuFB1kkqIjCeg8htg4RiobVnq9syl3HdVwDImJVyrsAoj7jhj2
         YVnpnqhT0J3RphrOrAK/zoJyKsPEPGKlvzdIlRvBEm+V2+oxEuGUNRuKR5PQgTFDfXSh
         aVsU5gStqs8d5gLu981riVMs4mJy1U/6P8RZXyBs2cB7LgKDjQWWuESX0YxuqI+oCW9G
         iFPA==
X-Forwarded-Encrypted: i=1; AJvYcCVeJPWiuNjCfZfGge0fUQns6sYY/YonUAso7NxlYmMiMCO5I4H0hJI3ccGU5KPQZ9RbAqTqKYvUSe433MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Vi6L+q4cifAoDSFlBAPhtUh4Hj18awTeaB/eKbBZ42ihraMv
	bGQWuFelaLsaINOm1GgU8JZ8JgJi9enLqulmHV69KNQSgwoAwAnilCYpLzoMX4yQ/zPsQWvoxJ4
	gqwyxUlzPLGjad1q4nxKYDEhjVSjx5or3epTEJ1pSLerSY1H277IK9tNYWBYpgQ84zWs=
X-Gm-Gg: ASbGncsAE8ccrP7isna5IME9lr/0opDCW7zPXlTeGNkTwRFhJxu+atTwimyM8jAYIpK
	MRwmHWi0e7LGl6U3hS/jJBONe5A3Gw22WveRgpgletL8o2ypnzkJr0EdmJzBcv1fzx6HCLpxsR+
	9p+jF5oGA6JfM4olCQEuYRULQIw0bnE3HOFX+B8U8R5NglnEXOa2a8IYNfbOVW9C95G8lQEv5bI
	F28OKxZ2q48DYeXAe0wkO2woZc5lPIIAFGfiNdZchftzGEAZ+pe302XsYS3H70F/yzTp3qM6Ya1
	Be28IKm99SQ2yd5tJ1x2q/hHIIlLZyMKuIlfZAHEe0BuMLlfhQ4rNCNtOGNAn3gx7H83Xe/zs8g
	=
X-Received: by 2002:a05:620a:f15:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7ceecc44cacmr332738685a.50.1748074299694;
        Sat, 24 May 2025 01:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+51bBBWaUmqP+dgjFmfrbkOFuigtqEW7bD1m0xToXs6orv1NCpLgTxWoAXv/SLi3H/a8SA==
X-Received: by 2002:a05:620a:f15:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7ceecc44cacmr332735885a.50.1748074299340;
        Sat, 24 May 2025 01:11:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8efesm41722811fa.73.2025.05.24.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 01:11:38 -0700 (PDT)
Date: Sat, 24 May 2025 11:11:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
        sebastian.reichel@collabora.com, stephen@radxa.com,
        dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
        mripard@kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        yubing.zhang@rock-chips.com, naoki@radxa.com,
        Laurent.pinchart@ideasonboard.com, Andy Yan <andy.yan@rock-chips.com>,
        krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/9] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <osjee6ibus3kuhv7oqqvki2wdxjotjfgcnxarpovvw25jiwhqg@uburpxawk754>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-3-andyshrk@163.com>
 <2f4796ad.a2e0.196ceb908b0.Coremail.andyshrk@163.com>
 <hsrec7lguapfxdxulyncypdx5c2rzamcxeoj2kiojw3ukvi5c3@lwr6eriwoxdy>
 <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
X-Proofpoint-GUID: hlz0h7E5ZG6XqCjd5jrLr6WtyeoWmgFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA3MyBTYWx0ZWRfXz8dUt7ENcABG
 u8zYfwtTZbArFPXbhWYUbifiHfAc4dWePz9LgPgbsjPjvhRu0q+F+OUt97ll0PlvHZ5Z43TyU3J
 YM4HWx7pIXouddvRUssKEEM3UeXZC2vDPHDG0ayqToVtJX9KHRhf5egoK/G1lNDWpB9w82btvI4
 cn34McWUvQg/NagETyx8cI9ZTwZbofCwqN7TPnHr8Tu5B8ObpCtwQUwJI1g8Bbq/C9/Br7iYi4/
 Mrvn0py1cDqCI3SmH5g/AnVkiY+cpiJBtFFOlze1TJFUivgmQvDvXeGfsE0tespudML7N3PWMPS
 FKaaamqa5Mu7t2NrV5gsai6UE0rrLKGqtyrXU7jmIEDxi8BMa383WV2L7I8N2/5MnrifF60tzQm
 obv9rupCGHDy1aO4z5yi63jMkwxKTp2D4wOAAmNoc3iGjqrxH7+fdQYNq8/8hFrmYtFvJZRO
X-Proofpoint-ORIG-GUID: hlz0h7E5ZG6XqCjd5jrLr6WtyeoWmgFf
X-Authority-Analysis: v=2.4 cv=FLcbx/os c=1 sm=1 tr=0 ts=68317f3c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=rLSYf88_2vispd5-KzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240073

On Sat, May 24, 2025 at 03:59:52PM +0800, Andy Yan wrote:
> 
> 
> Hello Dmitry,
> 
> 
> 在 2025-05-24 15:46:15，"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> 写道：
> >On Wed, May 14, 2025 at 08:15:55PM +0800, Andy Yan wrote:
> >> Hello Dmitry，
> >> 
> >>     Would it be convenient for you to continue reviewing this patch at your convenience?
> >> Or let me know your opinion on this patch.
> >>  
> >>    There is still one unresolved issue highlighted by you in the first version: try to use drm_dp_read_sink_count_cap
> >> instead of dw_dp_has_sink_count. But there is no response on my patch try to Pass down connector to drm bridge detect hook[0].
> >>    I don't know how to proceed with this patch at the moment.
> >
> >Please excuse me for the delay. It seems Maxime doesn't like that patch,
> >but I do not see a viable generic alternative.
> >
> 
> 
> I still want to express my gratitude for your help. 
> So, could we perhaps first keep this part as it is now, and
> we can switch to the generic helper in one day when we find a proper way to get the connector ?
> 

Yes. I will take a look at the series in one of the forthcoming days.

> 
> >> 
> >> 
> >> [0]https://lore.kernel.org/dri-devel/20250321085345.136380-1-andyshrk@163.com/
> >> 
> >> Thank you.
> >>   
> >> At 2025-04-03 11:37:30, "Andy Yan" <andyshrk@163.com> wrote:
> >> >From: Andy Yan <andy.yan@rock-chips.com>
> >> >

-- 
With best wishes
Dmitry
