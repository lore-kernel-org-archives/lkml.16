Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35444175D53;
	Tue, 20 May 2025 05:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718133; cv=fail; b=GBQeGzdlxTOPetngbQr3qBZ9iJjSA61OrR4EMa/QASteSnBz4ibz+lBbcvVME/BTsYxxxvBy9n7s1w/arGRW1rdb/QFXO1eUk4K1HxsNuCeGpfz60MmKTwguy9rc+tT/fYP1cJmVX3vNEWTEgNftKpTYCra4ns0uOqQvcjxB2so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718133; c=relaxed/simple;
	bh=ImiwC+3Z073DnDYXqcJerMFNkZHbpBFHXervE3Z0R+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hO3rxYZYAWNWFs+QXcuDJ6/MFkBc44Lab5wb9pY8bwQ8eTyArPkoN8Nkn0tVhB6aNX7z/2VOCa42c38w0iDwsttM8bCo1R6b7IEGKhYc6zmVOwJqtBTKIq+ry4WEOMDolIyX+IvrU3XM1lx0OQqMXv+5/NSvcmNEgGYsirvzid0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=APZhjhOj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lNDypfmw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="APZhjhOj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lNDypfmw"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K1NJIU014527;
	Tue, 20 May 2025 05:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vCeaxSzSN0oYgscXtQ
	i03QcaUN9E/ztX2mL9z5c0vuQ=; b=APZhjhOjzk5jdkBI7FNJS5X45b55TJLB8v
	BWnfgPbqbppSlMxeQ8KVIzjIwL7qIs8XgOoHH5YwTYHrzbNP6GqIROUVOH/2kWCE
	waj/ZBm/Cb/qaRQJZyxMOe1zW+k97+apUGeOiFnvZvKFNnFeMK8yILoE2nuxB5SM
	epgUXu3RTfXlqBzq76myuSdumDwjuRofWCrIOr9ucqXSf8ThrxAsnS6TXhmQmkrj
	W14cwRAMP3yfOnWp+t1JH4J8Cs9WrNM5ec2WRgHJKJLVNBFeV3ZTAoyT7mtIRlFK
	HgqyZJni++yFZXXXWWlEBIHBbexnUbCkDoPOTpxOH/YUIjetn0lg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46pk0vvf45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 05:14:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54K3FKI0017366;
	Tue, 20 May 2025 05:14:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw7rvjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 05:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg4j9KmtIwiRw/t1UHANqgEGpNX4gyetHj9oYHUSVjcrA1BWyEsQcu9KsuYgqvAFDjsrrktYc/GohGD05G8u/3/rGray7SysIcvijJ4uE4yJMMlPdr6JIZHZqJ6fRwg2/dvxKuhVgwdTvq/Bu5m3mYsS61JVwzOpyz4zB1TtKHDZvaF6VKZ6l0gVbTaEBy0gHhsLOesFon9RF+aPqFks3XWZeCrPYfaCWtYfpzdj3+Qy0JdyKmzMJF6mQzcOVo1940fGplTAZyg9C5czc4ldL2tPxQ4E+RkaYXthgCHr2owFSN3vWIY08JfMmCn6xRTL+HzBqLAVyFrrcQk0vmSgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCeaxSzSN0oYgscXtQi03QcaUN9E/ztX2mL9z5c0vuQ=;
 b=GsqS1nt7CdeJjgfm5/LQ6fvP7ZI2k61cNb6H1U10AisSGuiWEfK2Vu+oisdEWXR1ixm1w/hu6sF/q2B6fRczLJxD0mIKq9U5SGrZJvNrpGcU3SRwG/fdTISj26qDkWV88ZK7soFEDIjwUabXFsjYZEnVMrH8KOI5bZmheuKN1GIQGqzLSLLKO8lu6rryrlzzdaMpMw0/CtLsXgwu5RztROYdDv54T9CqGeqHuhHSW+5XwUObAYEr+JviES1kq73mWaAprxN2qV73tV8hWoGSAbNjxUGHHFn9j2xCx+ahjW9j2CXf4hwwjhpSe65XjvvjqNJn4GUSqIunSNSGYzI+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCeaxSzSN0oYgscXtQi03QcaUN9E/ztX2mL9z5c0vuQ=;
 b=lNDypfmwQGH64UBMXF4/zkNtRVsdLz0YIdq0HO5WD+JqwLeK5XSWjsXce3Ba+duIoZzfmdYB+qwwAhGIIi+cqv4UCZuG5RrpFInUx6RDYh6mE60W1WsFJc+6XhUXRAauO4YEdF8uio+h4/iC60T4sCn6+RggHXT569XqEj8aH6k=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF1425E126A.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 05:14:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 05:14:38 +0000
