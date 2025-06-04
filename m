Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DF15665C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749053177; cv=fail; b=EwH6lVtavzoqOQ8IUjN63iD2OaHXqJAgMSjlDwgwNDUpYBe8qxzW8hmKhDubwXSXvOjtpR+u5VPG8YI3KeFKKPnuFB7A9uZN6/QHVm3LgR2yNLvC8fYxr6DSOU4Lz8gRib4hai5YPo0uliC+GzaYT4vdTjMM3FCpVayxLmbIc1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749053177; c=relaxed/simple;
	bh=BODUrsd0SR/f+szE0IwLM1GtBZEUcSzxrRE8ndyeM4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ymxi/b2DNb1hlzCQYm6FplEAagmKhjyY1Tp0PtsGH7vNQYEonaphc8vhV2FdOcwII/d+xVxjEmTBMQaW7RG3Hsk7vLOWIVjPROEqQaof60UtH+z1iH2WLVtPELiEpxBvWo6jViCn0ftrIyh+Ff4uXCv4d1YGqnZG5aas7KDrxLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SD7qgNNk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pG4QLKXr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SD7qgNNk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pG4QLKXr"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FduHZ009119;
	Wed, 4 Jun 2025 16:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZJmDZuBW/OKb6u74Gb
	utW1nmqnO+v3jnEmjAK/mLrc8=; b=SD7qgNNkxZLRYa8DGTq5cA83BrIS5fQ1wm
	WAMXUtXd5Jyb/SWOevMxAJya+y7kYLOf48d+JKd0sjh1K4FSeZBLBnp7dIWy2dhv
	D3MARK2ZNQGgM32HtJeXvxDQ1PYby2B0WLZmWSUnSMF1tEforgVvZXmMETxlJpuj
	Z0PQAFkOH8IT/TBa6b6BJMGh2TPe0GuKQ8EliSvkY9jNIP78LucotE2t5kqesDMZ
	miycqK7StmtyZMiKXPCjdOZizqk1Ym4ux6LfXO9BAHwHSbjmab/PMzrs6ZraTWvf
	K4gf9q5kuEJz51I/RRihOwnqQUOppoIjtCRpKqEe04lLP5SlxDsA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahceg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 16:06:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554FNHbh034829;
	Wed, 4 Jun 2025 16:06:00 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b6wee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 16:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoUjge+7WF/AMXKJyGH3Rk40J3Mx/ItJRqeUrcI6TFhZJvI7HQ7Uhou3sl/1RLMLckN8dnCgvfOVEqIugoLDM+S7yqJu5ca6Aw2xEWaMrYYoyKCzOciEEwqCIDDKBcklxzfHdFO+sq97stBnrFrGzs0I4/eQrXpETsqWyldR9hBlBJ/BZDsnKkWn6mcc1tAoAbQh12YfPZXrzRl3wRjtPPdMOstAk0/GoTNsL75L7fSbFBkB0CmJYNU4xy4RfDK7SN6te704txDBXrQ6c+lOxHuOOlWra8uKz3cFZ0zH1Crg1msfuiujJ1k63XtNVi2nZlKtngl2+OCq+n6obrs61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJmDZuBW/OKb6u74GbutW1nmqnO+v3jnEmjAK/mLrc8=;
 b=JfoemQ7ws30iKubKWn1YJVUkhcKC/JJAKJbbJybMaIYUhac92cTy0V8wKGLAHrRFmWWCtUSSbi4GK1RQ3RwkZQNsj3sfUbaS9g8nwJ8FykimchUt54UbsxXHozIHNs4+k9YfDDxJ2g3+t+aLozEYnPAayPUu4fSszEZ6/Mw83+l2qmexI9sGDzTVbqGGXTArWt5aaLTPkuHO6hThQ5+hBi9OovLEcPfiGIzl9buJPyhA9Jity+amH7OtJwj06pbobJEgshmgmJkKaDTpue5PjCOZSs7kQ2MeMSdJI1BQkzvqZ3BdLz78zV6a2K6HNpbQi3gCqsPZ3RZsyINuUqLMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJmDZuBW/OKb6u74GbutW1nmqnO+v3jnEmjAK/mLrc8=;
 b=pG4QLKXromH9OpRhi87aP9G4ZOD++EyZ76vTizkxY7u9VNhnz6OB/w6fLVuvCa2HUfQcUgpiwM/H2XNEaDAIUB0dxQGkAdcgUnwZ8Y/jrcjB1bJRg8FIHtUtqX8gRGHhfAGIo6h4pNpv6+u/0HlnuiM7fQy3yNfMmj3USVAXSbw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB5076.namprd10.prod.outlook.com (2603:10b6:208:30f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 16:05:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 16:05:57 +0000
Date: Wed, 4 Jun 2025 17:05:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <5041aaee-40e7-475d-81f1-020008dca3b1@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
 <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
 <CAHk-=wjO1xL_ZRKUG_SJuh6sPTQ-6Lem3a3pGoo26CXEsx_w0g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjO1xL_ZRKUG_SJuh6sPTQ-6Lem3a3pGoo26CXEsx_w0g@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0306.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: a85bce0f-a3c6-4c77-12c0-08dda381b0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9reS4JtQDLLBqMXBelPndAMZwzDp7mK1d1USAjG+e6bv0oIRUa/ideEbQngu?=
 =?us-ascii?Q?5Ux4DLM1AoWgd0645IhbS8TGm6HEVSme8z3G0KSttpEjJICnLaynv6TVDwjU?=
 =?us-ascii?Q?F3ZgKbWoBnTGYZ0qt7MECsaqxpUEs/Hg+yESYsMI4hKlnxZqUvxcuTpY0hTd?=
 =?us-ascii?Q?iwwTn/0TXiXE8wZksTsQ5cLm0NYMwcd3udHI3drVF/ZjPc1BJgfUZfLsq1WZ?=
 =?us-ascii?Q?09aIzFlHsTgi2+Cq/Ly2AYd5f4zuXLxEFbwsDHof0AmiN0+wz5N78zINPn/r?=
 =?us-ascii?Q?whtzm0FQuyLODdqDNsEhjVXids6FHAJDEZ2k0hkQ3xS/Qgfu+8z2UvbA1EGb?=
 =?us-ascii?Q?VtOzCRdmLIIO0Z599/lpI8jTEOtPA0fEC0wiBEdDwfNU5o8F0FX84mZ8P2fa?=
 =?us-ascii?Q?uM1JOyr1wV3iqLnud4B1kikytTrTkPsRWBIEGZaJHcu0HeayOmdL5BBdaeLJ?=
 =?us-ascii?Q?+7dKK/IIQ8FN6uwUcDGehnq+puFU6pgmLJFJTIZQDbGVPGAqsqJHU6YfUkcR?=
 =?us-ascii?Q?8kh06zpQjFfwarPIi4n1dUiIRZXT7ellELpZ00aoCXyHFlGeZuVkQUVoxSgW?=
 =?us-ascii?Q?InYi7TtSi6RzVAsegrQRpsjdRPemekdqCiPs0rUbJZWi2tuGh4FR/+c9Hgbx?=
 =?us-ascii?Q?9iP1ODQrsSNrR/s+TWKGY4uVw4p5rrDAnc24u9o89ynSM0tpz8eVKZDGuVdt?=
 =?us-ascii?Q?rEnsEnRPTp0lbiSnorSnmSFVBfByCHUp5o3jQer5TebAosWpzmPokTpYJax7?=
 =?us-ascii?Q?n7jG1C2ruohaUOndviaJQgjEhd2ZMWikoxa2FfK34jka9E2dvdwPrBfTTLDG?=
 =?us-ascii?Q?yD03/rBV2DlaG8SPvXiGsRglaCRJpkIZy7slkuqkg8W+maC+IswfI9fuxtvN?=
 =?us-ascii?Q?9gtRseJissTtqi3gt7aLclcKZsVLucyB2sigaOQiEBK+HfztS6iO+K1AXf2k?=
 =?us-ascii?Q?JD7/fUVJ//k88nU8gm2NVWR8PhS+XvMTbitO/H0hkEB6q+eScdOSmIluKmAg?=
 =?us-ascii?Q?vB8LptBbmHGeXb5c05fa52DRaIOL5j5I+Q2/mT+e2nK0IjP4T+Ni6G1dRALb?=
 =?us-ascii?Q?JiPVZAGVLZV33Osvuw3gkzyE2t6zA6QMoI0pq1v8WvZTUEdsZYFP2SB7VM2U?=
 =?us-ascii?Q?Rctl9K1xSr5o1qbSzTR9c6bFHXu89ASLU3EhMIN4Moe9DAQAzx4OfXaWyRWX?=
 =?us-ascii?Q?5577B9X30e7RF4aDZOg9hA1xf+dFHQvHMco02cCmgWNepc0/7ic0oLpsFV8W?=
 =?us-ascii?Q?6j0dOrt6pwDe2BYTC4XbEtUbzYWpkNv7Z2zeGO+vrdVRIM0Ff7S2N/V+VuI+?=
 =?us-ascii?Q?RRtlbK5CJG76n7SSIUTmfzJExPh1o9vzNwb8JDZ1x64Xa6fpxsRYaoeeHZ/j?=
 =?us-ascii?Q?T/RvPhiv+/9xiY86FfIxdRdMHSjOmIcEIJFHLvrahk6bBnDDA27UyGTDFysG?=
 =?us-ascii?Q?y1i0UYbbdvg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HXLKiLOpTC8vvrPvk5LZRBiIDvHXmuFh5WXlJdxC7I6zOmTDL5iJWdle4r2x?=
 =?us-ascii?Q?bcfk21aMgpP2tjhzuMWSRlTA0sRGrR+CQYVVAEEYPIUAma1WQOBcwhhU6cGw?=
 =?us-ascii?Q?c5ye7nGAgyfMrKK0vMua/+LYIgtnO9bW+1RZC7DFuMEpnCNg49KZhwm6PXK+?=
 =?us-ascii?Q?woO9sZ87TBvZtYk3uZjXGCpxB5WMURe3KRJ1BcSiZeu2GYrZTJ0QkHa8go9C?=
 =?us-ascii?Q?Yj/9w5SR9lB0+3viD7GFZQQmzRdbsaR3EnJtGqFLsnj5CoC0+NyPBN7sIfrh?=
 =?us-ascii?Q?TykasRXjBxFe/0rNyszoHPGxzGFVUZaKlapWuKINy8XtdHKOxwjWbm2YyLq9?=
 =?us-ascii?Q?yS5aorCK4iwFX2ttbXTSSHgYyDz+f/wFmNrnXUPbWnGB6eLAzyt5pClBLxdU?=
 =?us-ascii?Q?CZYalL0C/UscpfTwFylZNQ1fJIcVNWhCrSuAh7i+bGb4I1skM8ghdF2KVppC?=
 =?us-ascii?Q?q8fh/1G24T1AQk8fuql+Yb3NzXpndSIWjsRC+gN/UkWSAmg+nGOp0XhqmtCF?=
 =?us-ascii?Q?XXFjzSP0WAWl1SIc/sFZSZR+YWR13IJDQI6d7trI+W7dhdDUrHXTAQasX0Z9?=
 =?us-ascii?Q?kdGKkBhAa0GfPXnIb8PICByA3/v0e0tO+gQZ7qM+S7ODMT9vvAgetN+owZpO?=
 =?us-ascii?Q?yx03hZvymcDgfvxAPcEX9/IAuFjSy1dOD0x3tVsWK04trEP6Qty3Wqvwouwl?=
 =?us-ascii?Q?V8CyOlsd8FvTPPEW2Lc8psDe7TcBcEs3oA2Somu4imHV5LyGT3BXSdskFB0f?=
 =?us-ascii?Q?eV3A+VosnJCjmLf5nXF18kQcY+zprY6XBr6gZ8Oj18rbaE//P4E4oRBK9NNx?=
 =?us-ascii?Q?WLmAG0J0I1XNCptVuu2yUmPJm+hi/fOqNgKDxpt47G+upHWSU5QvApsjkgRS?=
 =?us-ascii?Q?ibwOAXxTkTTm7emE8Z6Yu9CP0kBVRR0oxj6BfaOLL/HVa+sA0QB6H5JQ+jF9?=
 =?us-ascii?Q?EdnZDPj1Kv6t1h89rXfUu2r5ZNsx3T0eIcaEGnxnZ8+hq40q3HZwdgBKueHR?=
 =?us-ascii?Q?jaYn91pm25+eEs04SxYz1KA/uZxelAzf19qEvu4OgHpIKudYKyI7HwON6qxo?=
 =?us-ascii?Q?GoV+pVsIxxM3yJuPGctWsC0J4pWFwxe1EOiLrtGP6NdpWssYq7+0/o6O6yC1?=
 =?us-ascii?Q?bzgKw1VadGebBAqyZo1Tt9JEnSjb5qagl+h9d5DaBu+kH0adrn9YjfYFyb8C?=
 =?us-ascii?Q?Lio0kzPgtP0PW4/42kxKa4nblvzzSI2XU3W/mSXy9MHaXM65YDOOdXFTimmu?=
 =?us-ascii?Q?MRKGo2+/G90wDV7+k1noRqrprfUVCc1xeYklQbLg+r9uZDnxbjY/5SArW5nF?=
 =?us-ascii?Q?fpUkVtuLG9e0MJqCr1n6RXYXgTG9XvzGEl8Kbm6gekMlDRah6x6LuDOuYkR6?=
 =?us-ascii?Q?ZbfLbUGCooXPHwuAoJ877Lyp2Qc1oyY07vAYmwLuMvAvQ4iXi5D36edlFB6p?=
 =?us-ascii?Q?clNytSJOl9nD8Rr8kRTq1HBiAE3AjibHzwc0uQ+mVO92BT2bNZm9a9N/Rexq?=
 =?us-ascii?Q?CA7nbJ5phajD8mmIMy97u6k6zCZnPgrvZJ/Xi1fOkPYuhlqW1Zf56Cqtz0Qs?=
 =?us-ascii?Q?qgm58MxksJDny5zYjLDJasAl70vb8cEnE06Sf1gFJyaE247lSKF0FyIKVT+w?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ve0Phv4SacqHpZx0LXou8S5UOcv6nJutnrjTDeZvbKPWonbqkmc2IPylhMwr+pZFO4tAr6uK8rUaqd3SdbMPC3nNuxaTMtYV/I/7Z1dwJNt683DsHJbsahp5RDEMJOhCqRkTdamTm5KhTNvqk/yKbDwU66yESfTz6NNHtMdEkcgIYdPJHFBXQsKgPHaWTm6PPAPVzUB9hOoXh5mooUnkCjSbZLaP5uio8o8X6woqYHmK7q6f4VbZdFiMzugJylJC58yM+L5jxQ/5Z4zLbEMt+7+usydcCMb3eDrQJ4Kcmn2l99OWCnpjdxyULe0erkRHjpXJTC+4jFJH3VhrS+1VFhgrAEd4OQRfdv2lysnWiOMfktn/sOAYdOHzP/dJ2c+kafQJ3M8Dm43cjK7It6bjcSjEir1MCgRqTcu/juWsRhWzQ3UL3+an/CxiaGOW0xuTkN5wMMYX8n2bwIptT5dq9pEgXKDu+bco9BwveYD7tZpmqwt0KSJy84/I9WGqlna024gcphzf74HecLug5GYkyQv3lE+vaaOU8IKBdtqhUlA6VW5uted0WJjkYjQ/AGytAsJlvmJ1870nzEMf2PIsHM2AH4Oy1qWBAhVY5G7Zd8I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85bce0f-a3c6-4c77-12c0-08dda381b0e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 16:05:57.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Zq6ckcxUL8zX+H9uNaEGZbGo56GaJ3EWz9dzXLwcQ/POsRRg6feFEA4xviqBZTa8BvUipJHyPT4AUDpTY1+/iQJG6OBsPmv3Z9NOzUwgvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5076
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040122
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68406ee9 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=KBWr4bYY6LNpv2K2w98A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: u8VG-x_YWD6ZWAcdokJk9a5AVh_KZjdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyMiBTYWx0ZWRfX8gR8/8tIqUHc LhhCMSCSTj9czzrZoB7WzwaFdnRav6dP5yRUXDb6IEV3dCrwM86ojStioHnup/ii428xht+2AJr Ntz8YfaAhWuSXWvoSxWeeTsnuqR9RkB+MG8ugLPV1V6atDJUT1kEVDAkRuhAzhM65s720QENosG
 YpN3r8sc2KaWIbkOcMVcKuJOlSjpQLBKWQrGt2X/UvR4s1qpMLEmNmSMFwzRvSJBAqGK2jZb6Eh vNzc0uq0WZsCZnjLyaLUOz0leRryi1Q4d1IfAx2/snrMexpMhjz1NQRW3kwxSN8esrUmxWWpivV aRuSXuURGXb0sQnYAGrtmSc6TwWKpZFXKczr4K2ciW+IqTBRJ94jLlI+UagbVZ8bPHrXhGzn6hc
 mq7nbkvl5h6bK1U5OV8CJm53yMzHdGIZKsbXCxbGTRIxxfvp5DIpPJD7JjHunWp8d/R4NIMF
X-Proofpoint-ORIG-GUID: u8VG-x_YWD6ZWAcdokJk9a5AVh_KZjdG

On Wed, Jun 04, 2025 at 08:42:30AM -0700, Linus Torvalds wrote:
[snip]

> I really think that the *ONLY* situation where BUG() is valid is when
> you absolutely *know* that corruption will happen, and you cannot
> continue.
>
> Very much *not* some kind of "this is problematic, and who knows what
> corruption it might cause".  But "I *know* I can't continue without
> major system because the hardware is broken sh*t".
>
> In other words, don't use it. Ever. Unless you can explain exactly why
> without any handwaving.

Thanks, this aligns with my understanding.

This does make VM_BUG_ON_xxx() look even more silly :) so I think we definitely
need to get rid of that...

'Absolutely definitely corruption but we only when CONFIG_DEBUG_VM is set' is
you know, insane.

>
> Cloud providers or others can do "panic-on-warn" if they want to stop
> the machine at the first sign of trouble.
>
>                   Linus

Yeah, I have seen people object to WARN_ON()'s because of this though 'hey
some people might panic here!!'. My view on that is - right, they can,
that's fine, they asked for it :)

Cheers, Lorenzo
