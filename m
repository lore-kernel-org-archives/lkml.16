Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B66EB79
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312646; cv=fail; b=GeW7ReRjLuM6I2vV3CEsfXrUiKe4BfPgwZg6yY/WXFpRQUZYpHeELErQXj4LMGCD9Vm8jC4NP7O6U90KhVZ4aMoKb+CU/EvHaUthiR1fPFK9TdiwVWWYI/EHquCmlbnz8ZprhprVFoBiPGVVN74KiGMOJvI4ew7kZt49aAfExzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312646; c=relaxed/simple;
	bh=+AcIR77dW+cWxb1l4YWyRJQLNg6/NFuybdWRxo9w3Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LFbl5ALc9O8hr41W0UeLrh2mkJuhESsE5NZJedIn7CLDd0X9cHL+Wl0TOq6TT3iHpe3pAbOtKYNwmcenPbQPSMhfIm+DKjZQiubF4N9t+xP86lz3PEABOli7nLM62Lo/CuOcokHa+trcNjCqfhNKMO8hwnAXAAr9dZ/v6L8Rzqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M8hvlnz8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cxUymTLW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M8hvlnz8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cxUymTLW"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AJC4xl017240;
	Thu, 10 Apr 2025 19:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=v/PRcRROPQX+7NA0I+
	iGewEdenTSe03p3d7CeC9AnwQ=; b=M8hvlnz8pCuSguFV6KGiVxlufXncHotQWr
	DmoQdgjbONuN7cPpr+gKqrdubK2yCeJuMzwjNIh/JxLRmXfNlPlbURQxjQjHllyr
	o+eg1dc3P/kUhuO1P4FZsSWgVpK9UNyF5+dg6NN6wilsr35IG8wUGuyX4VrGiVYc
	c6S12udAg/guLGRhfQps9wvYuN3Yge5m0THU5Q4hBpAYDn6gxrD6yjf2HbasdC7K
	3Vvry3lga6HMTTIb8HpheZNXusbCTQxjzYvLUJnhWz6EcTS+w7cXhj5EbhMF19wR
	/gx1n2TAK6a4u92tOWm/bfJ8eF2TNkvCzX1WbutvKDKj7hua6+Pw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xkxc00a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:17:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53AJAd8l001589;
	Thu, 10 Apr 2025 19:17:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttycp5xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1F8cQLW0nAqpI1GC7cdBUt5NKLckJ7PEo1zc1lVSO0s3agT4A/xkK0m3uSoMHXJOusqnmGOlxA0Bjbh2ChA+euYtEmEERd1pAAlFb5ZIJHksoT/4tTc2BScJNSKJ56/lt6y3K2RdIpqqbOogHo9q49VMYKaRlabJVQ+1CmoH2y56RgmHmLD6b1G9uoVVD8aHnkzAY6if8uHmTLvHd5ufm4dVMeYVWoP3VU//YTFuG+yIBud8ddrzyDP3pM0ZwiTbbxGwDIWcjADAmJw1rla4u0nZxli2GbmNXk2hJhe8JpPqfDtrz24t7Wk8ewUkUIZ/g5wioecPZcyPdFtfp9scw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/PRcRROPQX+7NA0I+iGewEdenTSe03p3d7CeC9AnwQ=;
 b=aP96kzRDa0XFRGDRFaIMin7mvR1OXBGKKmTn43Ids1uw1swh8maggDI8WMPIJz9NR9SYd+lGC/+xLdECfhmWTLHDo6IQ9wcKQGBqE7s4ywPnFwzrNktmdgKfOvO6KjLT68dfp6/SxFT42o8rYU3p1YfToK08R6sph+jN9Ulbf/T0ouBTCsOiMHJvVGVtimVTM7xSnG3zbuoGTpf+uuHHiaTJBOgUfIAEZH63YG7U5m5K/dCF1xDVuwub7ZGj69PznLmrBBis9SkYPzp7YAa4Iae5MU3FcQhPa9LlamQ5T3l0jwXuuC2Ui01G/kuNjlZM7Y6/NT67y3dN+EX7kuEurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/PRcRROPQX+7NA0I+iGewEdenTSe03p3d7CeC9AnwQ=;
 b=cxUymTLWwduXqLQ4d/07dHSvKAWOg7JR6SKBIR4EF8X8X6Qs8ohYmDe7qJF73i4hyck75KpU4oq0VgQ47BAYfo4C9L0ysgFF7oQG8r+lbUyA6MEJ0tg3B3DMwD/n40Ktn52uMkxLVoF+cT/2Yjh83ScP8hHGAGR6cYRPWvlrurE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH0PR10MB5707.namprd10.prod.outlook.com (2603:10b6:510:149::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.49; Thu, 10 Apr
 2025 19:17:07 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 19:17:07 +0000
Date: Thu, 10 Apr 2025 15:17:03 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
Subject: Re: [PATCH v5 2/6] maple_tree: use height and depth consistently
Message-ID: <o4w5u6ui5vukbpt2tkvsgvqohshyxqwx7o7ccf5emfmzvf3zub@4sk3uex5tv7h>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
References: <20250410191446.2474640-1-sidhartha.kumar@oracle.com>
 <20250410191446.2474640-3-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410191446.2474640-3-sidhartha.kumar@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0206.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::25) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH0PR10MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f1ed83-ece4-40b3-f3ca-08dd78644896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UFcsHaPMR+eNZ3Lkby+HI/Jbdgonqd05luuNWMg1w40waww9g11sOGXkD4XV?=
 =?us-ascii?Q?O3e8dqtzPrLN3LfdKKlyw4H0XZPCdFmiG/nRPkkXzS23hNQSc28BmqXoaEV0?=
 =?us-ascii?Q?El5At56+kAQcE+qfksqcE167xypNYmokSIWVtq99JyLujRZeqVLAp1i7tSvZ?=
 =?us-ascii?Q?tdzN/I6c5LozTj1lIapEQJlCn/nOitM1ah/yZ2mP6wmHi4RCLmauuzPJq6+H?=
 =?us-ascii?Q?OcPBsE18X6utOAGuFoMuJm9lCI0L6X3nnaEBAqebeb9Abds5T/cyHOAbdkX6?=
 =?us-ascii?Q?HhVBGZw1Sc1h1iqfksM4SnQKnYUrE7jliw2eCplLrlaCFuyjs9VZCpIQRU+a?=
 =?us-ascii?Q?2DspblP4k1RRANzpC2wxW9TQ36mZ3qxO1nrhNgA0PmKDQIh0/pONirSAc9OM?=
 =?us-ascii?Q?FNju4ksVbAu55aT8HQXHxiXteDRD6uggFe6AHqBe8ERwWJ0f01yzKsjdRifn?=
 =?us-ascii?Q?wVbN0HTQ6CVMzTIqNZJNigtiriGUWblg2ZoFoD066g5WfATOPUKqr1hNaFlm?=
 =?us-ascii?Q?cOPAzpu3Zw0EFeRD778uR/fU9vrq09SmIrOhnR1pc+kQ0zW7f/oEXgnSS1YP?=
 =?us-ascii?Q?iCZYA+2KXr5rihnmkpS6W3TULtSJVggVlvnueRkPpI3SeR/RHOHgFdfUbtsu?=
 =?us-ascii?Q?YTBs4y0ShmxtPh9ISn6Asmaif2tkgD7nn2xqGnFjPx6Oseei8RwJpX4bXKRw?=
 =?us-ascii?Q?6C+/iaTRcXSOqAaBDi3oTM19k/PRAGpW6TZ1tiJKXpWvpokFxRBWNyG59la6?=
 =?us-ascii?Q?VnMSEiqiGxHdr9QUjflVRZxnbfN+B2bp6QUzkACNI7zdoo7WFXef7Pqw2PzJ?=
 =?us-ascii?Q?rg2GCR5GJNSNaNmtexdCEnr8/+GCfkMt2CA9mQwzxFszzXS5Vdl1GmIsKm+5?=
 =?us-ascii?Q?Btzyv9Jpn9hwOjGT1O7HEw8EJfZ8tsAt3/OMdtgfGrWvElbqaUTtd45rDhnI?=
 =?us-ascii?Q?qgTCAXe3BEMxy06CUbfqYElmdNu72bShfuu8PW/8p6P3ZWd0jTyg/nXdw1Gv?=
 =?us-ascii?Q?bESBGAP01wKFgihJq1YPHE8gsAMARO6euv5FuwuzlkSNl8lW4fIr3Z+Jh7M4?=
 =?us-ascii?Q?xEIC8S0JrM4qb1paGWPSIVFwcVtmyE9UxFj2HxoFvL9CXLMASJkJoG9H8965?=
 =?us-ascii?Q?TrfOROITJB4i13TJ0WV0WpMyZwmUPsa/U1SlmfdXkAcRtnHhkuZzf7YQOPcx?=
 =?us-ascii?Q?d3NRJOgKzzezrIHPfsruDoBlcGX9t7zViXhvxQPe7UiruolYJ/JFN+iHFbqh?=
 =?us-ascii?Q?2GFJyB+COrsjl2GGHJuBVLfOK/vcbIoCsqA7/Mj7pK/5bUhQP5DdY3uAGREK?=
 =?us-ascii?Q?u9Im05anr9c+KnXF6RBw+knjTfb6JY9AJZoFJm7VOlu2ssf1EAd/rXcH6DAK?=
 =?us-ascii?Q?Qw/wySFk/7estZbYlUF/T7tZfHOemtoJjUTaIBUTRtJ5YSTjtw2HRD+frVrr?=
 =?us-ascii?Q?FM0Ee6bjTpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z4hwDbIR46y/DZ+t0mImfmG7i9J7wxT6vG8jm23guNnA44qGXQl74UiLDvUr?=
 =?us-ascii?Q?E6RUqxzSfBOTwETfvCcZk8FS/kakqtuePNCNqsOMHn9TcuaIrqsRgQpZ2ZgS?=
 =?us-ascii?Q?OoZO5aJJxGPAEs/ACp3opeJLcdxw7NhPDce+GsbZ7RLdFMu2tDA3jBw+Io5W?=
 =?us-ascii?Q?jylF2RRNs8xD23FbLfxEB8fWtefHETu2GJbY1dRKIiXvcfaEZweoy1sdDOYf?=
 =?us-ascii?Q?f9wY4S1OjrgoPg342CycCZm/HDbWLktdLYxM1PJ9O90k5cw43hTq/PJF8KIb?=
 =?us-ascii?Q?JoexU9u4EWQYav8vHeJBTYkcTKji8pzjVVDvp7OoLzNuzjeyGaIy3iBFf/Lb?=
 =?us-ascii?Q?fJVz3Z/FfZS1gdIjKI38pci19OJGHot+2JBaKeVpTIyT2VvmApipa2PWPOsU?=
 =?us-ascii?Q?EPcxZURPMtmGgdg6e0G1G/Ss0X5iAeXloHtsXTE4+3+/3RW4oSFuHtOQ33ZA?=
 =?us-ascii?Q?kMN42fK5FsK3pGc6Pnh75Hc25PKt1KTK+nUPnISRWD5nqbr3zYzh9m9hdeSJ?=
 =?us-ascii?Q?Hp3DcGPzxVu+zKpmQTB2XVlelEqSyd//MYPWuGq3IfjlnL+qT13ffzXZ1K8G?=
 =?us-ascii?Q?X29ic0DtOwzQYJlmzLfGj0sizBw77vQPJJ9aqQP/N2+NlrIxTRAOAG0LmiSk?=
 =?us-ascii?Q?xKmA/Vm/jPT+2TOH/JeEt62TgjtN+r8bhWnzmdSnvg53ch3A4h8fiIMPNRAK?=
 =?us-ascii?Q?dnGDpl3cMmnAJwya8zW00sbVHBPTOjob9MJuXRhxrYRN2P7XQTQE/CSdMX45?=
 =?us-ascii?Q?7ynMtsZQQMkcRBqD/dzxqRVkmb5BCVDmP8rCpDe4TOvhhT90neL2T8tnvXXY?=
 =?us-ascii?Q?3AsqrW3Cmizsh4ISzxJb3B7PuwRP5RW5SGt1VshBnrwu0oqLKpcWM/Yg2LX2?=
 =?us-ascii?Q?37E7wpQ6UBNGR9i1CNT+SRwUHx53Kup8Ltl9JwBj7s6pcVvOcjCTpSulrPLr?=
 =?us-ascii?Q?lllc2ygS0lxxHqZSOoMg2iKzGQGRMQEAvIdBz154hxuCVrCUzikMkhvlSaAf?=
 =?us-ascii?Q?tJBKHbwMtvZevqvXFC+aN+n2JjUEVpsw0vBEMXdZiVwbP6b77GgJ9+U3iOpA?=
 =?us-ascii?Q?dRQMMs3rrogA7fsZXHFjXOTsS6K8z0UXyF+32XnfJhKfUHn0u1XtZkZEGnTV?=
 =?us-ascii?Q?TSEUXKdT90zpCAKN3dOJBveXUfDoaz1BKTJo2S0MAnKTtrsPXOj6cRIw0dki?=
 =?us-ascii?Q?7XJhE2Q1SnZrivucSIo/bGAE7p6d/xJcTWnGvw3Vu23TbgwSGqbSwwCKXaMZ?=
 =?us-ascii?Q?TWL14TZ/wEeSIfeOd81urVhxMQ23S6tmpnIRajfeCbMMDDkO4nNKENN0fbzU?=
 =?us-ascii?Q?v9OHcHjKNFf2w23BeMlp7YEyhLTRxrjmMxRimumXLxBILrbEd1L5yBoH/w6V?=
 =?us-ascii?Q?iItkj2+xFH7YEkReahAgkPa1Jh+0XbBxthez8onrI6Cj34n2qqfPQCF1IxJf?=
 =?us-ascii?Q?r4nt4m2JMRtkNRmmHwmebKkPegdAyCJOduvlJoiJYEJNdFBZjw3GUbU0DXyV?=
 =?us-ascii?Q?UovYqEhVg0pvLdpoaCYsnBbHvSbzB+tUOh4T3H1/mUbZCGNOFUTFb9iJtYoI?=
 =?us-ascii?Q?Dfqf39wsDXlSccP/Ix//nj0nrrIsgE2GEVdYr9w8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yg9nh4eAX8CwlufIqq0k8MW7Ys9tl8mEsgqwpj92yv96ytSIEcdNsA9U9jrt7qcmhQonkMHBi73ijFWf8oX21ipbaC1quUjE3yz/tIutuJbLTGhAAIPdjx6owna0bV0/XBSckExCoL1FvakNC+qnR7w9rJpLfmH2xPgLfnd6RcKDrLWICf51+miGU6THOPHRxLqXg3Qq+nobgV+6Qih5qmdzwZXRQXJO+ZDGio5M1DkTdj1guSI/gzEsXw8cAC//pOsy7L+niZtq8rkr5vXtiMhWydPRBicltEuGwJ7E566wr9jqdxQzrimGe3xKPC1+5NMLbA2xCRh3qcgJvgK96xeea7fqwJh7CjQz56Mo0vYTRtCA086X4lH/6+Pxqf+lORIg0Z61+SvIBFK/u4q6sRURcKERYBDDVCU1/3qQVMRi8InmqVjBBO+zrcFo6b98EnKc69h7HMerpgdSkJZG+ZorhJell/3+dYM4a+PBbdr+HQ740MLVIA0lv8RjpISOE4/WtAY0DqWJDqP5BZWJl6ei1ELVMOxLeGM2s+ADvArVlcYVqJGY6cPzp3beGsCfLko69qIpppfgfVQGbr3StJr+29tmzaoGRCg+SHXAhQA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f1ed83-ece4-40b3-f3ca-08dd78644896
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 19:17:06.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okl7STWOUOeA+E612SKKRCfX1OIGKhHxF7H9o7J5hlQ9Mpmj1SiApNFmh+mRnnv02Fsgt65M3vsZWxI7igENCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5707
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504100139
X-Proofpoint-ORIG-GUID: 27_jj1yyG0FiEzX-DTkFZ4PKKMP6kNDl
X-Proofpoint-GUID: 27_jj1yyG0FiEzX-DTkFZ4PKKMP6kNDl

