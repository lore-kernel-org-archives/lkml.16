Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B3155C83
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609843; cv=fail; b=sFDFB/Z268b94BnjRTYPGhuyoyuh64kS0xHUVsatmxm72jw8ke/jglednDZOG64eoOeIjE1VaHWxs+LyLIgNQkSCae+xs9ICXjj9MYeUg7N3RQ7AhBub2JERWi0IObwX8w0PslXFd4eCtLYQRWVZViyMXq8/dBv6LWphGjQR76Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609843; c=relaxed/simple;
	bh=76+Vjasz+/N9hZE18YfcGzENDoafOCVYyqO/UjREV54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u501t5prJQtR6h7MAQg+UdEYQejzFnzqg99lHUaYiD+eQST/q4Rf3vuL6GCbfRDo5mS8xOh/FM+aq5O5rrSkyCpjNptlXRKCMvoCjc2Dsd+ea+XFFkVa2ZBbXQpaf43/ca0uR+qFg5Me7kfofgWnCYCcRoA5Nz7u1RIeS4J060I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f9gdPRNa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RCD0C+81; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f9gdPRNa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RCD0C+81"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54797BeK016862;
	Wed, 7 May 2025 09:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GPDTcH88Bsgbyb6zLr
	D6e+yuGwck1tSNvw219nbdI74=; b=f9gdPRNa+xv/+eu1jgxvhqS2yUxOglb9mb
	JDR1q1xzlWO7dmvMIfMCzLR48l8jjWEPKTjio4CI4T91e3zmbjz/mzGL1+/4GXz/
	bKYNB3YokgUlVsfjyzESMz6+RdyKeWl6EOEpuQPVJ3pub5/0mIc7iP2W5fjWceZK
	8dh2u0xJlkOtzVi5yHPiNpCOycwuSVoun6+/Nj1gGqw/qThvYDJpKLPsd2HOmBgr
	YdxuKyNOLpL7obqoU63LJGfbzwBM0cOXYm5boqmzjh6Lq8sS+0nJGmLSyFzM8tm6
	Ft5PE7QaL1FmBCGkJGWGfQF3RGDErWDoZb96ERKZltsflIeAs30A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46g4ku01ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 09:23:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5478iVn9007308;
	Wed, 7 May 2025 09:23:47 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010020.outbound.protection.outlook.com [40.93.12.20])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fms8rc4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 09:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clCArCCAh+24vUppJuu8+UST+jdiEFSQzn4M1yLa68mU/xCwlhR6LGDej1dSaVbebV0CZNXBdoIl1z/baXsPJfD0oJAUDz0cIeYgiKTh/gX8LZY1yrcMcHXWPxQUSAGoPhqddYnvV2OyCPSfGifz10Oes90A+RKtuMFoCmACRvZYKIppDC1f30qXPXwOEUAyMxtDbbnHU5dl5sbtGni2cNNphkyhXSqCBwSvky5JXvGC47+5QfDxbF/EkafXYyYdM6GWsqY8FxLwF7GWxGF4hccV3MR8OW9u3MIE46Q/jhKbJ5gU7EXyTuuBAGTsR3ozNoS/bj6JZaDJA/z316jRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPDTcH88Bsgbyb6zLrD6e+yuGwck1tSNvw219nbdI74=;
 b=hjTu4SC5OfOUQ34/Iba/W7hDhR61lOdf0rQvw0BKT2VkoGIoI/uxniM02kiClX08VW/6n1JAqZrTPh2vsDIKcVXCVX02WbNO8FmgDRo2ShLOA150TL6RHs9aioM+cM/i23RU4HVMXP77FpoapkIxnDi7+z1Tn3FO4Fh4XK8bzBPYLQ09z7E6iC+T15ioz1H1+2L/E/e74YtbWXEMHZ3xuq01wsameGK64klVSl/NxgqKlkDizOyNqRQkETygDsYz4K4ova67CO+wPzepdC5SOSQQ6hxeIfXQrqoGHXd29LXFtP+6y975fhjVRsCVdg9nHG4kEuYPmgzdgpPCgWwgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPDTcH88Bsgbyb6zLrD6e+yuGwck1tSNvw219nbdI74=;
 b=RCD0C+81doPqOEWXtMH2MWHUQ5QDsuMD8uGY/Khf0XI5K0Hw/lxKYmXGNf0Kc3vLMTGcB4z59c5lIJYRfTeXax1eO7KXm8Po7RD/5ig+MLlj8r1lOpAHtoLmjcGLk64R//Z600yw8so12Xq0r2Zrpk/IfVCmeUwDvtT5Z0+ngQ4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7350.namprd10.prod.outlook.com (2603:10b6:208:40e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 09:23:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 09:23:39 +0000
