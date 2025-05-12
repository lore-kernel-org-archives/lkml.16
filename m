Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967A253B77
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068196; cv=none; b=hFnv868GFDqoTAoDME1JI+mqdVPeOUzzfsMjCX5F57jcPFMv50TnV0Z8m3u5iz+Nr7kntAbxa7xw5bDTzF7kKV7fX8dpArxXvv2mcQj/PdNLV0TQdTS7kArOr4mGqKkkNXyHphrA5WLmEVKTl6pO9dB9lsF1pbVYh3FIvrFySEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068196; c=relaxed/simple;
	bh=UHmcMn2rDutZ9zovLB7kDC/1L+cADKDjKAVwTLzKdGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv6STYyzPwVXjD58f8vlD6KDSoR2gymkTG+ctQPq2etBVrTxoNvm2/JT4h0mzm/65lXjN9NkmE8+QRaakiHb1BWBy80MX2mUnwhcJqOLygLzrB7lHxczEGs+frgRxvPhi3qVZicIp27ie6SprR5RkGCWpHefuWMS7qDUZWYRLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkyTVIL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkyTVIL2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CGS8iq023248
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxel/jbRossn9GkISDGNrXtVJDHleFN7s/7NAEibyfc=; b=GkyTVIL2HViKvdBh
	Xd7AgtsdxoUuQVJXfuRqdzZX1/MaWsFXeYE7UdLdqAaV8Hdyo7Phqi7G55o+5DHs
	QiIXfC/b7f8JRECoFnJ0Ol4qQN/pM9Z86211B1BycyjfT7UWG5ApygLtnXoI+H/B
	DnJEF5QKXqha/qYepPZX207TdZpSUB407PvDvRVlt0Dl0emTeBjH+NzxGJcZ69mN
	Q4ESC3GWtcJA1/1Ls5gUzBSQLPyfEsnStq9B9EfttRKxRrAX2Ji+bobwse+0iQdb
	hXTh28OULF71Pt4eWQ7dsZLqo5G6s4qjbOhS/pj8D7dln1AoRM3YJmc5dnJx6Ymo
	5N7oNA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfehh7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:43:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30a59538b17so4500223a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068192; x=1747672992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxel/jbRossn9GkISDGNrXtVJDHleFN7s/7NAEibyfc=;
        b=fKvOn7X3NvkMOSrByRsvhJhjMwAZ9lGDYIdouRsDC6L8I4Db7KZngEz+orS8kE00Tf
         qgtnG+ft5dp5rJKf6DDNqnLM1jdnuIEb4AqmjqYG09VDBFQffvYLZ2lsasDIjerZOrOJ
         QL6TWXeyK08RdoKulGwBAOuOrxy02ilkSk8qkZwLpMVc2914uMhrG9rcIl8Dqrlp+vVw
         zrlgz5AbfWAAMtDektq9v4na4QjHa/yXw9IPVIBN2UNfH8+sk9hzNhxIUEZNitDGacy1
         gtne3XjHUxE96WW2gPcdc+pkYNAlBjF7KcSy9Tvrbq3VgL+NkBYSRNAeZrzlCJ43nTiT
         VoRw==
X-Forwarded-Encrypted: i=1; AJvYcCXKu0FF4VoJOKjAGkQEhK3oftPnP1U++pxQcR6ENKws4S0t5N8jWYbIWoNXXZlsonZZZ91GzDkF8BahGMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2KBsihrqAgdmWnaGxmO/iKeD6QLV6iZ1bdXaBeAA0gLdZhny
	ytxRNsa4S/04qMS0/+8CYZCQc3WtPHufrLLWOG3ltiVKZsV4aYalfkIq391196sH1nKqC9r1IRB
	wX/uR2m7MnWfCEn1mQ3qSyCpzgF0xkPd1SdhIfaLvAOik0wygR2UMACh8JO4daZc=
