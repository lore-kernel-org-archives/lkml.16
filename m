Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242491E7C02
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597130; cv=fail; b=JjS2opNVH5MDYlwW09jTinlKElAJ7jmc6M6MFS4tS61XqW1KI3wuq+xFE+LFyVPAmDLlOjLm4dP5x4mVdP4NAPYUBhz8F3luCZ8ps2t+rTPIl7pDuZVWL0U8oVZah4ikvKAUUGZGCAZ3IjZNJtGJDF9/Ij/jCVuynF8vywBtCmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597130; c=relaxed/simple;
	bh=8+7hVGjVwsEwnqj5zcBhpXwzYK528+RMHFbidXO0m8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YzJbMtiNPKzdjTJhfw4EGfzMxsucWq0XSVbryXKyHRbqSvCoBM7si5aYBXsvMDompYZxkkW+WGZywhA9GGAF3kP49zR7vICsh/4b6X4EJGJQrmSiS8uZg8/RW6W9s92DO8dOR8rTlisuHuM0iHfafIeGkqpRlGa81aYh8Vi1ASs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FGf24Tn+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uS7b+dRN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FGf24Tn+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uS7b+dRN"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326fv9L009435;
	Wed, 2 Apr 2025 12:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=n6JrScQTfj8q0V5na/
	pHqx7npIEjW3u9dw7jLy0H2Kc=; b=FGf24Tn+CthYJjNMsq03v3jc0DXIr1AMMS
	A9kHTF0yX1Vu8GZa0qD2BTJOqiQ8oRQUvZ3PZNqHTlGxzwVfHeS03fy33E2CQ7LV
	iKXxvofFzYLYHmVcCA0uf8X3tNPXLhXYG0ty4qA/cesDQKaaVCN0xevbuRGlTHQ/
	/5j6K/5M0qws28Iv/MUKDu6ZXrZUIHxOr+HhOUqWTMJJBo+JTHKRQeftIR0m+JHs
	lcAWDrp/Gz8CN6122oKLm5q61LFdge55peDlxhrw0fB6H8PHzBmAIycl/H2tLikY
	eRGm/tlAt2blNlPgWfuZbM+POjo7v7qdtnh6fiddLCaEBM3A8D+g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcjr1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 12:31:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532AvEGl004441;
	Wed, 2 Apr 2025 12:31:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aahvse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 12:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8WKzR3x9NePCWVJXIwg162i8lOi/TVI2Fh+dBDGc3fs1yz7BppVUtU9oJyepHmQrrnkJa9nxUuvdEmHyJOr7zHsiosWExIu0OboaHHFBanPNTjHlukcnjHcyQ8C8HbJD31JB3lxXtprg0HWauql+WjTzQ7G1iNKwyfjFiEUYfXW4P7ORhEFadkgTugBhIgxTyaHwBw9m/GdBEyZBfWtaweCvCXxi0ug9jxE8OWABetr74srVwc4z52Hi/HwK4AY7j8pc8MdJJZq5oJfCgJfe9NWlZuNIc5BrGNFhFNYVSlde4czrW2K+cYZEbDIJ0AW1VrXjy7pXt3cfvik6t8t3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6JrScQTfj8q0V5na/pHqx7npIEjW3u9dw7jLy0H2Kc=;
 b=GRtYbHCuTquj4fWy8Iji+uJjp40FnCT1A/wH3VBQYITmg4Dw8YWT9MJhHjHqnTnaLeZpVhRXyd+okKUsk4Nc4HG5cAyrzHsYfjy5Y+ZiVYogJJXd2uV3W5T3P6b5YYxzktygxRuf7GRap21wz7hke00aBf+w9MN8LCVNh7q/UESBWT95hYlsLBmTGV4H4cQGO5ElofEp7TjPWlrG9lXBvCmTsb5oq0XM+/eDgw13JI+/lH33/mK77gxOkgIry2yA3Ht4bXrmZk+v3v2Ldwrabd0Ye7adursxVrqCN9SHyGaKFbm1OQOEsPtucmsu5wRGJNUYJPB8SEuYKqrbCOhDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6JrScQTfj8q0V5na/pHqx7npIEjW3u9dw7jLy0H2Kc=;
 b=uS7b+dRNdIvfEIVT5quR4aTgy4xSQ05+2Ib+NXUV3AsVlz1bct7j2BW598lvT0oBI+GDOlQ97yeMs0QjXYYd9luI64rmgXm6tDSD4hUJfEjRaZgfxZx2dzvDfAOzx++FL5PBhZ9Uemi81kbMyz2mWCS3aY7KulS/sM14ut2TK34=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4875.namprd10.prod.outlook.com (2603:10b6:610:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 12:31:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 12:31:14 +0000
Date: Wed, 2 Apr 2025 13:31:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        xingwei lee <xrivendell7@gmail.com>,
        yuxin wang <wang1315768607@163.com>,
        Marius Fleischer <fleischermarius@gmail.com>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>,
        Liam Howlett <liam.howlett@oracle.com>
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <54b3a9c3-f39f-4b58-9695-d4303341ec3d@lucifer.local>
References: <20250325191951.471185-1-david@redhat.com>
 <abd1c60c-e177-4468-b097-f637bda6ff3c@lucifer.local>
 <f1544453-7bab-4e65-a6f9-d93aaedb8314@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1544453-7bab-4e65-a6f9-d93aaedb8314@redhat.com>
X-ClientProxiedBy: LO2P265CA0262.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::34) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddc9619-f791-4b24-319e-08dd71e2425a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ztYTd1b/2x0YrglwM0Lt7hQBKZYXgRytnt7FwWOU3UTDpZ4K2R0B/Jws7B2?=
 =?us-ascii?Q?c0qUmaweQtXQ/oSoU4TFfFmlOPQIEMRZlqlpKVm4Tfj03mJuEiskZSQlpyYD?=
 =?us-ascii?Q?rzT+LY8Lzfhrynou7YkfC3zri5+QBLJoLyte6RHcu5beCJk3pizdPUpLoaHc?=
 =?us-ascii?Q?5GfBb4lDsjjWbzaZDrdLDAat5yn/V3roLkfKQcv1geemylDlmpzDtkNJTtOu?=
 =?us-ascii?Q?Uy3cpkvOfe829QXR0sX6+yYOcaXCkv2uYHZTX3LsXMyEswvV0MmcL9tBIVy8?=
 =?us-ascii?Q?H4kEQ/SsbQ2wVhrNyHOwAINT+mR/9TFEa0OdTXoWahcZXTMgf1/GJVvSmVP5?=
 =?us-ascii?Q?it7P6wejAEAkgl8CLbD59mIXR/PL0qVoHZU9CRtuReTqxsCikhmB1AiVk/7N?=
 =?us-ascii?Q?4Ipda7M+heHWh/6VQumFzmvEApdMvJY444HPxwICBGC2x0AZwSGJfp+Zb4LP?=
 =?us-ascii?Q?D4JrMbNb6Wrl5l/xjeBEZvkG2W9g/84NQX9BUqdNCc9FJBvvKEsCGm9+bZ1u?=
 =?us-ascii?Q?Pozq+sFNkxWfMrhVnytzQ1gFUtcuAoMZxU0Htaa0lfG6ChxUhBL7Nk/ciLhZ?=
 =?us-ascii?Q?sbx3ss+njj7QOcHCXspl2Os4WrDjmcFZHiGJIrbmgIB7y+Sz7bdqS9Vtwpn1?=
 =?us-ascii?Q?lN/oIYn1kSi4ni2mnTcCZAbU2g+2f3Ht/+Opl4z2nR2GRBhLtLDB8tyR38PZ?=
 =?us-ascii?Q?9Ad6MRvsAgBADoVOGHSCpFEYzTaSi/b4zfIuTVcH1ZeMUAveypX6BtZ+5bH/?=
 =?us-ascii?Q?RINrNT+3MMhDYHuwismWQyfsmSkfS7AxDvjTnxGOkYrnzrgwFJ0EC+grv64K?=
 =?us-ascii?Q?wZTdZCGezoGxbV0bo3wZ06jNsoynPvsNp77xf4L2gedES87p2zk+HXZnKl/i?=
 =?us-ascii?Q?ZpqsettUFq/oJ9Xp5tq892VgUBHczpi+Oeca/tn1G/iTHneKulXA2nlNbmzi?=
 =?us-ascii?Q?B79X1L2s1yZE1bszMOg6WT4bdEG0it3cGp/IXd1Q6DtbTOtUfmIPSNeBOpzI?=
 =?us-ascii?Q?QSokC7SiugBPk+RoBhstF8Ocq/yYWgtGs2MmN3qx92Gv0bU2FZu6kNI65+V8?=
 =?us-ascii?Q?FelTg0sXXePgbKj4coqfW7tqVXBidB9Li6hl6c52ahhJmmEJEggDxmkuySom?=
 =?us-ascii?Q?qXzpYSZVYBK93zRh0/o9b/HjNIZtkx6SsuXwbvvAZ909OEcXJRZh/EJaagH/?=
 =?us-ascii?Q?yLSLgavMCWtGnQh87Pc4h/511aucmAUtVYYkKkzxJ5n4MrFFEOugs7qmK151?=
 =?us-ascii?Q?9CHq5Q9qZ5fcdbw3jOerZ8y2ujRtM5Y4Lj0kkQeZ0CTsa8REb1X9lnufbhVO?=
 =?us-ascii?Q?Ga6bZcJZv5t2YqzA2djm4Jxwv0bTMM6rfOIKbfunEEA79iKx3LNstpZ326TS?=
 =?us-ascii?Q?7D9aJNqvR61dFZoXqRIypklL7N1n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NIU+K1keR8nyxiNP5OkX8a22kk78v6+DqbiMJAap5eVY4KeVKzv9EzdIHwnX?=
 =?us-ascii?Q?uXfFNH765mLICBVlAMRn8I51HyHS98sDVem/re9Xan09oHxqFKoca9ifjh1y?=
 =?us-ascii?Q?k+GQUijyHpJKccA8v4BMHPEbNMfxfY5CfQnWGyweVqwl//7xd4KN3nJURuA2?=
 =?us-ascii?Q?DMPf1RwgAxqyQ0YyJ9IWAHkUR4lLxaGEq8/6jqABdFHVaHxbMoTuAWAtbBUD?=
 =?us-ascii?Q?1mnDzokZmGEByNOUAvqbdyqfgxidUUawnwOde0+sHDHFP+Qd/1dg0EtghQ3f?=
 =?us-ascii?Q?x3YIx1TAsV9GGfXmjnPWSNF+QCUIcjM2gpwJ+UOZesskDOY31P0y6fKAjtf6?=
 =?us-ascii?Q?ffbvDNJgb2gRB5SuHuxNr9nRX6WcWk5xsRMhG7KP/ozsN/q+vasZbrMlDBlw?=
 =?us-ascii?Q?V+YTaK6rs/rDRN0WM+YaCF0t8h0dRz/dunttJC5b7Di7xjJ+nJ4ZOZ6OAT0j?=
 =?us-ascii?Q?4ElqqtHCwdxLIj4SieCffkMbs4BOfE9P/uxUFnW9XcrSDkFnAOpKsEKhVP5Z?=
 =?us-ascii?Q?72NUsJbc5jmf9+dVJwXOgS20V6HFc29HX5aTbGaahGUHZviejDg+UFuuX/5C?=
 =?us-ascii?Q?0avmrZluhzpY22sDGR1BZ8gzeKRJm8dlb0f8rhZI8hEgES4TqdYpAH1HKJ12?=
 =?us-ascii?Q?QaoumodJtNPHNjrBm4aU4J5FdLQosf88+j8s2hgcoy5EJWJQEBfW//ebzhDZ?=
 =?us-ascii?Q?Bk0kNoSzUbH5tv+hVxUdEc9OuSz7WAa+OTW9AgccbzlbbzyP++idCdCMtFLq?=
 =?us-ascii?Q?pMR5esRtIB4y1L3p7E2wl0QDDzpu7u6stjarppmdsdHXMMUf0OKS6fSsLLp0?=
 =?us-ascii?Q?AMBcgJC/1zJ4FWzonpsVUu+Cb4sj3sPxOZgUEuTEu2hWT02EXtkGpxqPc6G4?=
 =?us-ascii?Q?X78y4aVoAVBJL6KSApmIwo9DBEfihyu8wdKW5lUG5ZqsG918HzqqZZPAG9jj?=
 =?us-ascii?Q?aAWouvIDbo5ez2bi0l+MWnWK2Wo5yeVs6u5p1A17JSQnYXHT07bOBZQR5m+X?=
 =?us-ascii?Q?o1aUV+f0Alk2Pxw2T7d5hvHsgB22OaqWdzZzn+KkkLlYmRWbU+4UfAmJQbcf?=
 =?us-ascii?Q?oYi/6Yq7DOVUTy6lavFzRpdAhlH/5vTzSjDweBiBn5Ik6QrcLBKwkeC1A73j?=
 =?us-ascii?Q?gxglCrk78Ar/yKpZVkb5j7CQNNrGdOcjDOStwZQn2T05He0hZWZd2eCd7WAw?=
 =?us-ascii?Q?j+trvVBRu3DO+qnBV8/9/4DpcP8oF4c6SoDBiop65/tFTaYMwuRsuRqw4++l?=
 =?us-ascii?Q?luX/NP+aXg1lT8dYJ0GAYMhSa6892wKa4nqiqlaf1cIdcTT/S6z2E1WAeJ7B?=
 =?us-ascii?Q?PaV7oEuaQyFVQH692lHGsRlTYWw3ISmpWDkwwzLdpMX+Qp4XFzAHtLr5P03l?=
 =?us-ascii?Q?7OLbQ9MZb5fWf98X6hY4VyggMcua0s1rvanjEhFJq27/LyiikdfPviZbJhua?=
 =?us-ascii?Q?zHxHg+iHZpiseWwZ/pYC99fEKNfjFaGyNvv4XX4IRg6CKBe5tIN+el0dA5dk?=
 =?us-ascii?Q?DuAXrRJsKVstlNtkTtivusK8Ka+1PcKLnhbimps/YEKeNx1EITuKpmhATW6d?=
 =?us-ascii?Q?t2BF7DRyZxBa3i7xXZlvA092L5+Jv84Rx1TULKqvvfkkmjgSlo4xtK/0WLwt?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	933kFczo2HVFpTppfBbejZ214bFiyxBfq62DSOPeCgOJR8RXZHpCpFAzhPdGvro/YVsCJSKNr/Ag6H9+NfytXzdL9JSS/fperxKpWAKWx0poepliPSV+R2lrAnZxV3wxOd+DhyD4G6sdl5HogSFGs0milbN38/E5T/PEUjdgq2tkw+FgjBHzTbkbK3IEnc/E3wu1zMZ4QSExKZHaBRYcSmrFQZ4wjun3fhUGoiNxcAOLDcyYt3xqcsOEXuslsuDL8cb7f1Od8zowYskAPhk52ah69N32MvzwrH4VyOmMuECcoEWziFPMGW4NBbUxmt0T+g9WmflPaQpzkIdax/dvG8JfpaAfKFk00O0l4/XCKLFaQWlCxr5aXHXY5KvCqq2kWl283eMqntIHgFoQ+QKFedm+cT0Mn+rm+IRDdhg04CU1enZtXAu3/JrOgwJD/NB6HyKy+EnWiuWx4yplYZ9ZlUTFd5aTmHBbxeL45mF221Sc09ROUi2o2MaT+xdTXIClvDhwXnbt+KB0h3WytqC25SqfsH0GtFbYQj7XlFJEzTLroHE7f7C9ARGCkkZBjuG0dsJI2sNNvWLnVeZgM7HdiNEwiVENlS3uhPUglpNKjnk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddc9619-f791-4b24-319e-08dd71e2425a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 12:31:14.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtEIAHXE/g8TGfJrc1yCRvtE/XDb4Nq3azuBuIHMfczldQRWc8/Sd22difb7Vw3k5bar4sX2rfmXywnbPE7ljrN+cDWuEGWEKzijh6Acwxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4875
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020079
X-Proofpoint-GUID: Ekfh_r0PLpwBpA7KuXThE1lgnoYYJgyk
X-Proofpoint-ORIG-GUID: Ekfh_r0PLpwBpA7KuXThE1lgnoYYJgyk