* Sidhartha Kumar <sidhartha.kumar@oracle.com> [250410 15:14]:
> For the maple tree, the root node is defined to have a depth of 0 with a
> height of 1. Each level down from the node, these values are incremented
> by 1. Various code paths define a root with depth 1 which is inconsisent
> with the definition. Modify the code to be consistent with this
> definition.
> 
> In mas_spanning_rebalance(), l_mas.depth was being used to track the
> height based on the number of iterations done in the main loop. This
> information was then used in mas_put_in_tree() to set the height. Rather
> than overload the l_mas.depth field to track height, simply keep track of
> height in the local variable new_height and directly pass this to
> mas_wmb_replace() which will be passed into mas_put_in_tree(). This
> allows up to remove writes to l_mas.depth.
> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>


> ---
>  lib/maple_tree.c                 | 84 +++++++++++++++++---------------
>  tools/testing/radix-tree/maple.c | 19 ++++++++
>  2 files changed, 63 insertions(+), 40 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index f25ee210d495..195b19505b39 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -211,14 +211,14 @@ static void ma_free_rcu(struct maple_node *node)
>  	call_rcu(&node->rcu, mt_free_rcu);
>  }
>  
> -static void mas_set_height(struct ma_state *mas)
> +static void mt_set_height(struct maple_tree *mt, unsigned char height)
>  {
> -	unsigned int new_flags = mas->tree->ma_flags;
> +	unsigned int new_flags = mt->ma_flags;
>  
>  	new_flags &= ~MT_FLAGS_HEIGHT_MASK;
> -	MAS_BUG_ON(mas, mas->depth > MAPLE_HEIGHT_MAX);
> -	new_flags |= mas->depth << MT_FLAGS_HEIGHT_OFFSET;
> -	mas->tree->ma_flags = new_flags;
> +	MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
> +	new_flags |= height << MT_FLAGS_HEIGHT_OFFSET;
> +	mt->ma_flags = new_flags;
>  }
>  
>  static unsigned int mas_mt_height(struct ma_state *mas)
> @@ -1371,7 +1371,7 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
>  		root = mas_root(mas);
>  		/* Tree with nodes */
>  		if (likely(xa_is_node(root))) {
> -			mas->depth = 1;
> +			mas->depth = 0;
>  			mas->status = ma_active;
>  			mas->node = mte_safe_root(root);
>  			mas->offset = 0;
> @@ -1712,9 +1712,10 @@ static inline void mas_adopt_children(struct ma_state *mas,
>   * node as dead.
>   * @mas: the maple state with the new node
>   * @old_enode: The old maple encoded node to replace.
> + * @new_height: if we are inserting a root node, update the height of the tree
>   */
>  static inline void mas_put_in_tree(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, char new_height)
>  	__must_hold(mas->tree->ma_lock)
>  {
>  	unsigned char offset;
> @@ -1723,7 +1724,7 @@ static inline void mas_put_in_tree(struct ma_state *mas,
>  	if (mte_is_root(mas->node)) {
>  		mas_mn(mas)->parent = ma_parent_ptr(mas_tree_parent(mas));
>  		rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
> -		mas_set_height(mas);
> +		mt_set_height(mas->tree, new_height);
>  	} else {
>  
>  		offset = mte_parent_slot(mas->node);
> @@ -1741,12 +1742,13 @@ static inline void mas_put_in_tree(struct ma_state *mas,
>   * the parent encoding to locate the maple node in the tree.
>   * @mas: the ma_state with @mas->node pointing to the new node.
>   * @old_enode: The old maple encoded node.
> + * @new_height: The new height of the tree as a result of the operation
>   */
>  static inline void mas_replace_node(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>  	__must_hold(mas->tree->ma_lock)
>  {
> -	mas_put_in_tree(mas, old_enode);
> +	mas_put_in_tree(mas, old_enode, new_height);
>  	mas_free(mas, old_enode);
>  }
>  
> @@ -2536,10 +2538,11 @@ static inline void mas_topiary_node(struct ma_state *mas,
>   *
>   * @mas: The maple state pointing at the new data
>   * @old_enode: The maple encoded node being replaced
> + * @new_height: The new height of the tree as a result of the operation
>   *
>   */
>  static inline void mas_topiary_replace(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>  {
>  	struct ma_state tmp[3], tmp_next[3];
>  	MA_TOPIARY(subtrees, mas->tree);
> @@ -2547,7 +2550,7 @@ static inline void mas_topiary_replace(struct ma_state *mas,
>  	int i, n;
>  
>  	/* Place data in tree & then mark node as old */
> -	mas_put_in_tree(mas, old_enode);
> +	mas_put_in_tree(mas, old_enode, new_height);
>  
>  	/* Update the parent pointers in the tree */
>  	tmp[0] = *mas;
> @@ -2631,14 +2634,15 @@ static inline void mas_topiary_replace(struct ma_state *mas,
>   * mas_wmb_replace() - Write memory barrier and replace
>   * @mas: The maple state
>   * @old_enode: The old maple encoded node that is being replaced.
> + * @new_height: The new height of the tree as a result of the operation
>   *
>   * Updates gap as necessary.
>   */
>  static inline void mas_wmb_replace(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>  {
>  	/* Insert the new data in the tree */
> -	mas_topiary_replace(mas, old_enode);
> +	mas_topiary_replace(mas, old_enode, new_height);
>  
>  	if (mte_is_leaf(mas->node))
>  		return;
> @@ -2824,6 +2828,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  {
>  	unsigned char split, mid_split;
>  	unsigned char slot = 0;
> +	unsigned char new_height = 0; /* used if node is a new root */
>  	struct maple_enode *left = NULL, *middle = NULL, *right = NULL;
>  	struct maple_enode *old_enode;
>  
> @@ -2845,8 +2850,6 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  	    unlikely(mast->bn->b_end <= mt_min_slots[mast->bn->type]))
>  		mast_spanning_rebalance(mast);
>  
> -	l_mas.depth = 0;
> -
>  	/*
>  	 * Each level of the tree is examined and balanced, pushing data to the left or
>  	 * right, or rebalancing against left or right nodes is employed to avoid
> @@ -2866,6 +2869,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  		mast_set_split_parents(mast, left, middle, right, split,
>  				       mid_split);
>  		mast_cp_to_nodes(mast, left, middle, right, split, mid_split);
> +		new_height++;
>  
>  		/*
>  		 * Copy data from next level in the tree to mast->bn from next
> @@ -2873,7 +2877,6 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  		 */
>  		memset(mast->bn, 0, sizeof(struct maple_big_node));
>  		mast->bn->type = mte_node_type(left);
> -		l_mas.depth++;
>  
>  		/* Root already stored in l->node. */
>  		if (mas_is_root_limits(mast->l))
> @@ -2909,8 +2912,9 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  
>  	l_mas.node = mt_mk_node(ma_mnode_ptr(mas_pop_node(mas)),
>  				mte_node_type(mast->orig_l->node));
> -	l_mas.depth++;
> +
>  	mab_mas_cp(mast->bn, 0, mt_slots[mast->bn->type] - 1, &l_mas, true);
> +	new_height++;
>  	mas_set_parent(mas, left, l_mas.node, slot);
>  	if (middle)
>  		mas_set_parent(mas, middle, l_mas.node, ++slot);
> @@ -2933,7 +2937,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>  	mas->min = l_mas.min;
>  	mas->max = l_mas.max;
>  	mas->offset = l_mas.offset;
> -	mas_wmb_replace(mas, old_enode);
> +	mas_wmb_replace(mas, old_enode, new_height);
>  	mtree_range_walk(mas);
>  	return;
>  }
> @@ -3009,6 +3013,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>  	void __rcu **l_slots, **slots;
>  	unsigned long *l_pivs, *pivs, gap;
>  	bool in_rcu = mt_in_rcu(mas->tree);
> +	unsigned char new_height = mas_mt_height(mas);
>  
>  	MA_STATE(l_mas, mas->tree, mas->index, mas->last);
>  
> @@ -3103,7 +3108,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>  	mas_ascend(mas);
>  
>  	if (in_rcu) {
> -		mas_replace_node(mas, old_eparent);
> +		mas_replace_node(mas, old_eparent, new_height);
>  		mas_adopt_children(mas, mas->node);
>  	}
>  
> @@ -3114,10 +3119,9 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>   * mas_split_final_node() - Split the final node in a subtree operation.
>   * @mast: the maple subtree state
>   * @mas: The maple state
> - * @height: The height of the tree in case it's a new root.
>   */
>  static inline void mas_split_final_node(struct maple_subtree_state *mast,
> -					struct ma_state *mas, int height)
> +					struct ma_state *mas)
>  {
>  	struct maple_enode *ancestor;
>  
> @@ -3126,7 +3130,6 @@ static inline void mas_split_final_node(struct maple_subtree_state *mast,
>  			mast->bn->type = maple_arange_64;
>  		else
>  			mast->bn->type = maple_range_64;
> -		mas->depth = height;
>  	}
>  	/*
>  	 * Only a single node is used here, could be root.
> @@ -3214,7 +3217,6 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
>   * mas_push_data() - Instead of splitting a node, it is beneficial to push the
>   * data to the right or left node if there is room.
>   * @mas: The maple state
> - * @height: The current height of the maple state
>   * @mast: The maple subtree state
>   * @left: Push left or not.
>   *
> @@ -3222,8 +3224,8 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
>   *
>   * Return: True if pushed, false otherwise.
>   */
> -static inline bool mas_push_data(struct ma_state *mas, int height,
> -				 struct maple_subtree_state *mast, bool left)
> +static inline bool mas_push_data(struct ma_state *mas,
> +				struct maple_subtree_state *mast, bool left)
>  {
>  	unsigned char slot_total = mast->bn->b_end;
>  	unsigned char end, space, split;
> @@ -3280,7 +3282,7 @@ static inline bool mas_push_data(struct ma_state *mas, int height,
>  
>  	mast_split_data(mast, mas, split);
>  	mast_fill_bnode(mast, mas, 2);
> -	mas_split_final_node(mast, mas, height + 1);
> +	mas_split_final_node(mast, mas);
>  	return true;
>  }
>  
> @@ -3293,6 +3295,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  {
>  	struct maple_subtree_state mast;
>  	int height = 0;
> +	unsigned int orig_height = mas_mt_height(mas);
>  	unsigned char mid_split, split = 0;
>  	struct maple_enode *old;
>  
> @@ -3319,7 +3322,6 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  	MA_STATE(prev_r_mas, mas->tree, mas->index, mas->last);
>  
>  	trace_ma_op(__func__, mas);
> -	mas->depth = mas_mt_height(mas);
>  
>  	mast.l = &l_mas;
>  	mast.r = &r_mas;
> @@ -3327,9 +3329,9 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  	mast.orig_r = &prev_r_mas;
>  	mast.bn = b_node;
>  
> -	while (height++ <= mas->depth) {
> +	while (height++ <= orig_height) {
>  		if (mt_slots[b_node->type] > b_node->b_end) {
> -			mas_split_final_node(&mast, mas, height);
> +			mas_split_final_node(&mast, mas);
>  			break;
>  		}
>  
> @@ -3344,11 +3346,15 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  		 * is a significant savings.
>  		 */
>  		/* Try to push left. */
> -		if (mas_push_data(mas, height, &mast, true))
> +		if (mas_push_data(mas, &mast, true)) {
> +			height++;
>  			break;
> +		}
>  		/* Try to push right. */
> -		if (mas_push_data(mas, height, &mast, false))
> +		if (mas_push_data(mas, &mast, false)) {
> +			height++;
>  			break;
> +		}
>  
>  		split = mab_calc_split(mas, b_node, &mid_split);
>  		mast_split_data(&mast, mas, split);
> @@ -3365,7 +3371,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>  	/* Set the original node as dead */
>  	old = mas->node;
>  	mas->node = l_mas.node;
> -	mas_wmb_replace(mas, old);
> +	mas_wmb_replace(mas, old, height);
>  	mtree_range_walk(mas);
>  	return;
>  }
> @@ -3424,8 +3430,7 @@ static inline void mas_root_expand(struct ma_state *mas, void *entry)
>  	if (mas->last != ULONG_MAX)
>  		pivots[++slot] = ULONG_MAX;
>  
> -	mas->depth = 1;
> -	mas_set_height(mas);
> +	mt_set_height(mas->tree, 1);
>  	ma_set_meta(node, maple_leaf_64, 0, slot);
>  	/* swap the new root into the tree */
>  	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
> @@ -3669,8 +3674,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
>  	WARN_ON_ONCE(mas->index || mas->last != ULONG_MAX);
>  
>  	if (!entry) {
> -		mas->depth = 0;
> -		mas_set_height(mas);
> +		mt_set_height(mas->tree, 0);
>  		rcu_assign_pointer(mas->tree->ma_root, entry);
>  		mas->status = ma_start;
>  		goto done;
> @@ -3684,8 +3688,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
>  	mas->status = ma_active;
>  	rcu_assign_pointer(slots[0], entry);
>  	pivots[0] = mas->last;
> -	mas->depth = 1;
> -	mas_set_height(mas);
> +	mt_set_height(mas->tree, 1);
>  	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
>  
>  done:
> @@ -3804,6 +3807,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
>  	struct maple_node reuse, *newnode;
>  	unsigned char copy_size, node_pivots = mt_pivots[wr_mas->type];
>  	bool in_rcu = mt_in_rcu(mas->tree);
> +	unsigned char height = mas_mt_height(mas);
>  
>  	if (mas->last == wr_mas->end_piv)
>  		offset_end++; /* don't copy this offset */
> @@ -3860,7 +3864,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
>  		struct maple_enode *old_enode = mas->node;
>  
>  		mas->node = mt_mk_node(newnode, wr_mas->type);
> -		mas_replace_node(mas, old_enode);
> +		mas_replace_node(mas, old_enode, height);
>  	} else {
>  		memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
>  	}
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index bc30050227fd..e0f8fabe8821 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -36248,6 +36248,21 @@ static noinline void __init check_mtree_dup(struct maple_tree *mt)
>  
>  extern void test_kmem_cache_bulk(void);
>  
> +static inline void check_spanning_store_height(struct maple_tree *mt)
> +{
> +	int index = 0;
> +	MA_STATE(mas, mt, 0, 0);
> +	mas_lock(&mas);
> +	while (mt_height(mt) != 3) {
> +		mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
> +		mas_set(&mas, ++index);
> +	}
> +	mas_set_range(&mas, 90, 140);
> +	mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
> +	MT_BUG_ON(mt, mas_mt_height(&mas) != 2);
> +	mas_unlock(&mas);
> +}
> +
>  /* callback function used for check_nomem_writer_race() */
>  static void writer2(void *maple_tree)
>  {
> @@ -36414,6 +36429,10 @@ void farmer_tests(void)
>  	check_spanning_write(&tree);
>  	mtree_destroy(&tree);
>  
> +	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
> +	check_spanning_store_height(&tree);
> +	mtree_destroy(&tree);
> +
>  	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
>  	check_null_expand(&tree);
>  	mtree_destroy(&tree);
> -- 
> 2.43.0
> 