X-Gm-Gg: ASbGncungGGhRqJNvF5JUh9YYrROp+ct3dtFHRdUvWmmCJ7W/WRBT5+9Rs//9D532Pf
	P90goB/FCCX856M0XICfeEICXKqPXSMjEoN39y8GdEGyF51rEFaqWqSTrp3agCCm3VWLrlEJ8L6
	rRkC/3AmmLVcQ94vZh3qSj3+Rn1SI+gv4S6BN4qBJLxKhSeKDai/Wxupobi34m65HjtkECY2P6R
	Waj/fb+hAFDbfjKoQFm0CcdB2gWNNyA/y+fZGCejKyBH+EU/4QINy1Utr3q9TuBQgzELUf/Xuut
	TrRef+N4T8mbScIzqgISAqy2rH6plPdf1KHfqFKskryiQVi6+EbeS1AYd/xyLtol9i2l2IbhxCn
	LMoVg
X-Received: by 2002:a17:90b:278d:b0:2fe:afa7:eaf8 with SMTP id 98e67ed59e1d1-30c3cff3e4bmr23529277a91.13.1747068192607;
        Mon, 12 May 2025 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgbdweM2CF6nIrd3b1pn2d7bVcz7M9vjQtIJLX1bht9VCuwBchC75KEpw5DHvZpY2APUtCzQ==
X-Received: by 2002:a17:90b:278d:b0:2fe:afa7:eaf8 with SMTP id 98e67ed59e1d1-30c3cff3e4bmr23529248a91.13.1747068192210;
        Mon, 12 May 2025 09:43:12 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e757d2sm6927597a91.40.2025.05.12.09.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:43:11 -0700 (PDT)
Message-ID: <433d5f82-3ca9-40b8-82e8-acd647f55d67@oss.qualcomm.com>
Date: Mon, 12 May 2025 09:43:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
To: Greg KH <gregkh@linuxfoundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
 <2025051001-undertow-unsolved-3aee@gregkh>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2025051001-undertow-unsolved-3aee@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MiBTYWx0ZWRfX15E8+yCMa3yU
 bMD+1zwMGrvTIF0IYVUy6MC6UCDI9hNRK/rc6Yfxeo9P6qgsSQYlwL4asCHl7LO9jQe+NIM/3sD
 NTu/yqBAIHobPTDnrPzDVPacxYmIq4odEFLSB6efjSU34dLiCW9KJiLvedSUPwp7RNnyLx8+18L
 whSrO/cS3LJbF+HZ/gSwxzVnABTwnvq+DssPufUhmt1msV1KprDD2IL3BrwuND9QB7TQP4+76Hd
 eTd/qHvcs4aV88eevgQwTkBAcNI6KtHyzD2kORQCl0rKhq7CH5d2mBQJu55VwjNb1U2UgehLjMw
 UUXkTisBKd/MBZz0bWlm0VNtfuvirO5w0o+LFQFOyEJhc1GlMby05Mq9p8U6cXN+OtoiHQiVoO1
 P1O9rMHPIKdtsnviawcMcihKIjHPj/wKgIjJf7PH9rc1A9r6srTHvAvVEkvrp0VTQ4SkmZW+
X-Proofpoint-ORIG-GUID: OBy9PDO-J9MdGbeUb4fvbUueoAfiiiyU
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=68222521 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=wyiu5mwFrgxmc5q3E3sA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: OBy9PDO-J9MdGbeUb4fvbUueoAfiiiyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=794
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120172

On 5/9/2025 11:18 PM, Greg KH wrote:
> On Fri, May 09, 2025 at 11:34:30PM +0300, Alexey Dobriyan wrote:
>> Require set of curlies {} in all if/else branches and all loops
>> not matter how simple.
> 
> Sorry, but no, we are not going to change this long-term coding style
> rule for no real reason at this point in time.

Is the infamous Apple SSL bug (CVE-2014-1266) a good reason?