TL;DR is I agree with you :P I'm not sure where to put R-b tag given you sent a
fix-patch, as this is obviously smatch/clang-broken as-is so feels wrong to put
on main bit.

I guess I'll put on fix-patch and Andrew? Are you taking this? If so maybe from
there you can propagate?

Thanks!

On Wed, Apr 02, 2025 at 02:20:24PM +0200, David Hildenbrand wrote:
> > >
> > > v2 -> v3:
> > > * Make some !MMU configs happy by just moving the code into memtype.c
> >
> > Obviously we need to make the bots happy once again, re the issue at [0]...
> >
> > [0]: https://lore.kernel.org/all/9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local/
> >
> > Which by the way you... didn't seem to be cc'd on, unless I missed it? I
> > had to manually add you in which is... weird.
> >
> > >
> > > v1 -> v2:
> > > * Avoid a second get_pat_info() [and thereby fix the error checking]
> > >    by passing the pfn from track_pfn_copy() to untrack_pfn_copy()
> > > * Simplify untrack_pfn_copy() by calling untrack_pfn().
> > > * Retested
> > >
> > > Not sure if we want to CC stable ... it's really hard to trigger in
> > > sane environments.
> >
> > This kind of code path is probably in reality... theoretical. So I'm fine
> > with this.
> >
>
> Thanks a bunch for your review!

