Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E91A00FA;
	Tue,  3 Jun 2025 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947555; cv=fail; b=IHzrqGKuMZsYLlOv8z560MtWU1MqmXlhW3QZflTiMtrNv3ukTYslrf9myDvDbMPOnscVw576Sf5lsGokQ5L6oYyt8Y05BUjV77H9AeuGgERce13d7QOfMYRezOoedMpAkIjFXfEBcF1SQWaSzjLGK8IaBwwWxdWBNyaYrrp8Rmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947555; c=relaxed/simple;
	bh=NPX5MBo5uQ1DMyTttclE7Cl/d9ROEDdgKkKYyHJ8kAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mX2euxW8B3CDlku/gytka4cUTP83ET4UMVLtYAGmJuJfHWub0AZtYWEVPBnX1sk5qtcQhes3eQcbqlFj3BkWVBSh+njDVoyd+hurDHrE1ydk2K/5TcN8HbSH3AOncSKc0SgPHMfs9tWgAaM4Tw6rULpZE7Eb+EEzf7Camy4nVPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ha5Gh6Re; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xBGWyz7N; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ha5Gh6Re";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xBGWyz7N"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AF0H3017437;
	Tue, 3 Jun 2025 10:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oJmsIsuchsZEQZpYcy9Mi49R1WNC5wYaH1YUu1C9Cks=; b=
	Ha5Gh6Re0+/vjJweJUF9cWXiP3WnN2Xdg+a+MSBL+1O14SQ5vj5+iqPk0DvFIi2Q
	MhZZ9V38X2Es57WJ+BiIA/vQNF9KzwYbYNzpYyHipEXUBMxyXt9QSjG2mb9TvbaN
	PLexAQ/uwCumQXfvYjiveFP4jdChNGp1jM3CTWUebeFBlwfAo+W/1HV9ynkf5ARD
	08z06mpJzzZeAEs7NMVf0zaQ28tKuE7fLWl1Z2vy1+KQljE8OAusNjHBo8Cn/OEn
	6GgAFxCLgq7+mFexr3S5ky1FzVF85fsVWD60V2BTtw96Wi+rzkAtszcai1MwUWz0
	rJGLgXUSaZzP1ogBymQCeA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8csjuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 10:45:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553AIqp1030739;
	Tue, 3 Jun 2025 10:45:28 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr794g4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 10:45:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdkOtnlaE9E0hnEUVHtwOCEdWXn5GpSaflsCvUYyqaVVzsMbq8IHo+bq53p0KSDXy7nT3+k6XA29dLwzgrhLAzV7dBbAMWGl94wItV7nSw4fEGyjO1irJITZoBong/lBEmW0SijiQ4+1Gr8GKgVrMEpXNMr2ItG8IfKomn/UihRizKSDRJZCe9O5HKIXy4adThWMK6JGisdxv1XDUF8VanbyqPr+ZgDNMUC7i48P24qxSgtkf1CRdZG+RVut02b++5CLhr1rbBhlIPU0a2RMKr2hU6YI0M/fkEuFoihr/UfADts3MaH586pDc88SP52xK+f/2eblGwnV9P/K885PJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJmsIsuchsZEQZpYcy9Mi49R1WNC5wYaH1YUu1C9Cks=;
 b=DbVjXsaqVdnJoL6PgKPjQnKNT20BjKglaqK9G7Z8DBFF3EvzjlvM+68ukIIZaXmsfMKhmYBXuqT1wOPjhneOzLYaE2vSZ+MftJcw3ZKmFBhPzgttoCfxxNoM6ZIqIGhaUMwHPG84GjFKDSBt0WEQys8RDEV2NETn2jcJ3etjo2l7sxGGC6+BFSb5u8l2LCtctmGW3WRMNVyF5kY6JTABBPKn1Upf7OYGFiQ3xh8UOlD4DVVtvSjOwEWwhQYac14Rco17tXOL+cnpQVVpN+yMdTp5IaW/UBmL7kUH1gYWMYE1g9OgnDTVqH40fzfxlnH6Wg/hLqpvzgxnQugczGY1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJmsIsuchsZEQZpYcy9Mi49R1WNC5wYaH1YUu1C9Cks=;
 b=xBGWyz7N/5eqBAicoUDMSnuz1Bsi8v9HqU87b/RTTSvQd50h8efxWNGYr19puGZKnfZbd1/voRuhQKqYJe6ecMNVRlviuNgIBjZPEzV/xHPmfRtodQtO1l+DFHyDbMkKJoI30MkbC4mWFQvwry+5b6KrbLjP7doZlJnTALGsLHM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4628.namprd10.prod.outlook.com (2603:10b6:303:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 10:45:25 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 10:45:25 +0000
Date: Tue, 3 Jun 2025 11:45:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <f08104bc-8ef2-4f6d-8d23-e5a087595a40@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3DCwDdA1UfzonFzradrYq5VmhwLGgqMXNq6k68tr+w6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3DCwDdA1UfzonFzradrYq5VmhwLGgqMXNq6k68tr+w6Q@mail.gmail.com>
X-ClientProxiedBy: LO0P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a102af-8b15-444c-153a-08dda28bbf35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0VDQ3NyVlZSM1NENE83N3Q0NzQxVWhkM3pTc2dmcFNEaHc5R05WcmxXWllv?=
 =?utf-8?B?VUcvd0R0V2dseVpvaW56YlpXTWFhTWZ2OE1NSmMzck50Mk1DNkJHZ21UREJo?=
 =?utf-8?B?aVI3UUpVb0FzOHZtZGdHSkozOC90V3oyK3lySUlUQ0MvTWJDaTloSDNyaVVP?=
 =?utf-8?B?ZDRuTnBERE0zc2hwRGwwNkZ5N3hOemNYU0grK21LMzJaclovY0Fhbm9HenZz?=
 =?utf-8?B?NXhycStpUlRSRmdmUGVHMW9Rei9EYXh5ejFGTzN1L29uUTRHUENDMXZqeDQ4?=
 =?utf-8?B?MHExWkFzOGdQdnBrTkZQNGNLRTZOcUlXbXg5WnhzRnRub25yaFR3ZGh5b0tY?=
 =?utf-8?B?Wkt5VGNqdlRDcXpLZDFDaHJBMnFEemEzd2VrckUvWjBuTkhrS2w5eEhXWjQz?=
 =?utf-8?B?Y3F1VnZwNG9sL2hURm1vd1YyOU9vbDgyQmhKdjJHRS8wdmVTVmZnQUU3aU5D?=
 =?utf-8?B?NnBSVWhUT2FzTlM5b0grMjRrMEIzUFdIRENuWVhZM3VtZVZLamRObG1NSktw?=
 =?utf-8?B?ZC90cnZrOStmWityQkhZMWl1cnFRbVdSOUtNSXV5WlpxTE1XOW9OVnpyWGFn?=
 =?utf-8?B?QktEK3hKckxBczlVNTdERmpjbWxqTmZsTkVLTVZPUnhzYlNwdml2anZjeDRp?=
 =?utf-8?B?UG9LQkFITVpkZlBOT2wrSXVXNzVKMElSUC83NWZZWitDSnNwYTZoUkV5eTJ4?=
 =?utf-8?B?YkkvQnFqSm5ZbnpwUjRNeW53LzhkMXRpV0lzRU4zRmc1S2plT3FLVzIya2FF?=
 =?utf-8?B?d29EQlRveE40T0ltUWF1L3Zwak83WDNyU1JBc3lQT0hySmtnUnN5NUZXVWJu?=
 =?utf-8?B?bXhRUFJRbmRSZmtFa0VvUlhFYnd2eFprUUJLVUxnQjdXNThhSy9hMG4xaGc0?=
 =?utf-8?B?a0o1L1U5aGFkTGVDMTV5dFNoV0QxVThLc1M3bWcxbEViQmRsTWVBSzlaSThO?=
 =?utf-8?B?MTBsaVVoOENzckhtSURnNkgwcVFqdE54cU1uZ25sbUhxQ2l6YVJReHdSUjh1?=
 =?utf-8?B?ajUyQkh6WmEydjdEM25NcHJzUGlpa1k1Nks3amVNRFdBNzRoclJ2UDFoNUVS?=
 =?utf-8?B?RjhZVnhJaStTMm5zamhWbzJyMVE1UjN3RllBOVNUbHNjQWpMQmhtZWtMTEdk?=
 =?utf-8?B?M0drL0EybnhZLzhHS3FId1hoSjFXcGZJNnRxRnJQOWQzZmxrV0NzZmdybnhu?=
 =?utf-8?B?YzdxdGo4b1RpbWxGeUpoTWplcmZSc2NIWmxpNW1oeVRTL2JSWjZGNThIQ0c1?=
 =?utf-8?B?ajgydVJjNlZqNGpOTVJDSUl3SGM3Z1dLb0xPZkFiTHZ6d0xGOWlLMHdqSFFu?=
 =?utf-8?B?UnlnMUxhK2lCeHNWVldsZDNTakx6UTlyYmJnUFVLNXBLVkdxaURqMXp2blp5?=
 =?utf-8?B?T0cxTDVCbzdJMWNFNDRyNVl4cjB0eXBXcGpaeHNCbEhqUkVSMjV1M3hxVVBK?=
 =?utf-8?B?bEJMMjJNdndFWUg2OGZsb1g1UjNEQVB4a25yRkIxbkhUeCtaUUdUSlcyYi9v?=
 =?utf-8?B?TVlOTzhvWFl5Q280RzNFbUU3MGVOMGFPYVNWTkN2VE0zbHNOZ2RNVkJmSy9t?=
 =?utf-8?B?Zi8ycFpBTy9GaU9hYUMraE5SYjdnSUN1M2wyUVEyeE9iUGNrS2kvTnJ1MDFs?=
 =?utf-8?B?WG14WmJvaWluU1RpZE9LcVlBWkM4ODFudEdkS0pXNmVhczZzQXhxVmhKaFc3?=
 =?utf-8?B?c3N5YWl0c0VzUGsrc3IwbDZPbzFaZGVQYVVyZ2dic1Z6VWl0czBiL2Z5ZU5R?=
 =?utf-8?B?WDZBTDVoMWxic0VuVEwzVnRZRTlEVGpoR2drWDFFRnFPVmdnNVluL283UXlL?=
 =?utf-8?B?MEJBOUxzcm1RNmFFS080SVhGcFp5VkIxT1huMERyeUpQeEdXdGFZeTU3blZ2?=
 =?utf-8?B?cmxnd0cyZXByNGYxblRTd2Z2cHBySGRsd1dTWWlyTXdlTlVRcUxLUVBUUXIz?=
 =?utf-8?Q?clA3HVOY3vQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjVqNENLeDQvT0dQR3cza0hvYTBwTEUvRTRadVJLYWVENnpoZUhXVy9zZVF4?=
 =?utf-8?B?aURZbVNVYmlLU0M1dGNQcExEbWYwVmo3N2kyQ0hJTDJtWGdXZUQrQUxjbExG?=
 =?utf-8?B?dVRxT0EwTmhpSG9sUnlERVdVYm1kT0liTFFJenk2SmNtdWNUcFBjS2FOQkw2?=
 =?utf-8?B?UU5GS2l2S3ZMNlI3YmtDb3lMc0Z3VXo0dWtyaExuSTlEUFpCcmljOFJzWVIw?=
 =?utf-8?B?Um9CMmg1OGl1VWhvWnVQVDNMbi9hRUtEL2paakVTOHhyQXJEREl5U1FJdlBv?=
 =?utf-8?B?cnRPWTNVVjZ2c0lXUUd3WS9OMTRrOGZpZFMwazJ2dks2TXNlRkI0QjJDK0sw?=
 =?utf-8?B?YVZTV3dLejZnTnZLUE5QMk9zRnN3RjlMSEdWcHkrSGkvM0UvaDFNeW4vZW9m?=
 =?utf-8?B?WWc2WFNxcWY2VCtZYThTbHJJN2lmblRsUXdTZmFpUUExclhCYVQ2UGRFMDVF?=
 =?utf-8?B?Tmw0OXc5TVlPSXZXZ0F2N3dEenA2aFE1ZmF6YnkraHk0c0dSbXR4TkwyejAw?=
 =?utf-8?B?Sm9ETTBPaUpVNmxzSTVBYm0rTmgzUVJqR0d5ZzZyV1Fyek5valpkbmZlT2lU?=
 =?utf-8?B?VVltRy93N1RyY1lySEFFbjB2RGFZRjdYWm9sTWdKckV0NnRTZWJuanJSRjdz?=
 =?utf-8?B?Vm0xckZwZUJiQ1FvbnhXekNkeG1tV3FzUHJtU2dHenlBUGxieWFsb1ZYNTQy?=
 =?utf-8?B?b0ZhTmNpS1Vid2ZTdnhOYW5mTm1SZ3d0OG01eWNMQVZ2eXoydHVCaUxVd0Jv?=
 =?utf-8?B?WGpGdy9seGNyeFRxb1owYXBOV1E5MkhDSDA3YnE5eDc0d3JmS1FyeTJqSElm?=
 =?utf-8?B?eHo4Ylp1OTJrc29XSk8rUnBDMnN1Q29CRXZva1JNNm5oOGdaWGpnb2hKSW9N?=
 =?utf-8?B?Q2ZOTWtHdldLaFRIQjd2cUtvWW5iVTJyZzlVZHB0N05tYjZacllsZE54SC9T?=
 =?utf-8?B?US9UTGlqOUU0YmVTdHFBcW85Z3NUYkQzTjZVNzgveXVHQXE3UytnMkFwdkxW?=
 =?utf-8?B?TnZTSTJpdks2R01oQVhYVDd5Wll1VEt5R1B5NlhtMEF6UlZTVzhBZFBIeEND?=
 =?utf-8?B?N2xHR3hRQm1wbDcxQzVhV095eUNhd3drSHR4eWVVSWxkN2dDRjFZdHliRDBW?=
 =?utf-8?B?V0VRVXlZSkNwa29TM1h4SGlKVlNqYXNPdWs1TSsvRUc3RGQ2WXFiQWZFZGFv?=
 =?utf-8?B?K3hxU0JlTCtRNGVEbVpZc25LMEtTRW13dzdlckJURG1xUXpJYTRPMlhhQTJJ?=
 =?utf-8?B?d3R5ekhia2xXSVY0S3NRYkNWcjlEdGtrN0V5UnBTeWZkV01hQXdJc2pBck1n?=
 =?utf-8?B?K2Y4RlhyQ1JRdEZ0ZW84a2Y0OS8wZzl5R2EvaFdTV0hBRFBmdi9rTjZhUHc0?=
 =?utf-8?B?U1YwTGw5eXlWU24zVC9HTDZYREo0T0tKSDBJZDFXUkVCUGh4bWlrcmlZK3E0?=
 =?utf-8?B?M2dlU3VMQjlobWRlTE1RMVFtMGRJVi9iVUtHNDBNbC9wR0pXN1ByUVJmYkcw?=
 =?utf-8?B?WlBEVGFFRXRxblNwaG9JN0lPck1JdXBzU2s5ODZGT1VOTHpZZjB1L05Ocndj?=
 =?utf-8?B?a0FQZHdORlo3Q2ZmTkE1U2dUR1d1cHh4d3VsNi8xN1BuYUFYdVltMHpoWkwr?=
 =?utf-8?B?Uy9QTVluQzNsTTE4Ry82WjljRE82LzdiRjNYTlZHVXJYYnQ3ZmYxMk92Ujg3?=
 =?utf-8?B?bTVJNWRNbmVYQjZSRk5NdWwxSUdCbmphOXp0TWZuRitwek9YY1dNNGxXWERL?=
 =?utf-8?B?R05jaVNUMXBzOXRKS2Y1MTRobzBrd0IxUzF0OXlvcE55TW43ZjZqbTZTbkUw?=
 =?utf-8?B?WEhGU2FxbzR0VHZ5VGYxSGpUN3B1VWk2VkdVazJhdTJoTE4ranFPTy9GNjgz?=
 =?utf-8?B?RllZWXNTS05HeWNwMTkwQTNpbUovdDVuNFBOcWZyNElHTEFSS1lVREZ2S3Jl?=
 =?utf-8?B?K3dGR2tmR0NXZ2dUMWthU3pscVZPalBGaEJSRXVmTTloK2MwbVhwaXpjcThM?=
 =?utf-8?B?WFVRSnJGK3U4WC9HOHUyTDFZcmJKS1h0WUxlYmc3Um1PSHFhUEtjbVM4elY0?=
 =?utf-8?B?ZmRrNjR4VDFwSFJRRDBrOEdLY2FHQmRCMVF1djFTYlp4VlRKWmFVRFFlTXNm?=
 =?utf-8?B?QmZHNS80dWJROS9aUU1mVEhBcld1b3JicmxUdnRhWXRBdTJ0b1RESUJ1MXky?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EhqcIsTdxE5X4YxdZ6sEvVQ84baAfdkUbZjfTz8VZ73m8H5emOL2Iv+vil0FdB8KJrflIIngYJKeQb81a+urk8IHDYl/JyK3LE5R8S3hGy+eh1HYrlU4YGg8cyT0UUC/dmpWyBJbiFVgVyxYTcNLJTOcqj0fNMF+vWEBxttFYK+Qh+azx5o+Pgw+TVcL64cm0en00pWC70dbXeQOstU6u0SAQoe7LPmqu37jt4V4BfX2o08H8tKscK5PqfBqhm86nK6gz79VEtMilDJr15+UcDXEWkziR5MwG3wc5R5oJmh/5QTwKiqOWEKvFZz1lkMB5tSewAGEIHISXM+awFzyvNrbx9pqcP6GhbHcBlqk9ZZdAAAkj9OejZgBL6CH8lA8UqIO0zi9MaZb3yI9xHsDIBAm+zQfhTVlsZxGZ5FBxj+MtCxl3ATWZq2Hs20wCkI4CuUxlUtNZdx5oCGOJAeurzqLNpnP0wcWRqMOWm9xVJBpqOXVngYBE7oT2X1DlD7hdf+Nj8EAB5sLdHtQ0lGkzNFjlV47PWT1fMbyuHJENlDDtPoyvTWFSuelo+YMCppuig8h7uygihu3snS8rjGfi9gJRi4lAAtGo7qdKgeO1cM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a102af-8b15-444c-153a-08dda28bbf35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:45:25.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjqB6tidgAjyWHWTKIx1tVR4XjOxxUS42BTgBKtlJoYQB/gV9gD1kEebDKRd8vErM+PdML/4cf9lqnmt/3J+/BPBjUusp75LgAr/3ymhpaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030094
X-Proofpoint-GUID: QVA6bgc2herhKQkIElPRojZveKOgXbZ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NCBTYWx0ZWRfXyWJukAOxwB3B ZS8Rzs7uT1LG8JcYt6gslW4AikACNxN/ZM7yLqkr47n4fsRHkPBB11CvOc+vOv30jg2CXuV1z0v cab60AtjvCWelltH/5+WoiGXdSUOF6VLN3jTKdGgWMkXxQW88gC3Sn8vyyMNh0uc+Drxn5GoE+r
 R4bg3s+zkvXHQ1ICrRoGKUXZ93TION/5Uv74l8cGUl4XNSJ6y2xVBZ85UbK/4bAcp0ul6botxQP l8A61pTAyapF+b3A6maPtHkJA857jyxwcdnDjlTM3YJQqZmv8LE1D0HbktI80VyPRoOPbkmI52+ nJNcxTKHE2heOIouJ4e8E/fYK7gumH1Bo0Y3GR4IMpM8FVSip3VuHZ4jZfAK0YkYBfKw+nBtOUo
 EHFSXvQNvQeQQoUvM7ODiKU1I2M14N7fMkiqHulZApG0xTKAtc4kvbfwNgfHnluwhZ9Ub2RN
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=683ed24a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Om7U2iLDVlhtWMTkO7EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: QVA6bgc2herhKQkIElPRojZveKOgXbZ6

On Tue, Jun 03, 2025 at 12:25:36AM +0200, Jann Horn wrote:
> On Mon, Jun 2, 2025 at 11:07 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > The process addresses documentation already contains a great deal of
> > information about mmap/VMA locking and page table traversal and
> > manipulation.
> >
> > However it waves it hands about non-VMA traversal. Add a section for this
> > and explain the caveats around this kind of traversal.
> >
> > Additionally, commit 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
> > madvise(MADV_DONTNEED)") caused zapping to also free empty PTE page
> > tables. Highlight this and reference how this impacts ptdump non-VMA
> > traversal of userland mappings.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  Documentation/mm/process_addrs.rst | 58 ++++++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> > index e6756e78b476..83166c2b47dc 100644
> > --- a/Documentation/mm/process_addrs.rst
> > +++ b/Documentation/mm/process_addrs.rst
> > @@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
> >  1. **Traversing** page tables - Simply reading page tables in order to traverse
> >     them. This only requires that the VMA is kept stable, so a lock which
> >     establishes this suffices for traversal (there are also lockless variants
> > -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> > +   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
> > +   also a special case of page table traversal for non-VMA regions which we
> > +   consider separately below.
> >  2. **Installing** page table mappings - Whether creating a new mapping or
> >     modifying an existing one in such a way as to change its identity. This
> >     requires that the VMA is kept stable via an mmap or VMA lock (explicitly not
> > @@ -335,15 +337,14 @@ ahead and perform these operations on page tables (though internally, kernel
> >  operations that perform writes also acquire internal page table locks to
> >  serialise - see the page table implementation detail section for more details).
> >
> > +.. note:: Since v6.14 and commit 6375e95f381e ("mm: pgtable: reclaim empty PTE
> > +          page in madvise (MADV_DONTNEED)"), we now also free empty PTE tables
> > +          on zap. This does not change zapping locking requirements.
> > +
> >  When **installing** page table entries, the mmap or VMA lock must be held to
> >  keep the VMA stable. We explore why this is in the page table locking details
> >  section below.
> >
> > -.. warning:: Page tables are normally only traversed in regions covered by VMAs.
> > -             If you want to traverse page tables in areas that might not be
> > -             covered by VMAs, heavier locking is required.
> > -             See :c:func:`!walk_page_range_novma` for details.
> > -
> >  **Freeing** page tables is an entirely internal memory management operation and
> >  has special requirements (see the page freeing section below for more details).
> >
> > @@ -355,6 +356,47 @@ has special requirements (see the page freeing section below for more details).
> >               from the reverse mappings, but no other VMAs can be permitted to be
> >               accessible and span the specified range.
> >
> > +Traversing non-VMA page tables
> > +------------------------------
> > +
> > +We've focused above on traversal of page tables belonging to VMAs. It is also
> > +possible to traverse page tables which are not represented by VMAs.
> > +
> > +Primarily this is used to traverse kernel page table mappings. In which case one
> > +must hold an mmap **read** lock on the :c:macro:`!init_mm` kernel instantiation
> > +of the :c:struct:`!struct mm_struct` metadata object, as performed in
> > +:c:func:`walk_page_range_novma`.
>
> My understanding is that kernel page tables are walked with no MM
> locks held all the time. See for example:
>
>  - vmalloc_to_page()
>  - vmap()
>  - KASAN's shadow_mapped()
>  - apply_to_page_range() called from kasan_populate_vmalloc() or
> arm64's set_direct_map_invalid_noflush()

I explicitly mention vmalloc :) and the others are I guess the
'exceptions'.

Perhaps the better way of phrasing this though is to say

'when using this inteface, we stabilise on the mmap read lock, however
there's no guarantees anything else in the kernel will behave like this, we
rely on these page tables not being freed. In cases where they might be -
make sure you have the right locks'.

Which is what it's _kinda_ saying kinda. But maybe not clearly enough...

>
> This is possible because kernel-internal page tables are used for
> allocations managed by kernel-internal users, and so things like the
> lifetimes of page tables can be guaranteed by higher-level logic.
> (Like "I own a vmalloc allocation in this range, so the page tables
> can't change until I call vfree().")

Right.

>
> The one way in which I think this is currently kinda yolo/broken is
> that vmap_try_huge_pud() can end up freeing page tables via
> pud_free_pmd_page(), while holding no MM locks AFAICS, so that could
> race with the ptdump debug logic such that ptdump walks into freed
> page tables?

But those mappings would be kernel mappings? How could ptdump walk into
those?

>
> I think the current rules for kernel page tables can be summarized as
> "every kernel subsystem can make up its own rules for its regions of
> virtual address space", which makes ptdump buggy because it can't
> follow the different rules of all subsystems; and we should probably
> change the rules to "every kernel subsystem can make up its own rules
> except please take the init_mm's mmap lock when you delete page
> tables".
>
> > +This is generally sufficient to preclude other page table walkers (excluding
> > +vmalloc regions and memory hot plug) as the intermediate kernel page tables are
> > +not usually freed.
> > +
> > +For cases where they might be then the caller has to acquire the appropriate
> > +additional locks.
> > +
> > +The truly unusual case is the traversal of non-VMA ranges in **userland**
> > +ranges.
> > +
> > +This has only one user - the general page table dumping logic (implemented in
> > +:c:macro:`!mm/ptdump.c`) - which seeks to expose all mappings for debug purposes
> > +even if they are highly unusual (possibly architecture-specific) and are not
> > +backed by a VMA.
> > +
> > +We must take great care in this case, as the :c:func:`!munmap` implementation
> > +detaches VMAs under an mmap write lock before tearing down page tables under a
> > +downgraded mmap read lock.
> > +
> > +This means such an operation could race with this, and thus an mmap **write**
> > +lock is required.
> > +
> > +.. warning:: A racing zap operation is problematic if it is performed without an
> > +            exclusive lock held - since v6.14 and commit 6375e95f381e PTEs may
> > +            be freed upon zap, so if this occurs the traversal might encounter
> > +            the same issue seen due to :c:func:`!munmap`'s use of a downgraded
> > +            mmap lock.
> > +
> > +            In this instance, additional appropriate locking is required.
>
> (I think we should take all the vma locks in that ptdump code and get
> rid of this weird exception instead of documenting it.)

We really need to be sure that there aren't some weird architectures doing
weird things or circumstances where this is meaningful.

I mean people went to great lengths to make this possible, I find it hard
to believe there aren't some _weird_ real world use cases.

At any rate my soon-to-be-coming patch will separate the kernel use from
this weirdo use so we can fully isolate it.
