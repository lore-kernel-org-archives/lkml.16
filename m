Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF7A43AA9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749238186; cv=fail; b=PvPLQDojgAvD6jef+LUQXLZzNQeGioyfRQPJxPxfbitJIlnc/mWOKG7IovuryIFPs5AHiHt6DoqS7KkalkItHjrkoD5pvK55bdggOeYjmUXMdMqYnMfbsBxF/NCpVOwyxm/sYzo06DLMVUjQ2gdPfM0iPzjZc6FK36Auq4gg03k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749238186; c=relaxed/simple;
	bh=5NuOiv2LItgOSQYmFs571bYVQ4LA2GuNInDj3rPQEqs=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GwTDln6X9EN7SqJUmBXfBLK/hWY10CgV11ik86U+pekRHtcDftLdPtgwBWHnQN/xp6IL+8kkVDnKT6kKWyEb375lZyTrRW76hiebjQ7Bfz+U6OoZPrX5UUS6n+PGQ35Bv3JbJuX1MJU89IF6Bij2/0d5jR2k3z+DzWWXL633jD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SyBiJidK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ioz1GfnF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SyBiJidK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ioz1GfnF"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556IMYwM007864;
	Fri, 6 Jun 2025 19:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=E69hVmN69VgjFfuKQk8XB2Jmc6EZ3qP1wlDA7UmbZNc=; b=
	SyBiJidK/uMZt9p+skhLbvpyjNkfyj4tAxACy02V4ySzEv0iPl+ontADk/oxqtrN
	UkAkL18RHvsQlBb/LoDpqFP4TlURK/yJtIXDvmmYgUpgpzQhmA04uxhBaIKY5Gin
	G329HAb4yoZWzypdiVox3V4Ljx2kdmD88FpT0Rpf7Npp44WYyqUEbNYipEsMuHW5
	Bstqkb5/lcdXVgnjxKJID4/IHT/A/l587r6/Ej60trimDgcxIbHuGZpDLM87KDUw
	+mS2aCwMYxWe6cxDhEH6AvPJ4YhwXhCSH4zkgKIKXZfb80l8vNYhdX//DksuJLbF
	7+DNHB95xJ2nPDPk9OpsfA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j8nvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 19:29:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556IW3eT016238;
	Fri, 6 Jun 2025 19:29:37 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dn1n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 19:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0wRJ6NtES5RA1OdDX+SovvaQQU3Oc5fMKRsYCpKT0Yk5kMA6cChOOum7aiM8Ouh2nqvgs0BtAVaHD0gLyNkfqtJdZBED6fPnLpuQ0eJ43M33ZVGIdoaXsE9LWENXOZML2LWeq0ex/GGaTMW7XJdaMdVHEZDGfTDtEG4l8dHAUgBKmp7xMNXXheaH3yIO37Phbbk0FAcBy2i3qPqw1cLYxP6v/QgrSSRkReAql1eLQXanxUzv0wDlYK1Mds7LpypqFUbu/UToWoqsfO2bmy55n7KEGwNAmFVmjelsdFGjo30pMvB2JtGq4UTVm3hPZpQOWVGVAHxrYwj0Pmh347F4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E69hVmN69VgjFfuKQk8XB2Jmc6EZ3qP1wlDA7UmbZNc=;
 b=CZpxWLKUhLAajps1gTvmsATSFfbmx1XwoivyL3SBmFRQtPawhvcHf7Vu8AvoPuUNrEOXKiq8Up33T/fgKOUittxu++UNG6F2kFikXWKBK7pr9wKN1A96H6rJ//fJ4xqlXkajbG6mmw/fSL5n5YR9eCWBOwY+PXBjlNkk05cGejYTYYNvjQCIVFnPivAIR05k+DdEdmqCXnpEj+jM0W0zf97+GXziKQpwjTTu7h40u/KNLKqsx9UGUqceUZvbxlTv6Kuzr0uDSFP3qvDL8bESQefpyAxrNSouh7n8csnRigaL4VmDvflOk+2Dr9gTqdO0tLTcusmu+JgXjxk7MxigOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E69hVmN69VgjFfuKQk8XB2Jmc6EZ3qP1wlDA7UmbZNc=;
 b=ioz1GfnFTu8YCTf/3HtwgA8AcG/sv3tOGpWS27v7dHI16UeFq7wQx7rRFqc04gvsYPR4HYfKPYll4lei34CbOdcv+cIptBgyTPO7x3qLvO4oU0aHwIxklTn3cZrpBwzA9XUXPLEB9+t6GxxVXUU9O3iDXiUM2PYTvvqEIEz2dJI=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 19:29:33 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084%7]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 19:29:33 +0000