No probs! :)

>
> > >
> > > ---
> > >   arch/x86/mm/pat/memtype.c | 52 +++++++++++++++++++++------------------
> > >   include/linux/pgtable.h   | 28 ++++++++++++++++-----
> > >   kernel/fork.c             |  4 +++
> > >   mm/memory.c               | 11 +++------
> > >   4 files changed, 58 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > > index feb8cc6a12bf2..d721cc19addbd 100644
> > > --- a/arch/x86/mm/pat/memtype.c
> > > +++ b/arch/x86/mm/pat/memtype.c
> > > @@ -984,29 +984,42 @@ static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
> > >   	return -EINVAL;
> > >   }
> > >
> > > -/*
> > > - * track_pfn_copy is called when vma that is covering the pfnmap gets
> > > - * copied through copy_page_range().
> > > - *
> > > - * If the vma has a linear pfn mapping for the entire range, we get the prot
> > > - * from pte and reserve the entire vma range with single reserve_pfn_range call.
> > > - */
> > > -int track_pfn_copy(struct vm_area_struct *vma)
> > > +int track_pfn_copy(struct vm_area_struct *dst_vma,
> > > +		struct vm_area_struct *src_vma, unsigned long *pfn)
> >
> > I think we need an additional 'tracked' parameter so we know whether or not
> > this pfn is valid.
>
> See below.