Date: Tue, 20 May 2025 06:14:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <562293c3-fe6f-448c-a5d7-affb1d622c7d@lucifer.local>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
X-ClientProxiedBy: LO4P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF1425E126A:EE_
X-MS-Office365-Filtering-Correlation-Id: e54267f5-97b3-4f2e-7e66-08dd975d37fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6kfzndy/+lshYsQluusKgikdTzEgWwOvGFIYk7BtAl7Va9yOGhP+f6QKCRO6?=
 =?us-ascii?Q?R4uSufIvObsFyvqb4sh/TR3dWjsTTFqlKedR+Hd+hKZywOaKVpLRZoMBVutm?=
 =?us-ascii?Q?0zuOSxL65yshbCjtaUeVAGZN0S2ZNBEKD8mowBvcfIat/B7RsjM22NisaynR?=
 =?us-ascii?Q?g3NUxy1+2MSErzbU0DgeYSqtnrnkjAZtCgwQirL86L2OFU9/qZ2GaKlyTHTQ?=
 =?us-ascii?Q?RhDThAsMVSqbiAltUMm3TbZUA/VU4fjgztO4qwhNlaN//KBUNBlgk7lHekiU?=
 =?us-ascii?Q?rY+yfiMBnjM4wWLrWAVnYVF2UP+AU67LXYLKL2lXlqr0Pf6QTwcA9h/uAQzA?=
 =?us-ascii?Q?IrwP4jEknJ7q2zp0+2g7p+l9rVtipkJgZxR4WTjD8NnsW+r1RQjHnDtGvnz6?=
 =?us-ascii?Q?zyC03LWUDO8w6dFL2WYy64MCLOE27P6oTSgGEYEl7p/yI8mpxiPVmxQ/8XkM?=
 =?us-ascii?Q?BZytA91w2vhdCz+eAkiHVAhu+CdZw8+89wR4zu7+UuYA/HisHdV+2vwqCjv8?=
 =?us-ascii?Q?aQP5AsOfLQ9Yx+gf/XUgUWoBlJCDxMG0QPfTsF/cajwotPqCTv6+J3QXw/EU?=
 =?us-ascii?Q?W6rWTZesPs0UyN232yrTZFeORSCt6h/QDYqtuUAgQl1kobIjfErAHmbsatcD?=
 =?us-ascii?Q?Xv7MWiXPHMkXagdT3clOx02WJ45omHVIFuwbi8hWEbOrOSjeDoZeZJlf/fSk?=
 =?us-ascii?Q?HywIwvMgZXwKUTsLyCLIun6QOzjjniUhDV9zc19w4qDApffORX4o+xvYm6w5?=
 =?us-ascii?Q?DvkTKBKS08TQYws3SPVyzMVr8kvedjtGhPan7xRlHcEeW4J846UZCxVdc6PA?=
 =?us-ascii?Q?eWfyqJLqk7RI+xkMijLxQLBfu/SOmPr+XBrrPOnCOY2unC8vDKP7KmxzPRoe?=
 =?us-ascii?Q?HLbGHvv1nB4JqzOIgj+LsE/S4QkptuiWdcON6b5l4bt7dmsRkkfckXCFOFip?=
 =?us-ascii?Q?yPs+ZOm4SdLHRNJOj4MweMgMb5VzLF8tvKHShUwlC8ISIH8QjfovXIlL8J3E?=
 =?us-ascii?Q?rzPQfC3fGOs2PiCCbf0ZgjnqnVKvyWGaDHhZvvU9G11kA1pwkcA0SlOy951S?=
 =?us-ascii?Q?/3F5sZHZEDadn5Cu4UiuzcLke7oQxfmQaS84t6Zr7oZfVv036laeLz9rOxED?=
 =?us-ascii?Q?DyHH1EcLn76+ACckamqr6gehoubmglwgA+eLeMKJBiLQ8a/MmYXx2WVU/kxc?=
 =?us-ascii?Q?VIeaX9w5DgUw7wQi7rDd10ThJcvyF6cDzJ8UbuqwHKVtFmHpXyGTD1b1DC+S?=
 =?us-ascii?Q?NzugOcy2XMFIwOd1fiAUgcH9Xm0Ju8BoH6ZY2vtwy0rGXjw4O/bMH77RGk1q?=
 =?us-ascii?Q?AiqKO33hlMC44+ah+b9rsKRr0AsO/op1LwlZbel72dEVj9R1gGur4bV7yllS?=
 =?us-ascii?Q?YwJLtxiN0OtaenG3l9UgMesGMuxje/Bi8z+XKcRTiv4CjygrCeFIFAToEieg?=
 =?us-ascii?Q?NXc+XjVOxIA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qnCplDfzikkRixpXRkDPh082AjBFKRuVG+L7gkbg1ebewdcjMBSp3QqC7jlo?=
 =?us-ascii?Q?V5PkM+rIAi5Fwg+9Cb1rx6u8+Vvouw/4M1mfwYjt2kX0W11wAo4LySOt3C1Q?=
 =?us-ascii?Q?JN1liWgpyQSEQOREfdGicx/QC+uQuD6x2m9J7lzhyi6pH5EJagvLNiYhPteC?=
 =?us-ascii?Q?M0Nd1FMUADkraGYy4lJdDyoQE88tLNEEanl9MpUteJoCKcPmvz2kTUHuW2/s?=
 =?us-ascii?Q?Ju/QXD3rGYQTFKjMqtd28ucFUIHJcxAs1tqlYiO+1EuxHQixBUPxYehrw6/i?=
 =?us-ascii?Q?3+zif0TkPgZWpDM8A+09zuc0qOXc+1GD0k7B7NCp5rQp5Q3TY8rfacW8dBoS?=
 =?us-ascii?Q?wgGv9RCDEkNkOzCyctVlLTAboaPAUINN7z4sUqg0gzB0azpdqoMTs3TmSAng?=
 =?us-ascii?Q?yCiZg4DEeD4Q9whLWeP3N6WObdPSB64Bp1AfuxUuVOGzvs7OiCB/GPOAdzJe?=
 =?us-ascii?Q?G3EjIwGTEoHO7a/1BM/qChsrAdRr/OcdnqdyWfLsnAJyGX+J2mLNrvDYTbjV?=
 =?us-ascii?Q?2txEJIQ2G+19mHCQTnLGPToHjZopc6a9WmZ/RAtjyQ9Du2HTYc+V7bt6rz0/?=
 =?us-ascii?Q?Wfrz4Ph3TwU/qqt4mDPuDBdaL0urq9ZB7o30mTVAJRxUcrVNGlmENBVnKTt8?=
 =?us-ascii?Q?bJwA3nBmlZiShf3BlQTHjaFAC7Atd+RdoVuatwTD2l3Is70iZtDWjduxk24c?=
 =?us-ascii?Q?6iSPO2SQS4XUmLKD/zcFAI9Dxsi2BcLcROqgCa7onWy8CBb3WJICYp8H4g0k?=
 =?us-ascii?Q?9bOdsoSTDUREKYFZ/iFZN5JFii6ciIYplqJeM76V48Gxe9oTOVNdQ5mJcSsM?=
 =?us-ascii?Q?/SdNenEHML7ThzrpHbM9FZLNLQ8n0ccghsL/9+9OUgi/BCWWEj7lP4xxM6KJ?=
 =?us-ascii?Q?Z2gO0s4i6ncPd9dvmhYRj0HAiVrh/bmEVC138D5jcqU+0cMZmC9q+b9oqxZm?=
 =?us-ascii?Q?iUJXVeCVrLwPcRRx0GX+Di8roEkopm2Vz1/sSxLkwsDOQg03EBSGfT6IKaNq?=
 =?us-ascii?Q?Gf6Vx8zYJmJAz7yWn/FXeqjp9LdKuk0vUZWgcoEyFJmWvCi6c3bCbx0sRq6Z?=
 =?us-ascii?Q?CZWwVhsQzoe+m/3By9glaDuMvxece2SH1/WwP/272/TcGaqZL5klBBlSgiyI?=
 =?us-ascii?Q?ktlZskjqZ08cmQYZoUeCVNUSOpEzzJL/AAtCDa5Cu1NlAMnXx754aa1oVvEH?=
 =?us-ascii?Q?6deAfu8WoHF6EciOjsvN/3Ji6nW8tDQbBCa9zOtftNT8BGi95HU9tMC7unr2?=
 =?us-ascii?Q?jJAp2ct4sjK6fuiwG9JTwUmQNkaweAyUa8CPcyLDUtA9olQii0Ciz5DXUPu7?=
 =?us-ascii?Q?dAmDzG7WdXbAbiFDLU319rLR6Ha5Z5MBHhzZT4YPwhFGAHbxk70t3f4/8f5l?=
 =?us-ascii?Q?U1oOfh5G8hYsVbZLFF360L9ix1CuPoFzXIiJVRuQFhFxzWAMxVfGfxEuyORp?=
 =?us-ascii?Q?zMbPwRB+KTAgE+Sfq4CdlaBY/w8Gjb7ufFZIPCZyFsbFy6vPn7TYxCAm5OGG?=
 =?us-ascii?Q?zc+pc1DlJWt0JyUYbY/AB/CXJOn6f3SxqMnDtkIsEJEE1dBJaVXw4NAS9c4p?=
 =?us-ascii?Q?GK03VBotHueHVz4+y8edS3cGIk7u6GkcRhDQ0QVSakM/fJYA08Ay6G9O6bYR?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j2HRobsiZP2nC+9VgHWK+t6ypzNv1LwEC2hXnIhJicSXxO+cBL5VboI6xzDixko7HWNYlbPUHyBHZPpsvJ6FyW8VZS8rYM4FXanDDT8GpojW0WNhl1Us/MbljNc7ZcS2k0yAdoCdC8wQP6AffF7UCDxtD/K8lfamHjubyCKOsWnTI1huRnVfX8SuoHmPUh5V5EYwKiS1VD1Jy0I4EMIrdi299ahTNe35yrwN197J9xHQQGMHip0UB/ye9D3lFDgMesx7Egf45lfsg25dU+RDSjr9f3ojM6vqBZJyVJC0u8pNTvHvwK1D7qK0Vn4jxACTS37IAHL3hIQ+2Ex15pTWBNyQVW/OCTqDZvz9YmCcIY6KFPEanjUqBC7PgDghVv1mo8kNMypGtnppBLtWWM1djFZpaOV14jiFWoLVyrshAqPKlvUfIjDokOgMCSRPc11BM8JpWeE3bLf7ywJiBMw7a79OU48l8bAR1VCvlOsMlXUND0w9lBO0RY/0fAuLE66HaNQyKANQnoCuO0ynzifV49hxineH4eKIZ6lUrmJu1rln/JWiLNdbg2G7Yr0p5VXT3M+GoBqnHlZZSsU8n4GAw+VR0B8EJe03ChyEUoQudXY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54267f5-97b3-4f2e-7e66-08dd975d37fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 05:14:38.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cs3nuNfQuO7ydcyFgORd/tA/wzEJu57c9fVY1kjasDxV2JBnzlBplHNtd4sdYTEbvcRPoB/iPIYub3sZzUnoUEGMczHxejqzOfCPeVpbMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1425E126A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505200041