Message-ID: <7b550db1-5934-4bf6-812a-f135c2b5d945@oracle.com>
Date: Fri, 6 Jun 2025 21:29:31 +0200
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <cqfgywnwfjnyujvgcz63drka47glxj2n7fq5xvhrt74st6xa5w@2bf4vp6duotr>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 xsFNBGJDNGkBEACg7Xx1laJ1nI9Bp1l9KXjFNDAMy5gydTMpdiqPpPojJrit6FMbr6MziEMm
 T8U11oOmHlEqI24jtGLSzd74j+Y2qqREZb3GiaTlC1SiV9UfaO+Utrj6ik/DimGCPpPDjZUl
 X1cpveO2dtzoskTLS9Fg/40qlL2DMt1jNjDRLG3l6YK+6PA+T+1UttJoiuqUsWg3b3ckTGII
 y6yhhj2HvVaMPkjuadUTWPzS9q/YdVVtLnBdOk3ulnzSaUVQ2yo+OHaEOUFehuKb0VsP2z9c
 lnxSw1Gi1TOwATtoZLgyJs3cIk26WGegKcVdiMr0xUa615+OlEEKYacRk8RdVth8qK4ZOOTm
 PWAAFsNshPk9nDHJ3Ls0krdWllrGFZkV6ww6PVcUXW/APDsC4FiaT16LU8kz4Z1/pSgSsyxw
 bKlrCoyxtOfr/PFjmXhwGPGktzOq04p6GadljXLuq4KBzRqAynH0yd0kQMuPvQHie1yWVD0G
 /zS9z2tkARkR/UkO+HxfgA+HJapbYwhCmhtRdxMDFgk8rZNkaFZCj8eWRhCV8Bq7IW+1Mxrq
 a2q/tunQETek+lurM3/M6lljQs49V2cw7/yEYjbWfTMURBHXbUwJ/VkFoPT6Wr3DFiKUJ4Rq
 /y8sjkLSWKUcWcCAq5MGbMl+sqnlh5/XhLxsA44drqOZhfjFRQARAQABzTlBbGV4YW5kcmUg
 Q2hhcnRyZSAoT3JhY2xlKSA8YWxleGFuZHJlLmNoYXJ0cmVAb3JhY2xlLmNvbT7CwY4EEwEI
 ADgWIQRTYuq298qnHgO0VpNDF01Tug5U2AUCYkM0aQIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgAAKCRBDF01Tug5U2M0QD/9eqXBnu9oFqa5FpHC1ZwePN/1tfXzdW3L89cyS9jot79/j
 nwPK9slfRfhm93i0GR46iriSYJWEhCtMKi9ptFdVuDLCM3p4lRAeuaGT2H++lrayZCObmZxN
 UlVhZAK/rYic25fQYjxJD9T1E0pCqlVGDXr2yutaJJxml5/jL58LUlDcGfIeNpfNmrwOmtUi
 7Gkk+/NXU/yCY17vQgXXtfOATgusyjTFqHvdKgvYsJWfWZnDIkJslsGXjnC8PCqiLayCPHs+
 v+8RX5oawRuacXAcOM66MM3424SGK5shY4D0vgwTL8m0au5MVbkbkbg/aKDYLN33RNUdnTiz
 0eqIGxupzAIG9Tk46UnZ/4uDjdjmqJt1ol+1FvBlJCg+1iGGJ7cX5sWgx85BC63SpKBukaNu
 3BpQNPEJ4Kf+DIBvfq6Vf+GZcLT2YExXqDksh08eAIterYaVgO7vxq6eLOJjaQWZvZmR94br
 HIPjnpVT9whG1XHWNp2Cirh9PRKKYCn+otkuGiulXgRizRRq2z9WVVQddvCDBDpcBoSlj5n5
 97UG0bpLQ65yaNt5o30mqj4IgNWH4TO0VJlmNDFEW0EqCBqL1vZ2l97JktJosVQYCiW20/Iv
 GiRcr8RAIK8Yvs+pBjL6cL/l9dCpwfIphRI8KLhP8HsgaY2yIgLnGWFpseI3h87BTQRiQzRp
 ARAAxUJ7UpDLoKIVG0bF4BngeODzgcL4bsiuZO+TnZzDPna3/QV629cWcjVVjwOubh2xJZN2
 JfudWi2gz5rAVVxEW7iiQc3uvxRM9v+t3XmpfaUQSkFb7scSxn4eYB8mM0q0Vqbfek5h1VLx
 svbqutZV8ogeKfWJZgtbv8kjNMQ9rLhyZzFNioSrU3x9R8miZJXU6ZEqXzXPnYXMRuK0ISE9
 R7KMbgm4om+VL0DgGSxJDbPkG9pJJBe2CoKT/kIpb68yduc+J+SRQqDmBmk4CWzP2p7iVtNr
 xXin503e1IWjGS7iC/JpkVZew+3Wb5ktK1/SY0zwWhKS4Qge3S0iDBj5RPkpRu8u0fZsoATt
 DLRCTIRcOuUBmruwyR9FZnVXw68N3qJZsRqhp/q//enB1zHBsU1WQdyaavMKx6fi1DrF9KDp
 1qbOqYk2n1f8XLfnizuzY8YvWjcxnIH5NHYawjPAbA5l/8ZCYzX4yUvoBakYLWdmYsZyHKV7
 Y1cjJTMY2a/w1Y+twKbnArxxzNPY0rrwZPIOgej31IBo3JyA7fih1ZTuL7jdgFIGFxK3/mpn
 qwfZxrM76giRAoV+ueD/ioB5/HgqO1D09182sqTqKDnrkZlZK1knw2d/vMHSmUjbHXGykhN+
 j5XeOZ9IeBkA9A4Zw9H27QSoQK72Lw6mkGMEa4cAEQEAAcLBdgQYAQgAIBYhBFNi6rb3yqce
 A7RWk0MXTVO6DlTYBQJiQzRpAhsMAAoJEEMXTVO6DlTYaS0P/REYu5sVuY8+YmrS9PlLsLgQ
 U7hEnMt0MdeHhWYbqI5c2zhxgP0ZoJ7UkBjpK/zMAwpm+IonXM1W0xuD8ykiIZuV7OzEJeEm
 BXPc1hHV5+9DTIhYRt8KaOU6c4r0oIHkGbedkn9WSo631YluxEXPXdPp7olId5BOPwqkrz4r
 3vexwIAIVBpUNGb5DTvOYz1Tt42f7pmhCx2PPUBdKVLivwSdFGsxEtO5BaerDlitkKTpVlaK
 jnJ7uOvoYwVDYjKbrmNDYSckduJCBYBZzMvRW346i4b1sDMIAoZ0prKs2Sol7DyXGUoztGeO
 +64JguNXc9uBp3gkNfk1sfQpwKqUVLFt5r9mimNuj1L3Sw9DIRpEuEhXz3U3JkHvRHN5aM+J
 ATLmm4lbF0kt2kd5FxvXPBskO2Ged3YY/PBT6LhhNettIRQLJkq5eHfQy0I1xtdlv2X+Yq8N
 9AWQ+rKrpeBaTypUnxZAgJ8memFoZd4i4pkXa0F2Q808bL7YrZa++cOg2+oEJhhHeZEctbPV
 rVx8JtRRUqZyoBcpZqpS+75ORI9N5OcbodxXr8AEdSXIpAdGwLamXR02HCuhqWAxk+tCv209
 ivTJtkxPvmmMNb1kilwYVd2j6pIdYIx8tvH0GPNwbno97BwpxTNkkVPoPEgeCHskYvjasM1e
 swLliy6PdpST