>
> >
> > It's kind of icky... see the bot report for context, but we we sort of need
> > to differentiate between 'error' and 'nothing to do'. Of course PFN can
> > conceivably be 0 so we can't just return that or an error (plus return
> > values that can be both errors and values are fraught anyway).
> >
> > So I guess -maybe- least horrid thing is:
> >
> > int track_pfn_copy(struct vm_area_struct *dst_vma,
> > 		struct vm_area_struct *src_vma, unsigned long *pfn,
> > 		bool *pfn_tracked);
> >
> > Then you can obviously invoke with track_pfn_copy(..., &pfn_tracked); and
> > do an if (pfn_tracked) untrack_pfn_copy(...).
> >
> > I'm really not in favour of just initialising PFN to 0 because there are
> > code paths where this might actually get passed around and used
> > incorrectly.
> >
> > But on the other hand - I get that this is disgusting.
>
> I'm in favor of letting VM_PAT take care of that. Observe how
> untrack_pfn_copy() -> untrack_pfn() takes care of that by checking for
> VM_PAT.

Ahhh ok that makes a big difference.

If that handles it then fine, let's just init to 0.

>
> So this should be working as expected? No need to add something on top that
> makes it even more ugly in the caller.

Yes, agreed, if this is already being handled in the one hideous place let's
make it hideous there only.