Date: Wed, 7 May 2025 10:23:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBshiBX_N6hhExmS@pc636>
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ca211d-27ca-4b2b-955f-08dd8d48da40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jbu+/K087JMa58QQgnOMy4DolczSLZfSndSahrQqyXVVzcSMpDGVxzOXoLsg?=
 =?us-ascii?Q?7DarTXzXExoKIzvHbInHhwL1ozgK6bNfd7dtGx6UVssvDI7TV4lKoht75X3n?=
 =?us-ascii?Q?a836kffAldl16zpwCkyo85Jmf/efcbISiRuM1CB2PuVYC+aXr+Ysbnx1FPht?=
 =?us-ascii?Q?y+xO9QHIzvShyzaCQIuSI0iFw7uPBhxxpVFOuEgd997yVpXeFOsGY7MYFZrp?=
 =?us-ascii?Q?8P3sf7xS0pJWd/0As4s9qauyxXZAik75Q9WZ8KQ+5sQ7q3ltMMTsWdI0/v4e?=
 =?us-ascii?Q?itlF6ABqATPQ65YMjufcoZAp/N0lwhzOVUHpGReyTKPSVT8ahj54AY6OZiQo?=
 =?us-ascii?Q?sfDHK9Upiny8YwEubx6h0GAqkPpX2pZFtn50S+9pgGIKHFTFjg4Ci5keStYP?=
 =?us-ascii?Q?auoDGbbV/OGODIRmgjKLfP22fu3UMJbIBAKecQou+oyRl6G8m9n9AbjTl5Dn?=
 =?us-ascii?Q?UgBy0KA1gyw/eV8PtuyTI7ziObfqrqNMY/i9tdSxNDNea912/aPSO0kdMPEX?=
 =?us-ascii?Q?1p9IdovAS91N7rQLQUQxw58Hj3PCeFyLPfU97r0NwVIK+rInXlQfrpKZF77I?=
 =?us-ascii?Q?AmVpBFREm1uEZpIGU5TFB1oCtg+5MtneC6k0WZ+Jqij7vzc1qsbGRa5VOgwI?=
 =?us-ascii?Q?/f2geGTcX99aJvgUuLCUvjL+z5xRrtVOOlgqr/sUp2HpXegrKZMOaOEMWsiP?=
 =?us-ascii?Q?dVFzw+1+3J/WJ6yfUOpmUyFilT19NmMtNpC8EQxl6uOouDzmx0nU/MtLs4qX?=
 =?us-ascii?Q?UCwoYqr6sEumShMOQk+3s4Pxq99TaMak0xveLFJ2/+ux01w1HsWAyWaX2m6q?=
 =?us-ascii?Q?Q9wE2/5+I82i/C9rD/0aBvvdBTV+zXMKoF7+RPlI7AZqSsIHd4BCaEGcIaKQ?=
 =?us-ascii?Q?FScjR5B8BXXthCnwGQzbJ/2/1luccFX0VTL4i9d49g9U/IWzT8WtaseGE8e4?=
 =?us-ascii?Q?ClAe6rSvh9leqjaed47Nq5WNct5juEZyOZlr/ObOFuThRZLicG39twdbBzFZ?=
 =?us-ascii?Q?exYUuYa9c4HvmKGQj6S/mLqtMfAF4RKorBc0NPS4cjfit8Ufq3VF/GnNeOzP?=
 =?us-ascii?Q?UVUb+URVzuJLN4Brc3eV3zUgBnKH4IhK6EdotJYhnFkd0/SDXWqdhOsdnU6o?=
 =?us-ascii?Q?wxsXz2r2wGwlki7MpQ4V8h4u7oDcxZXdSiDmtdcr5RxBA5UFInIN6iyDmXgz?=
 =?us-ascii?Q?Cjeo8uLqSquWzizz6WhjwTGAy8QTrPf8hBs/2S7Eob4YnDe8ZJKD6TJxr1U6?=
 =?us-ascii?Q?bXSxS2KqpbUAbdcw5I3XtGaxDojBY4e5+G6cbBapAlvfn3M4Hs4vGsRO4CDt?=
 =?us-ascii?Q?kcq/GU09+3Nh5NnhwRneXmMVPKpbcNGHfLWrv67gGk5ZZAvAde7V7X72dWQI?=
 =?us-ascii?Q?ZyIzT99oFozUGad8QSwGzL2j7Zvf/4OpVYt37dh0Y17LdwzDgCyIUdX6tN6Y?=
 =?us-ascii?Q?k01fQ90fhZE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ek5Jrxaw4NBWDQeffc+K9FWblu9zZ4CxlBz7zb26Lr6ufC40qVu95EMpm8K7?=
 =?us-ascii?Q?KLbgMwePN4OQOTMlI5Ot4zj+cPuTGQdOz/4HP70fJmgoQLonQ5rJKaDIJzbI?=
 =?us-ascii?Q?cpATDisMArOa1sxOf5wEYAakEzHN5tsKO7JonLlb2MCL/+INSxoZ5cKlxktk?=
 =?us-ascii?Q?lJguNkR7AmSe4xk4FlNdYmMU4EZkwJNsQJk7g7tKs2rUujr0UOqGhHvO0nKL?=
 =?us-ascii?Q?3HA7gxU7/1kI7tN3evEelJDX8olmzcxzzQD+HaEVjSZC/5EmlD+6jFIjqUM+?=
 =?us-ascii?Q?DGR3YvdkOML7hJhRa0qDFY4wIDNasqqxlHRqqE0OXpPkKqT6y3BThLIIxV9k?=
 =?us-ascii?Q?XLvcg+bi83Y2b6W5MqvKOefJBo0pHkiES9umtiogKMoksGRjcjZt5SN0MFzD?=
 =?us-ascii?Q?/V9Qjv2s5PWdLeEX6lYjmbV1CyG3W+WLEJi7DkMMizpfEZJxnxwE/HuBAEYm?=
 =?us-ascii?Q?IHMmXr6DCy2IN/IKkQ3mzPIQvzIXGfqc+CigxY9dGsyStM7dR33hX/jRymvF?=
 =?us-ascii?Q?qPnjc7z7MNCcls9DVm6C7RmyVHmgArYgZiDpSxH562CiS2su2SzkBQdSUeB+?=
 =?us-ascii?Q?7t69N9A/ZlnLDVCqZnu6/u2F/hJsP4pXLC1OiGXDNXEnHr5s3hqJ4pwMUhjB?=
 =?us-ascii?Q?gjWDqb9Ypq40B10f3D9FJ9Z5+ZcTbUvyjO6jsUgh3uZCvJzhPVv1Fm8w2B0I?=
 =?us-ascii?Q?TLpU815zNKyioujqSrG69oXLEZjGyckJiwH3cDUzVrf6PRwnvUtVKdvlxq1s?=
 =?us-ascii?Q?6EYLezxacdgQmDlwJ/cInbjs93HtsgIWkb//VbCfNswDTnxl9LU4en9mdvE1?=
 =?us-ascii?Q?HKYbuslFC6JLPB1Z9cH/bRPJb6PpwolrSfH+UjO4UGkaXvpQxoGhdwlhdLpe?=
 =?us-ascii?Q?giYl0z+1jJI5z38KBEvXSrlbkypkH+BJAT5knfpma/fk5Ymwmo5+2gzzjC9N?=
 =?us-ascii?Q?cmwYywV8IgY0NK4rmBE9MpWQxu/VTCiKEWNvkWffG+QTT88TkYPzJt1C0Kab?=
 =?us-ascii?Q?aK/t3Reuqa0oksu/Jgwn7jP0vqdbu50VwN/vE1mnZWCyDBgMa/y003c3B5Ku?=
 =?us-ascii?Q?md9yQ62txs27pfC3hVHgXZbp9Se4cEbtShVa0PovH7V5HtBVxGWES9D8KzlG?=
 =?us-ascii?Q?W5Gbuyc7CPiNolEjxfIDgjuhOuZClyoBXC1LTBeZ6KxMzt0pfTzwTYO9FKid?=
 =?us-ascii?Q?TMbzscsw+TT54CbjnHkMaGx+TheWqFNbjZ2nhwVWptRgTzp6kblDgUpAsb/j?=
 =?us-ascii?Q?cmp7xSB9osLIkPPQ2eQt6L2cQcaJtbe9k47lZujNthPftszmlTb+RY/uVCA8?=
 =?us-ascii?Q?Wz4S6Q0v22Jf1cn/w3VZYKUNYo1+Sh32cXES2zWf4CyYydKSOMqIarmFyjl+?=
 =?us-ascii?Q?n/EO8dv8O86m3sPPX7G9fYJANDjQ55VYcnoNyI6j2MfhYAV4HU75YQL1w72b?=
 =?us-ascii?Q?Bad5VMarHCHTvyDR1tnr0yoxImajaBR8jrl0ktL3u+u2nWRTMpq59G0o0bQc?=
 =?us-ascii?Q?0Is2i4zS8WLv//8zgrQCO4W3jcpXvGT4tJtiK5dWOwUhowo/nz7+99swOZF/?=
 =?us-ascii?Q?uCtg+j4MSJaCU7tVelKQlcsbhFba7MzsD1o0Uae88W+Ty14ppYDB+URjihO7?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lpm5KOXQAyjzBW3NtmS4ePGjEO24IFBps5LBs/lhtAZqULiyF5MBur+bXbHghOQe7NO3uwbexpo9E1gQ1lxuRhXs+vvPETdo/chCIVAr2YBNRNq2xqWV2O2JBItlvoBBQwRB2PBOxI3u/oaezH6stCzzyghLE3MjnLfG6eNBCTR8Ns7ge4SzhnMJQ/sg3Khjt8bGZ5gvNYK/CFecnpgUY4w9dTlXsHo5XC6BcMWYRj0z4xKKZXByTGsG9G7htvhVNm9qp8+7PPKF3bdK6tleYZPAJOYX0ZYUpp9nvox1RMvm1cj8/Db2dFSJdEfMel6No/NuyBXHtEMU7xbvmyewN1UrlQF0PqBXAEbs3rF4iXve1x22b+ZAUlZ4tl73C22LJyoD6vWmtWrH7mJJyhXxQAloZSVnYy8JMrNKqRMk3QiiHwkSOptfM1bXjcajiTJFhP2G/gnCdNXCSoPr7CFONIH5XpIc/FFJngQ0YrlpNsG2ze0caLl3TeWytFmzmILYxy8I2FuGSI1yOx1oFUsGfr2qXafiTPhKUk7bmW+ZHhbaZyCX8NRkzPn4Mw2xJQGRWOZy9uic2k8YpuWYOdKa902epTjq6agwrlrcGP2NcNM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ca211d-27ca-4b2b-955f-08dd8d48da40
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 09:23:39.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZF4Gan1Enro8p1YczLwagYZhvw51WVH9C8+ZDE6nGqvtC2fseYfU1qDDos3O0DztIf0iIdPlVJ/G/Cgfv3zcyu/DIDG0zZm7L2VYtCUIg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070087
X-Proofpoint-GUID: QuhB686xgUZmIjHb8VCduMkcY37DI5S-
X-Proofpoint-ORIG-GUID: QuhB686xgUZmIjHb8VCduMkcY37DI5S-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA4NyBTYWx0ZWRfX5m5LRGjveo3d Xjke5fgd25nBLIsWalArieH3tfyOC/JEza6Jf/aQpGDsv2Ln14udcA5TjTN/3LEBl6KhF8tGi0Y YRoiVsRoZut4XXE+2StPNMgAWY3vUjBUPztoFkWgxH0lsRW+S3NKFTPP/5/pohbNXwcQY44GTyz
 EwupV1X23tPaGYqOwuLWkxfQ8PvqxPHtc96gxhLNI1mQk4cBxKvAgiC0bOgtYG7XcSxgwX4l0pQ c7Jz2WhmOvAkevDqZ2XCKgGPNXP1Grp5VcP0TPoW/WJ0FAebmOO6q/TpjXgUuIMpB9nMZ0gEtPr WJgBrhcuf8iEaSsF8i+WRID4W9lf1GtYdNt0o3kKF1pg9o7yielcCp+uBTKD86DKQJvJ9XSPiTQ
 v1XEbeEU9WJ6SJfufzUX89r1nnbRFzON/znNtr9+p1XcvybKqwpf4MDziuVv8azoHekGp+SG