In-Reply-To: <cqfgywnwfjnyujvgcz63drka47glxj2n7fq5xvhrt74st6xa5w@2bf4vp6duotr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0420.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::28) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|SA2PR10MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0aa4cc-94f4-4782-52c2-08dda530770e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE42UGYreTZsUm4rTDVjc0ZrVzlrRUJlbE9TM2lvZzlWV0VKRGc5S1FycUxO?=
 =?utf-8?B?bXBENEZMVnA4NUpLcHVnK01hTTlndjU5WXZVSFc1U0RhVnNyeUdXVFhhTTZj?=
 =?utf-8?B?ZW9VWWloMHZEQzhWNlQwRlFWZ1d1Y3VtMEZOZk82REF5eUNrcXl2S29oRlRm?=
 =?utf-8?B?LzkzaE9GbW8rQTBsVGF6aTBRQUJkVVYxZTJRZ2FmbnNGWUdITEdXL0NZbGhP?=
 =?utf-8?B?c2J3VHAxZnR1UERZS3pMQmwyazY5UW1JMkNxQnFFWFF6VFhTbTdYWStpckY5?=
 =?utf-8?B?Q0dHNUNDdFpaVHZNdk9BekVPTWpPVU11SU5udjQ0bGtOVk9uYVhvZmIyL3M1?=
 =?utf-8?B?TmhwMGgzaUVuOGFDaUZXYWVwUkNWMjVSbHFCTFBsTERuZENEdTJvdUFBRGVJ?=
 =?utf-8?B?VDdOcGR1SmYzaXlkQ3pQZnFmaGZhSFpoWWJlQUNHTVhlV1lBVmwrRHNnTFEx?=
 =?utf-8?B?K3V6U3JjeW5EdGw2QVkzVTBEckM1Q0xNMldTbW9EanFmYXF5RHVqTXFjeFlk?=
 =?utf-8?B?endjQ1NhdzhYZG5xUVljZGREVVcyQjY2VnNsTTBIZTh5Vk9JWlZsL29xNUVh?=
 =?utf-8?B?WUd6aTI3T3FlemQzUlpTKy9sR0hkMjFMZThOWnZBb1hQeVlaQWFHTDc5WnRw?=
 =?utf-8?B?RTR0NS84Tlkzcnl2a0tDMjZkS1RsTklYdDVEY1NjM20vakppY2Z4cC9XYm50?=
 =?utf-8?B?U2h6ZWlYeVpOK2FUYVM2Vm5oTFEvSVF6S3NCWWxTclIwN1RUQlFxb3dZT3p4?=
 =?utf-8?B?Yy95TGlpL25mRExTT1RyQVVCWVR2Z2Y5TGNtNDZ6Si9EWW1BSmVuYUpRNDdw?=
 =?utf-8?B?SVZIT0VKcXdxQkd0dXR0UFJJRGFkcEVMVEpSZXdtNDhteE5VelBpcDh5YXRF?=
 =?utf-8?B?NHhmVU0wSTloRmdQZmRiSUhMQ0ZhYVpRZkd0ZkdsTDg5aWQ0SFFMTVh5enZy?=
 =?utf-8?B?a1J6V09zcVplSndOU2QvT0g3M2djcTQ1OXA5K01KMUhnclFORjY3ME1QcVMy?=
 =?utf-8?B?V01BVWJCaDYxbjdWcmJWVEVyWHZpcnlGV2ZYU2Mrd0lUMmp2VVkzc0lhcEhZ?=
 =?utf-8?B?TTJLQ1B5UzJmWXFyK24zaSs2dFMxbTBrcmVTb2VEaHRLbE5vVERENjNIRzA0?=
 =?utf-8?B?Ukd3WlZsMUtrZXRYOWNkRHFLNFZQMTMxdEdSOHNqdG9tQ0V5eExtYmVkNkNx?=
 =?utf-8?B?VStqYWpmbXhvanIxVGV4NXg1VWM1bkRscmRzRUdhNnZudThYcEdBZVgxNGNJ?=
 =?utf-8?B?b0JTcWNkVjRBRndsdzNLTy85Y0h0TExpMGVHTThzS1lraUhRbTRzM0wyZkxr?=
 =?utf-8?B?YmtnYmhEMTJMUlFGd21rYjV1K1hUcXVRTyt5NkFlSmVBTHBCbmtUSDAvVmpt?=
 =?utf-8?B?dDdKd2dvbXJtNUdSK0NKZU1seWV4dGZ6VVFScjgxVE9iUlFSVCtBQXJkUnQz?=
 =?utf-8?B?UVdyR3o2cExjcHhjUVRWbDFQR3htTFhaNFJWc3U0SkdzdEViNFN4dXkzZVY5?=
 =?utf-8?B?T2h0a3oyc2NCT2NSUHVRaVlYNUVlSVRaRUFuaU43dVI3bXM3WmFMVW8zNllx?=
 =?utf-8?B?SFhKa2xoSkVvdmRjR0JrbWRwTm5hL0xmNlM0SktqSDdETG5hZ0wwUlNkK1A5?=
 =?utf-8?B?UGxFVzZPbzc1M1VSSTVkQXA0UW52ZkxJUFpDSnNLajZxd2wwZnh0ZHJYN2h4?=
 =?utf-8?B?bGFUdkx2VS8rQ2RMcWoyRzgzY3NqUjB6SGlDNXZYTFp2bzZmRlcyS1ZnZmx4?=
 =?utf-8?B?TXJaZyt2bW11ajhYTndaMW1OR2dBQ0x1c25ubnpybG1sQUxkdGVqakFyY011?=
 =?utf-8?B?ai92ZW5jT21xWXc1SU9uQzRzN0VWL1BFSEprd1Z2aTlEVkMybURnOXhDdlgw?=
 =?utf-8?B?WVBJYlNjeEhlblhGbDNJejY1TGhTbjQ1QUthbGJEZTYwb2hpcGRrYXFyZllD?=
 =?utf-8?Q?PubWbPp5f2E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjF5eWZMeUcxUkRWZFJGeEFYazhuY3EyMFVpODZTZjJ5UDAxMGllUkp4L1cv?=
 =?utf-8?B?N0hVb1ZNdjJEVnpJL3J0SThWdmVUVVl6RFVldllNTWJqN2xVK2gwMHo3V0Vr?=
 =?utf-8?B?TW5OeVBRMVkvVEhQY1JwcDM4dGNWbUZTM0orNmRoQ1g0LzkrbldTTzZTYlgx?=
 =?utf-8?B?TTZ2eXVPVVZmcjM3b056YXlERDZaSVZJVFhpUUlTc3NiZXVVcHlJU2dnVmVi?=
 =?utf-8?B?REJFNngrTkVqQ0ZET2pSRnUzQ1puU3J3eHJOZTZHbEVRbG81ckJhV1hXcWt2?=
 =?utf-8?B?UDZnUG1Sa0JyNlpnZytNWk10T1V5RU9iM2FsMmsyZU5RaTliZ0c0NnFKSTN6?=
 =?utf-8?B?Tm15OUNEYlp2VXNJSmRXeXFoWnVDMWxjZzVQNGtKd0JsYjQvZS91RmVRdity?=
 =?utf-8?B?elRSdGRBejNDZ3lxR0M2RW9DaUtNMUpiVWtmb3IyL09vKzZxMVc4ekJockdp?=
 =?utf-8?B?TTNENUt4dmNxMFplbWY3S0pjSnFzYVcxdFpCRmw5N1MzRHB5RzRnTXRHUk5j?=
 =?utf-8?B?S1RmeTRORGFkQ1RxVS9UZ2hpd255a3YwOXBaaUNTWkpOMUNHSE5qclRSejRp?=
 =?utf-8?B?YmwyTnprbGNxRm1OZnRxVTRzR3pjOHJuRjY1ODhvZ0FPRlY2MVlHeHN0Yllx?=
 =?utf-8?B?cDJrZlR6LzI0K0o2dTJ4SXR5Z0JLejhPMUEveEZCYjZSNFZOa3JteVZEaE54?=
 =?utf-8?B?ZEU2RkFUa05YRXRNL05tZzBPOFJldVBpYnExOU9pbzJaZWhkL1FDTHIvdVdK?=
 =?utf-8?B?VDlvV1pJL1RFL0tla2JUNzV4VC9qcmxBKzk2RGlhYk94ZWVNUWwxQ201cjBJ?=
 =?utf-8?B?OWdqNG1zS0JURkxCQmdkWUdqaFFYVEt6L05yTVFtSUtONWlDWlJSRlVEOVo5?=
 =?utf-8?B?c095amxPdzF0Q21YQmdxaEV3ckxBM3A1UE1ydnROUmEzRldodHprR0paaHBG?=
 =?utf-8?B?bmJwK2hnM0tKTklpYlpIYmJtb3Z2VzFjbUhxN3dOMzl4dlZzYnAySzN4VENs?=
 =?utf-8?B?R2U4cWhFUVpZVWRNY3hoeVl3ZnFBV2NNdE1DSVRIdElZSWJra2NOeEJYOTlo?=
 =?utf-8?B?SFMzdytnTDcrbGZpU2J5ck5qbFZ3cForOXcwQVNHL0p6R2JRZ1R0VVdkMTZJ?=
 =?utf-8?B?TVoxeW1aWDd5d21sQTFmdHB3QlZrZTFPUi9KdGY0bUNkWk03aTRNWWJDUUxw?=
 =?utf-8?B?UGdPL0JkQ2xaSUdTcXZyN0MreHU1YTZQZ3BDZ2J3aVM4ZVltYVVTUTdCc1pi?=
 =?utf-8?B?VVlzVDJBa1VhMVV5WjcyN01rc1ZUbTRtR2t1ajZGV0ZRUEJ3eDc1anFhejFh?=
 =?utf-8?B?TTRsTGgyRHc0OGFndEg1cTBMS2JsSEJKb1Ntb2Y5YlpWdVBFVkF3U3lwenBt?=
 =?utf-8?B?TFhtazFmKytmQzlDdWxlOW55N0c2M0VoOXNpL3dSeDZ6Z0Raa3J2cFk5R0N2?=
 =?utf-8?B?SHJROWJjT0dnMkMxMHVXb0VQVjJxQWluV1ErcGxTamhMcUxrVnQvbVlsNDZP?=
 =?utf-8?B?aWQrdkd6M0FFWjNlNTJxVmtFUFAraHU1M1l4ZDJQTEhaeGhSN21GQW9zTUVp?=
 =?utf-8?B?dDVSYldXZmhVTCttRDZJRlpnQkVmaUlOaW1OWHEwODNaV0xldWpjTGdVSXZw?=
 =?utf-8?B?YkxYU0pjQkt6R1RwL0JGY3kyQm1wOERBb3ROTituOEUwN3hiVzRYbTZpZTlz?=
 =?utf-8?B?NEdyb0dNamk0VjEvNVNlSnZBQ0V3S2YyM0s1RkR3ZDg0OXVEaEkvSGF1enB5?=
 =?utf-8?B?ZUdXWklCQmFrTUhhbGsvY2l1V21vcmt2TFM0MkNMdzZYNzFwN1VqVUdodGU1?=
 =?utf-8?B?dTA5Vy9ZNkdzTGpvdFVxUmhCdzVjelB6NW1IWjRBbGhNdXpmZ1g4RmVmR1Fr?=
 =?utf-8?B?cmQxOCtTSGQ2ai83YnhtZWhLcVlnUmR1aGFMMGthS1RybVNKcDNuMklBRU0w?=
 =?utf-8?B?cEZJU3J0cG41eGNwSVF5czd6STR1Q21YZWE3T3pUUmNaeThaZUdmN3Y0STZY?=
 =?utf-8?B?VWE0SHlTbE9hcXVPT2swU2g5VEdWaWp4YnBzRWpsRGdETzZCK2FEWEIzbXF3?=
 =?utf-8?B?b3dOOG9BYzU1a1I1RHA1dnA2OGRzVlRjeWtRT3NEU2Fkd2Z2U2FjalhSRHpD?=
 =?utf-8?B?a2dMaU05V0l2eExUK1BKMy91UkRhUlVqSkVJcWVHNm5jT0RWTlFzYmMwMDl4?=
 =?utf-8?B?bTRYcjMycmx6bFRiNXBpQnVKQW5acFlvV0lnYWozTmphVGdQRmUwSGJhVDVt?=
 =?utf-8?B?NzZMK29mVjFiMEVwZ0RiaXd6TERnPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9jrztq0CE/yrr7KM5/dlU4SqObLZbIcVFPIF8vQQIhf70YwGtM9Jvwn1+fuza9wcc/2hJD0iGO64DEp4SgiCPOwz/AGOR4+zHX7je1Z0EKT76Ff34ouToTQuoL5ZQLo1Bes3PAqi6UpxpbsI2MI+lXL/F89HAatrnXU/OL404BH+LceAe+DzAHDkz94baDuHWImHpo4VwOnwxDR4wK+lI5x+igZ6QBa5lpoQ3oV070kTDgryt75E5MUZl28GM07dtqCTVNzImeYEvkE6J6Cgu42TGZ7BIfXCJ3okpfjBXbbU09mZStGBG0VY7+PK/zWNWf6keeEfciM1CzeqtWcNK9gUYQS8qsOeb1OcwcPKkWnY98PxvbVPci7hzUGLygL9J/4XhFujGbtAUF90f0qKtJg6gBsG1QpMLHeAkipjtLQ6OmbYitebAQusw4EjRBaGYDl/oELJNfxUl6UfAk17CD2yd4NhGk6x1JksosrS7KI4s33SBr10mbkZHvbBPCfXEdjdmRfI7y5qzQ+Ip6PblX6wmMkgrrlxJn1eQkgIAkBbpDWLosDUTXehQYs9a23vnGoZid8bTI95Vq2elmc5ae/AHQkHqjkVaUcYBHEPHxc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0aa4cc-94f4-4782-52c2-08dda530770e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:29:33.3189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5f+fsdRyDJKYI4TdycMw0ew3JFsGtC13WwQ7kjk5ieWEi7WNwpF9Y7SnkUr7gcY1JQ/pW9t/tOKrndPDFJ1WL8EkqDOPHnU4rL6dG4RaZ9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060167