But maybe a comment...?

>
> >
> >
> > >   {
> > > +	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
> > >   	resource_size_t paddr;
> > > -	unsigned long vma_size = vma->vm_end - vma->vm_start;
> > >   	pgprot_t pgprot;
> > > +	int rc;
> > >
> > > -	if (vma->vm_flags & VM_PAT) {
> > > -		if (get_pat_info(vma, &paddr, &pgprot))
> > > -			return -EINVAL;
> > > -		/* reserve the whole chunk covered by vma. */
> > > -		return reserve_pfn_range(paddr, vma_size, &pgprot, 1);
> > > -	}
> > > +	if (!(src_vma->vm_flags & VM_PAT))
> > > +		return 0;
> >
> > I do always like the use of the guard clause pattern :)
> >
> > But here we have a case where now error = 0, pfn not set, and we will try
> > to untrack it despite !VM_PAT.
>
> Right, and untrack_pfn() is smart enough to filter that out. (just like for
> any other invokation)

Ack.

>
> >
> > > +
> > > +	/*
> > > +	 * Duplicate the PAT information for the dst VMA based on the src
> > > +	 * VMA.
> > > +	 */
> > > +	if (get_pat_info(src_vma, &paddr, &pgprot))
> > > +		return -EINVAL;
> > > +	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
> > > +	if (rc)
> > > +		return rc;
> >
> > I mean it's a crazy nit, but we use ret elsewhere but rc here, maybe better
> > to use ret in both places.
> >
> > But also feel free to ignore this.
>
> "int retval;" ? ;)