X-Proofpoint-ORIG-GUID: PrIXH_a1Sy2tBn5NPh6gE44ybQsdJhT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0MCBTYWx0ZWRfX8h562X4L1zaH 2R+qZlHjwtuPs9JnXc4o1W2mnTpYuTWw9s5vV6xnSccp8j7M+CM3eIWDKwnzntaMXPVzldLtxNk ZAjz7jmlid5S2YZgpTqztkjezGFFvAMRx3RPxz2u9glukfs1Yt7GjeSd5422iDO3zQgEw7yVYVW
 1bdoA0G1txKPeZrKLCZALGWMh3ljEWA0j9T6lmeVVGltKa5Y3ZzTHivljtg5m2lCxdpp4RPnGUT oJlgsFiTc3eGPulhagfiZZT2Ahg9/+gUHTNvVmAZBd0GvBVV2eOl37+eWvQsuyRMmhJDKx97jRW knaVtwYlmr0hZxhGVru0L7DIGOQ8ogDrnF7mjMLvWMARJSjFkRKjdcb78rqMes+InpY0DzG1aYo
 +w6ScbKbXVcvBPEU+vlBSdwlfK+rmJszOUf2zwqIjRdyT9gT/YagC/jHLwDTT8f8op9EHFd2
X-Authority-Analysis: v=2.4 cv=CMIqXQrD c=1 sm=1 tr=0 ts=682c0fc2 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-zp74n7iqpFDqg5IVLoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-GUID: PrIXH_a1Sy2tBn5NPh6gE44ybQsdJhT6