X-Proofpoint-GUID: YJkBXiyrYOcFvKAacGEXsmASBH1heQKQ
X-Proofpoint-ORIG-GUID: YJkBXiyrYOcFvKAacGEXsmASBH1heQKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE2NyBTYWx0ZWRfX9AP/x60uoBIC L6VGNQM7JUoguSjyYfgoZsyfulC1BwcVEQJVdfoL863DYnShCua/NDq5UjTetrx8WEYvutPO5ih DkQE7bILgTPxvFImLNSRRvJdPHYii0PFw1YCEl18o9Nfnn7JhaBUmG5UZ5yi2DWnNBCi0n372DA
 FoLD0Zho6safgY0MIyr47Uc1OHvm2oqZS8XXH1WKWNf/NBnCqzYoWTP0bTZ4DEtAjVm1qlZhMtC 43Df/ZTzlEJJtDc9DFIr3vH9+vX5FHgUCLgS44qzdgqqhfSN2goUNln8CpjrNzi8ZP5Fqyq++10 rCK9zmmWxqkTwlVF43K20v9gcfqU+9R1IzoydJYf+2qQZTsINI7ffsTKT+WMg96BEukhhyG4g/X
 7xiJQjlChS/0s7qvlHGV8IQ0Qt7KGwvHEesemeusOBgZLlDAejwgSLn/jqIiyDKrMn0lUmwv
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=684341a2 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=AbmdqYzwfYuFsueSG3MA:9 a=QEXdDO2ut3YA:10