Lol, 'rv'?

Maybe let's leave it as is :P

>
> >
> > >
> > > +	/* Reservation for the destination VMA succeeded. */
> > > +	vm_flags_set(dst_vma, VM_PAT);
> > > +	*pfn = PHYS_PFN(paddr);
> > >   	return 0;
> > >   }
> > >
> > > +void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
> > > +{
> > > +	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
> > > +	/*
> > > +	 * Reservation was freed, any copied page tables will get cleaned
> > > +	 * up later, but without getting PAT involved again.
> > > +	 */
> > > +}
> > > +
> > >   /*
> > >    * prot is passed in as a parameter for the new mapping. If the vma has
> > >    * a linear pfn mapping for the entire range, or no vma is provided,
> > > @@ -1095,15 +1108,6 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> > >   	}
> > >   }
> > >
> > > -/*
> > > - * untrack_pfn_clear is called if the following situation fits:
> > > - *
> > > - * 1) while mremapping a pfnmap for a new region,  with the old vma after
> > > - * its pfnmap page table has been removed.  The new vma has a new pfnmap
> > > - * to the same pfn & cache type with VM_PAT set.
> > > - * 2) while duplicating vm area, the new vma fails to copy the pgtable from
> > > - * old vma.
> > > - */
> >
> > This just wrong now?
>
> Note that I'm keeping the doc to a single place -- the stub in the header.
> (below)
>
> Or can you elaborate what exactly is "wrong"?

Ah ok maybe I just missed this. I was asking whether it was wrong, and this is
why maybe you are removing (perhaps, not very clearly :)

>
> >
> > >   void untrack_pfn_clear(struct vm_area_struct *vma)
> > >   {
> > >   	vm_flags_clear(vma, VM_PAT);
> > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > index 94d267d02372e..4c107e17c547e 100644
> > > --- a/include/linux/pgtable.h
> > > +++ b/include/linux/pgtable.h
> > > @@ -1508,14 +1508,25 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> > >   }
> > >
> > >   /*
> > > - * track_pfn_copy is called when vma that is covering the pfnmap gets
> > > - * copied through copy_page_range().
> > > + * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
> > > + * tables copied during copy_page_range(). On success, stores the pfn to be
> > > + * passed to untrack_pfn_copy().
> > >    */
> > > -static inline int track_pfn_copy(struct vm_area_struct *vma)
> > > +static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
> > > +		struct vm_area_struct *src_vma, unsigned long *pfn)
> > >   {
> > >   	return 0;
> > >   }
> > >
> > > +/*
> > > + * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> > > + * copy_page_range(), but after track_pfn_copy() was already called.
> > > + */
> >
> > Do we really care to put a comment like this on a stub function?
>
> Whoever started this beautiful VM_PAT code decided to do it like that: and I
> think it's better kept at a single location.

Lol. Fair enough!

>
> >
> > > +static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> > > +		unsigned long pfn)
> > > +{
> > > +}
> > > +
> > >   /*
> > >    * untrack_pfn is called while unmapping a pfnmap for a region.
> > >    * untrack can be called for a specific region indicated by pfn and size or
> > > @@ -1528,8 +1539,10 @@ static inline void untrack_pfn(struct vm_area_struct *vma,
> > >   }
> > >
> > >   /*
> > > - * untrack_pfn_clear is called while mremapping a pfnmap for a new region
> > > - * or fails to copy pgtable during duplicate vm area.
> > > + * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
> > > + *
> > > + * 1) During mremap() on the src VMA after the page tables were moved.
> > > + * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
> > >    */
> >
> > Can I say as an aside that I hate this kind of hook? Like quite a lot?
> >
> > I mean I've been looking at mremap() of anon mappings as you know obv. but
> > the thought of PFN mapping mremap()ing is kind of also a bit ugh.
>
> I absolutely hate all of that, but I'll have to leave any cleanups to people
> with more spare time ;)