X-Authority-Analysis: v=2.4 cv=JM47s9Kb c=1 sm=1 tr=0 ts=681b26a4 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=f4owgyeyPEyCoYYOLTUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694

+cc Vlastimil for page_alloc.c stuff.

On Wed, May 07, 2025 at 11:02:00AM +0200, Uladzislau Rezki wrote:
> On Wed, May 07, 2025 at 10:05:58AM +0200, David Hildenbrand wrote:
> > On 07.05.25 01:21, Andrew Morton wrote:
> > > On Tue,  6 May 2025 18:36:01 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > > As part of the ongoing efforts to sub-divide memory management
> > > > maintainership and reviewership, establish a section for GUP (Get User
> > > > Pages) support and add appropriate maintainers and reviewers.
> > > >
> > >
> > > Thanks, I was wondering about that.
> >
> > Thanks Lorenzo for driving this!
> >
> > Acked-by: David Hildenbrand <david@redhat.com>

Thanks David!

Am trying to strike while the iron is hot post-lsf and discuss with people and
set things in motion :)

> >
> > >
> > > (looks at vmscan.c)
> >
> > Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
> > implicit:
> >
> >  $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
> >  198195 total
> >    7937 mm/hugetlb.c		# Muchun
> >    7881 mm/slub.c		# Christoph/David/Vlastimil
> >    7745 mm/vmscan.c		#