On 6/6/25 17:58, Josh Poimboeuf wrote:
> On Fri, Jun 06, 2025 at 05:34:27PM +0200, Alexandre Chartre wrote:
>> Hi,
>>
>> This RFC provides two changes to objtool.
>>
>> - Disassemble code with libopcodes instead of running objdump
>>
>>    objtool executes the objdump command to disassemble code. In particular,
>>    if objtool fails to validate a function then it will use objdump to
>>    disassemble the entire file which is not very helpful when processing
>>    a large file (like vmlinux.o).
>>
>>    Using libopcodes provides more control about the disassembly scope and
>>    output, and it is possible to disassemble a single instruction or
>>    a single function. Now when objtool fails to validate a function it
>>    will disassemble that single function instead of disassembling the
>>    entire file.
> 
> Ah, nice to get rid of that awful objdump hack.
> 
>> - Add the --trace <function> option to trace function validation
>>
>>    Figuring out why a function validation has failed can be difficult because
>>    objtool checks all code flows (including alternatives) and maintains
>>    instructions states (in particular call frame information).
>>
>>    The trace option allows to follow the function validation done by objtool
>>    instruction per instruction, see what objtool is doing and get function
>>    validation information. An output example is shown below.
> 
> This is pretty freaking awesome!
> 
> I assume we could eventually build on this work to have an "objtool
> disas" subcommand, which would basically be an improved "objdump -d"
> which annotates alternatives and other runtime patching.
> 

Yes, good idea. I will look at it.

alex.