Lol well... maybe at some point I will find some for this... when things get
ugly enough I find that I make the time in the end ;)

>
> >
> > >   static inline void untrack_pfn_clear(struct vm_area_struct *vma)
> > >   {
> > > @@ -1540,7 +1553,10 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> > >   			   unsigned long size);
> > >   extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> > >   			     pfn_t pfn);
> > > -extern int track_pfn_copy(struct vm_area_struct *vma);
> > > +extern int track_pfn_copy(struct vm_area_struct *dst_vma,
> > > +		struct vm_area_struct *src_vma, unsigned long *pfn);
> > > +extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> > > +		unsigned long pfn);
> > >   extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> > >   			unsigned long size, bool mm_wr_locked);
> > >   extern void untrack_pfn_clear(struct vm_area_struct *vma);
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 735405a9c5f32..ca2ca3884f763 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -504,6 +504,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > >   	vma_numab_state_init(new);
> > >   	dup_anon_vma_name(orig, new);
> > >
> > > +	/* track_pfn_copy() will later take care of copying internal state. */
> > > +	if (unlikely(new->vm_flags & VM_PFNMAP))
> > > +		untrack_pfn_clear(new);
> >
> > OK so maybe I'm being stupid here, but - is it the case that
> >
> > a. We duplicate a VMA that has a PAT-tracked PFN map
> > b. We must clear any existing tracking so everything is 'reset' to zero>
> c. track_pfn_copy() will later in fork process set anything up we need here.
> >
> > Is this correct?
>
> Right. But b) is actually not "clearing any tracking" (because there is no
> tracking/reservation for the copied version yet) but marking it as "not
> tracked".

Ack, thanks!

>
> >
> > > +
> > >   	return new;
> > >   }
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index fb7b8dc751679..dc8efa1358e94 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -1362,12 +1362,12 @@ int
> > >   copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   {
> > >   	pgd_t *src_pgd, *dst_pgd;
> > > -	unsigned long next;
> > >   	unsigned long addr = src_vma->vm_start;
> > >   	unsigned long end = src_vma->vm_end;
> > >   	struct mm_struct *dst_mm = dst_vma->vm_mm;
> > >   	struct mm_struct *src_mm = src_vma->vm_mm;
> > >   	struct mmu_notifier_range range;
> > > +	unsigned long next, pfn;
> > >   	bool is_cow;
> > >   	int ret;
> > >
> > > @@ -1378,11 +1378,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
> > >
> > >   	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> > > -		/*
> > > -		 * We do not free on error cases below as remove_vma
> > > -		 * gets called on error from higher level routine
> > > -		 */
> > > -		ret = track_pfn_copy(src_vma);
> > > +		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
> > >   		if (ret)
> > >   			return ret;
> > >   	}
> > > @@ -1419,7 +1415,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   			continue;
> > >   		if (unlikely(copy_p4d_range(dst_vma, src_vma, dst_pgd, src_pgd,
> > >   					    addr, next))) {
> > > -			untrack_pfn_clear(dst_vma);
> > >   			ret = -ENOMEM;
> > >   			break;
> > >   		}
> > > @@ -1429,6 +1424,8 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   		raw_write_seqcount_end(&src_mm->write_protect_seq);
> > >   		mmu_notifier_invalidate_range_end(&range);
> > >   	}
> > > +	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> > > +		untrack_pfn_copy(dst_vma, pfn);
> >
> > Yeah, the problem here is that !(src_vma->vm_flags & VM_PFNMAP) is not the
> > _only_ way we can not have a valid pfn.
> >
> > Do we still want to untrack_pfn_copy() even if !VM_PAT?
>
> Sure, let that be handled internally, where all the ugly VM_PAT handling
> resides.
>
> Unless there is very good reason to do it differently.

Yeah agreed, missing context for me was that we already handle this.

>
> Thanks!
>
> --
> Cheers,
>
> David / dhildenb
>