This is, as Andrew rightly points out, a key one, I will have a look around
the git history and put something together here. I'm not sure if we will
get an M here, but at least can populate some reviewers.

> >    7424 mm/page_alloc.c		#

Yeah Vlastimil put effort into sorting out reviewers here (thanks
Vlastimil!) but nobody's stepped up for an M yet :)

> >    7166 mm/memory.c		# David
> >    5962 mm/shmem.c		# Hugh
> >    5553 mm/memcontrol.c		# Johannes/Roman/Shakeel
> >    5245 mm/vmalloc.c		#

As discussed below 100% Ulad is very clearly the right guy for M (and who
has graciously offered his services as such) :>)

Ulad - do you want to send a patch upgrading yourself there? cc me and
David, I will happily ack of course, and I suspect David as well!

> >    4703 mm/huge_memory.c	# David
> >    4538 mm/filemap.c		# Willy
> >    3964 mm/swapfile.c		#

The various discussions at LSF lend themselves to suggesting people here,
can take a look at this also.

> >    3871 mm/ksm.c		#

As per discussion below, thanks for suggesting yourself David, I hope this
is a case of 'well de facto I am maintaining this' rather than taking
anything new on, as I worry about how much your workload involves :P

I will sniff around the git history too and put something together.

> >    3720 mm/gup.c		# David
> >    3675 mm/mempolicy.c		#

Ack below, and will take a look here also.

> >    3371 mm/percpu.c		# Dennis/Tejun/Christoph
> >    3370 mm/compaction.c		#

As you say lots of R's which is good.

As per below would you want M for this?

I will take a look also.

> >    3197 mm/page-writeback.c	# Willy
> >    3097 mm/vma.c		# Liam/Lorenzo
> >    2988 mm/rmap.c		# David/Lorenzo

> >
> > I've been messing with KSM for a long time, so I could easily jump in as
> > maintainer for that. Probably we want page migration (incl. mempolicy?) as a
> > separate entry. I've been messing with that as well (and will be messing
> > more), so I could jump in for that as well.
> >
> > For page allocator stuff (incl. compaction) we at least have plenty of
> > reviewers now. For vmalloc we at least have Uladzislau as single reviewer.
> >
> > vmscan.c and vmalloc.c really need some love.
> >
> As for "vmalloc.c" i can jump in as an extra maintainer aside with
> Andrew if no objections.

Entirely the opposite of an objection, I'd be aghast if you weren't a
maintainer there, thank you for your excellent work in vmalloc, you're a
top chap and we're very lucky to have you working on this!

>
> --
> Uladzislau Rezki

Cheers, Lorenzo