NACK the whole series.

Usama - I explicitly said make this an RFC, so we can see what this
approach _looks like_ to further examine it, to which you agreed. And now
you've sent it non-RFC. That's not acceptable.

If you agree to something in review, it's not then optional as to whether
you do it.

Thanks.

On Mon, May 19, 2025 at 11:29:52PM +0100, Usama Arif wrote:
> This series allows to change the THP policy of a process, according to the
> value set in arg2, all of which will be inherited during fork+exec:
> - PR_DEFAULT_MADV_HUGEPAGE: This will set VM_HUGEPAGE and clear VM_NOHUGEPAGE
>   for the default VMA flags. It will also iterate through every VMA in the
>   process and call hugepage_madvise on it, with MADV_HUGEPAGE policy.
>   This effectively allows setting MADV_HUGEPAGE on the entire process.
>   In an environment where different types of workloads are run on the
>   same machine, this will allow workloads that benefit from always having
>   hugepages to do so, without regressing those that don't.
> - PR_DEFAULT_MADV_NOHUGEPAGE: This will set VM_NOHUGEPAGE and clear VM_HUGEPAGE
>   for the default VMA flags. It will also iterate through every VMA in the
>   process and call hugepage_madvise on it, with MADV_NOHUGEPAGE policy.
>   This effectively allows setting MADV_NOHUGEPAGE on the entire process.
>   In an environment where different types of workloads are run on the
>   same machine,this will allow workloads that benefit from having
>   hugepages on an madvise basis only to do so, without regressing those
>   that benefit from having hugepages always.
> - PR_THP_POLICY_SYSTEM: This will reset (clear) both VM_HUGEPAGE and
>   VM_NOHUGEPAGE process for the default flags.
>
> In hyperscalers, we have a single THP policy for the entire fleet.
> We have different types of workloads (e.g. AI/compute/databases/etc)
> running on a single server.
> Some of these workloads will benefit from always getting THP at fault
> (or collapsed by khugepaged), some of them will benefit by only getting
> them at madvise.
>
> This series is useful for 2 usecases:
> 1) global system policy = madvise, while we want some workloads to get THPs
> at fault and by khugepaged :- some processes (e.g. AI workloads) benefits
> from getting THPs at fault (and collapsed by khugepaged). Other workloads
> like databases will incur regression (either a performance regression or
> they are completely memory bound and even a very slight increase in memory
> will cause them to OOM). So what these patches will do is allow setting
> prctl(PR_DEFAULT_MADV_HUGEPAGE) on the AI workloads, (This is how
> workloads are deployed in our (Meta's/Facebook) fleet at this moment).
>
> 2) global system policy = always, while we want some workloads to get THPs
> only on madvise basis :- Same reason as 1). What these patches
> will do is allow setting prctl(PR_DEFAULT_MADV_NOHUGEPAGE) on the database
> workloads. (We hope this is us (Meta) in the near future, if a majority of
> workloads show that they benefit from always, we flip the default host
> setting to "always" across the fleet and workloads that regress can opt-out
> and be "madvise". New services developed will then be tested with always by
> default. "always" is also the default defconfig option upstream, so I would
> imagine this is faced by others as well.)
>
> v2->v3: (Thanks Lorenzo for all the below feedback!)
> v2: https://lore.kernel.org/all/20250515133519.2779639-1-usamaarif642@gmail.com/
> - no more flags2.
> - no more MMF2_...
> - renamed policy to PR_DEFAULT_MADV_(NO)HUGEPAGE
> - mmap_write_lock_killable acquired in PR_GET_THP_POLICY
> - mmap_write lock fixed in PR_SET_THP_POLICY
> - mmap assert check in process_default_madv_hugepage
> - check if hugepage_global_enabled is enabled in the call and account for s390
> - set mm->def_flags VM_HUGEPAGE and VM_NOHUGEPAGE according to the policy in
>   the way done by madvise(). I believe VM merge will not be broken in
>   this way.
> - process_default_madv_hugepage function that does for_each_vma and calls
>   hugepage_madvise.
>
> v1->v2:
> - change from modifying the THP decision making for the process, to modifying
>   VMA flags only. This prevents further complicating the logic used to
>   determine THP order (Thanks David!)
> - change from using a prctl per policy change to just using PR_SET_THP_POLICY
>   and arg2 to set the policy. (Zi Yan)
> - Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
> - Add selftests and documentation.
>
> Usama Arif (7):
>   mm: khugepaged: extract vm flag setting outside of hugepage_madvise
>   prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the process
>   prctl: introduce PR_DEFAULT_MADV_NOHUGEPAGE for the process
>   prctl: introduce PR_THP_POLICY_SYSTEM for the process
>   selftests: prctl: introduce tests for PR_DEFAULT_MADV_NOHUGEPAGE
>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
>   docs: transhuge: document process level THP controls
>
>  Documentation/admin-guide/mm/transhuge.rst    |  42 +++
>  include/linux/huge_mm.h                       |   2 +
>  include/linux/mm.h                            |   2 +-
>  include/linux/mm_types.h                      |   4 +-
>  include/uapi/linux/prctl.h                    |   6 +
>  kernel/sys.c                                  |  53 ++++
>  mm/huge_memory.c                              |  13 +
>  mm/khugepaged.c                               |  26 +-
>  tools/include/uapi/linux/prctl.h              |   6 +
>  .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
>  tools/testing/selftests/prctl/Makefile        |   2 +-
>  tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
>  12 files changed, 436 insertions(+), 12 deletions(-)
>  create mode 100644 tools/testing/selftests/prctl/thp_policy.c
>
> --
> 2.47.1
>
