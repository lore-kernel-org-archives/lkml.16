Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59021C9FF;
	Fri, 11 Apr 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744346924; cv=fail; b=QNUtlsPxDF0iZLsfQJKNrq7J4NylE79O5B73hesK9u+4Lg3Oir1ZmFavx3JV8p68BZISz7ti+MgMbTFRAor6FFbGNhmGe2LXsht++v1Cc7/XJG2f6zo1hSfgCzgXlQAan4B0eGVKjISO3sh7tUb7rhG2dDHzeP2iiagHVfTlDGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744346924; c=relaxed/simple;
	bh=V6P9b6UZnFAMfMlCBkE3GZG0RcCwdb2vRk3lCuCNASw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VeayjP5ZmP3deOfmXkd73UrSqrhJ8mfjRPCvA9BZ1Y6Xu+FuGIGrEhoN2kLWPT6vAoKFBKTHea4fOf/VhXcv37I6qWhQIG4RQJU+yCoqmV8DGCVOrUbtVPA39tptQA66iRC+Fod/0zpIIcMZggdgOb/FZ/6pn9So2W20Herop2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wo3Byp4l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ARfQ0/Lh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wo3Byp4l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ARfQ0/Lh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B3i1Q6001220;
	Fri, 11 Apr 2025 04:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=eydyUD/IQ9lEHKlYJ0Q3DzS3mOpr1nOLItEgCyGYOL0=; b=
	Wo3Byp4lnrwOC0Ni/uA4jzmw5wJvnzlvEhWvr1vKicnSneUK3lhBGbe/L09OA8q9
	FoIhutPrfgTXIsVZfCR2H+rLj+9yohJSDXGdR6aSLJM+KrvDVggq9dJ4m/iWiA/2
	wTr6TszG9PYctDKBUeSl2uZl8dbe0D7Kg9HkSYWrQEvt2I1X0q5NPAR1KqoRfs4L
	KT8Yklv/5sVmXjrA0/quGANrCjeDByU1vo45ssIG/Clev/bCQAepB2TM9nigymaO
	THDcd1N0c7IRsRjs+hwG1wWx2rmU+kLINeG8dWP7BNrEShbC7qEAKM0xFA7FAuU9
	JRkTQh3pjrmJc9eMddoZUQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xuddg1yp-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 04:48:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4Nqh4013671;
	Fri, 11 Apr 2025 04:41:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttykhf5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 04:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/0zZ5Vb5T1vgnTCywKtPDcOeEKHKD3ka3c+YOVFeZHc5z8/qPzUYkgUIZAYh7hBm9nGTHdZo3zgjrUF8dKbjDCz04RnXEGbutpiUZurtXvuXFsa2IsMsx2MBjpV8mw12ExLJD5X3dQsTuDhLleB6T75EVIAmSYYpeCj0PYan+k4ogZtCne6RMIZIUlQSbZruJ7l0r7YJdyQjvd75kxcX5S2Dmxd/tjM2x86VRVdqVmrZGKXYxZkImA0KL6MSv9bBLlbaaEAaN8bv1LbstL4UzmvKu6okfsDLTpirdcFbehFMZBUXIXLNFi2TlSkjqqNBzgEuE3fv2wpALQ12nS1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eydyUD/IQ9lEHKlYJ0Q3DzS3mOpr1nOLItEgCyGYOL0=;
 b=JE7JBFJCuwgIYcBcOtCqkoAUAOr63kBrewgxPobKFt9AqBGtHf5eBlG1tkSL/TdnJ7wfNthIMwaixmi6ORsfLw0zBXAmAuhm+b2xniSqtF1LYx5ZMl24MOZLDpIBzkjRT8ei+zRaCz6Myp5T8Gkwp4fKzfyXH3BNqywCDs3xJwP3V9UVi9mB0UrXl8O64AsYq8d+MDllVJ0f8Vom6Cn21VWjvfL2cbMI4/0ELB/s4b/m47uqRkmJyGwHw9YmBwPZBy4dOvgwIgnP6P2rNOGOTkdByl1WKilrY74RrTbFNxfJaQl3XJnhCz65PnW3NxlzHjcXNZcbZp4S/R/VGSINtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eydyUD/IQ9lEHKlYJ0Q3DzS3mOpr1nOLItEgCyGYOL0=;
 b=ARfQ0/LhH5CB3OWqZ2H3NETB9QoOlufrm2xZ+SCXH6k02M0yzC/vOqCwMnmTwtBsKMtYHdtlIowv0qd+43/YM0PlGH0JnpGNjJL1f9PXD/eHGpUBzWaQBNHRtKhI1r1caCyEgxIPHKsM7wED1XgSNUmMilUBgTA2aEh8c1z3Oz0=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS7PR10MB4863.namprd10.prod.outlook.com (2603:10b6:5:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Fri, 11 Apr
 2025 04:41:53 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 04:41:53 +0000
Message-ID: <c4351bf8-d172-4194-8074-6515f514931e@oracle.com>
Date: Fri, 11 Apr 2025 10:11:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4] platform/x86: ideapad-laptop: added support for some
 new buttons
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
        ikepanhc@gmail.com
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250410212937.28772-1-gasper.nemgar@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250410212937.28772-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS7PR10MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e27d999-2797-4112-894d-08dd78b32e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnREWUxBeTg4dUQ1TDl4VlB6Y3B5QmNJUVk3bjNoZi9MODJRN2d2S1J6Q0M3?=
 =?utf-8?B?dEk5QTB0S0pybW1MQSs1Q1hCY2VienQrby9kRTg0L2REd1lIUXBRWkVPc2t4?=
 =?utf-8?B?QnErRFRsWjY1KzQxTXdIMngrWFk2UlRHd3I5cWx3c0RiWnVKcFRSakIwTkZ5?=
 =?utf-8?B?elE2Qm1OZVNNNlpwdXB6THNxS0FXK3pzOTRmS1dGMkRmcElUWXUzNklORlo3?=
 =?utf-8?B?V3VqNngvODhkYVlvRTVWWWtDOG15akV0SStML2MrckZPNE5uTW9tUjVHUkcr?=
 =?utf-8?B?K210ckp2WXpkSWxPOU1WdDFycTRFMFJGZjZxY0l6YlJldXVpSWFkM3hIMFU1?=
 =?utf-8?B?cFdWSk03NUVPdU5ZbDBsNER4c292b2tUbEcvY3k1UUlBbmVXY2tEbWgxaUg4?=
 =?utf-8?B?WWo0aGNYZCtjWkx5QkhKbytBaE5mc0o0RzFYQjBjRXZyb01ZOG1sUUpMS3gv?=
 =?utf-8?B?VE53NjBwNzRMZU1LV3NjbTRpL1J1SnptYS84OC8rd0MwWDE3UDFlZ25pMmpR?=
 =?utf-8?B?dTZDbXlUZzlJSXFRVVI3aFNkalVkbDVxU2oyK2hFVzRWdm8zSjR2TlA4UGJ6?=
 =?utf-8?B?eGNBWmRlRUNhY3U1V3MwdTJRVWt0WU5Cako3U2pabjlOeFJPOHFQOWxCb1M0?=
 =?utf-8?B?U1lhdU92bFdLRnNiS1B5VXBTWUhKRzFHbDl0clpDR1BWMFZvOTNPZGpCVks2?=
 =?utf-8?B?Z2FBMFNTVmFuRkREcFRBWWdDYXpSWmd0MnZTSUwrRTArY004Zk5yNnJENDVL?=
 =?utf-8?B?bDFTb2dJNm04RDFrK3ZDc2FZVXN5a1FQWlBKczMwV2c5UGJoSzlIbTR3ZUFR?=
 =?utf-8?B?d05xc00vMDE5dFB6NDQyZGpsc25zd2NkV2FoUGpDaExHMC9obGtQYlYrNStz?=
 =?utf-8?B?Z0VwYUExa0ZFRHB5WExtL1RlL2EyR3Y3Rm9uUDlNeVJPZk5sLzhKUWxvTlpB?=
 =?utf-8?B?ZXVWRzM4SUsxTVJaeStEWWZLdHNud2VpdFoyQTBJVmpOcmxyRjNONFI3aDRl?=
 =?utf-8?B?S3dqcW1FUXgwZ05JdkU2QiszV3FMZHpGTWExOEhCdzJNenJ5RTVwTTBIeWpB?=
 =?utf-8?B?UnRmSVd4bnI5YlFpL09SN1ZhYmo5RUZJTVV5R01seGhFZ3Z3eVhSYlpmclE4?=
 =?utf-8?B?Y1A0dUR6Wk1SL3ZOMEZSUFc5UTd2d1JuN3FNT0Zyam12Y2RtVFhMMWlVVGhZ?=
 =?utf-8?B?a0J1YnBmTUNpTGZRc3d5Wmw2VThjS0xsSWZnbTNQVVBCR0s5Rk9uL1NxcHdC?=
 =?utf-8?B?UUU0TTQyc3RCMktvUVlaVGdFRTBXUWhvZ05yc1QwN29vUURiTmJEUVpmWUEv?=
 =?utf-8?B?bXdmZGVuSjE5VXgrNlpMZzBxbUhuRzJ6d24zTUtEV2g3cFlWTVI4a1VhUzdK?=
 =?utf-8?B?eG1lbUVvS1IyMVFObHIzQlA4QjZpRlBSRW1wSWxxT1c5aGUrZ3dvUk5Gbmdw?=
 =?utf-8?B?NHI0MjNyK3NRaHQwTG5nOWtwR2ZuMkpKa2M2alFvbGttT1IxVllSblhyUCt2?=
 =?utf-8?B?am9aRVNNYmoreUpKeEVtOVBHWFZkK0dPRm0yZjlHYzNhU3pHV2dMdnQ4ODZW?=
 =?utf-8?B?cVlraVNmaVlpKzJjcUpSOGVFV3d1OHJ3eHFDVGpERmtoWWZmYTYwcnR3cll0?=
 =?utf-8?B?UG1IYXA5RXBnbWhkSEJoYjdtTGVIc0xSR3pwSFIvemJ0d05Ub01pN3YzV3hp?=
 =?utf-8?B?dU1UaTB1Rzc4cDR2OVBwRXBPNWhSaTh0Z1BBSEJQZ0E1WWJ0ZG5vVXMrNk1F?=
 =?utf-8?B?aS81cE1UVXViemoyQzZJeTVQMnNBeFhtSFpWeTh6TWMzY09LVTVQblpJSVhr?=
 =?utf-8?B?Sm5yK0xtVWhlNXpQT2p1VEtkMUhHdGtUakE4MHFwa1l2a0ljWFZrOVg3Y2Iw?=
 =?utf-8?B?a3UvYkJJcnJ6WFUzUVNzU1NhQnpaZGQ1S2hEY3ZybGtMTGsrcWVDYkdKSElF?=
 =?utf-8?Q?MmFdIlyF104=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0pXL2xTSTYvT01FMnJ6cDhPMXpOcjFNYVZ3TnRyaWxzZkcxY3RKYkVOdXNo?=
 =?utf-8?B?N0tmZ1lYWTBpWmV0SjdZUzF3NThWV01Cc1l0a3BhS1RQd2Zjam1jQTd5YzFz?=
 =?utf-8?B?dzdGcThFdDVkZjVweHlaM2E0K1lmVUVuMExkUWp1V0lvTis5YjJjRy9sQVRa?=
 =?utf-8?B?bytEbEhqMjBjcnJVWEk4ejJQQzRrZUxnVEQ5RUpMS1J3L0k3MEVSdnVFMk5V?=
 =?utf-8?B?R0x3TnVYMjZpQUxxSnMyZlZqUHNadEVMbmhSNzdCbXFIQ1M4Yk1RaEQwdlpH?=
 =?utf-8?B?M2ZmQXJ1ME5acFR2TTYxNU9qYUZ4d29yM056ck4xbC9tV0Jac3NSNXlBYXVG?=
 =?utf-8?B?SjgrN1lOd0ZkN0xreHVwY200MFFpbE9KSmVtdnY2SEczenlHZEowUUFuRGt3?=
 =?utf-8?B?YjQxbXN1bVlPODZJTWtCcWdVOEN2alZuV1RzdklGVmVqZjlScmwwOVhEdU90?=
 =?utf-8?B?Y05ySk1OaFNwbHE5YmFyMHNyNnpWbUoxUTJidDErbmt5STc3R2JuMlZMWkNC?=
 =?utf-8?B?TjY5bXR6Nlh4dEV0UmQ3RFBSM1RNQktuNGVzU0RBdHZsUkY5MUpqOW15S1JT?=
 =?utf-8?B?U0VzMWJOTnpWTFlHYmhaYTcrNHJ5WHRKVGRhMEZSTDIyNlNpVVI3MlcvTHQw?=
 =?utf-8?B?QVgyMy9EK20wTTBqYXJzcnZWSUFRMkowaFpjbHl0VGZIWWZEbDNQaU9zRTJa?=
 =?utf-8?B?eS9IUGtzMVlCSTV2RWV1Ui9LclVUNjk4bmh4QWNzNG84dlE2Zys3V2Q0eDY2?=
 =?utf-8?B?R1RyV3BTVXNJV3JzVTVqZjEyUkYwTUJXWGFhT3Y5OXMwQTlYTitpeGJhWC9H?=
 =?utf-8?B?TTBqY2tENUkvUjlRMGVsb1ZHNVJzd0NOZUJpMTN5eEFMWHdacXFLNmZ0Yjho?=
 =?utf-8?B?UEZEM2hUSjgzQXlmdE1FdS9sY2NyKzk1dU5lVTRicjJDQ3I5MVAybnMxQVo1?=
 =?utf-8?B?L2U2M1BHUU03aTBDcjl6cGJxTXJoYWZEcGVtV3d0RStSWFVuRVpkbFdGWDk0?=
 =?utf-8?B?MVlUcFhZOGk5MXZYcjlsTTZDeFMxall2SnArSVlVM0ZNSi95L3YxNHl3N2o2?=
 =?utf-8?B?NlJYTWF0eEF2MlNTQVVrOFk5TGhGWVp2VjBkVnNQZHNDVmNrbDZDQ1VDaG5L?=
 =?utf-8?B?U2pTT1dRaVYzaitSNys5bDBnUFNYN0tFejlXQVNCQ3JDYTd3dG0wSkhwZGs5?=
 =?utf-8?B?L2ZtZmdPNWM2MjB5SW5qWHA0QXJkd0o0d1AzZlZtZXpjaUpqZmdiNGU3eUwx?=
 =?utf-8?B?ZGI3djg5ZEhTSGYyWTBadkd6dEJWWEtGV3hEYWc5cTBNVEFvTGRpaWJvZmhT?=
 =?utf-8?B?Z25ENHhxNEJxeERVNXQveXQ1SzNqNENVVXBLMkZ2eUV2NVdxYTVrM2JFbjN6?=
 =?utf-8?B?RFNpQ0pydCtOckpWNGlpNVhNanZYdWtnK2Q1VzdCY01VNDZMZk9ObVpheTgw?=
 =?utf-8?B?WmFFM1NHWGF0dzBLczRZdjE4MlhmTEdjaEgwN0d1R0dteWlEaktydmJzeVRz?=
 =?utf-8?B?SFpTYlAyOWlneGFlMlJEMUE3VnZMMjdJd1FOckR1RzdVYVFJUHloeHE4QjEw?=
 =?utf-8?B?NlhDRXhVcjlnRFRiY09wWElvTzFWQUNrRzNGcU50SXN1MWdtbDVVSWV0ZGZj?=
 =?utf-8?B?YlVLM0JkS2pRZzdBSy9uSmdmalFHZTlJdzFRaUNWQzAzRjBMYlB0MEV0Vm42?=
 =?utf-8?B?b3ZMTlJ1Zll5VGpxOWM3TlNDYS8yM1p5bnNFZ1NuMXdKb0IyckdlOUQxTWVI?=
 =?utf-8?B?NlA1NUd2VnZ0d2xEa1JPbzZpbERGOVFhVk5VZEFvRDdkZ24ycUNZa2FnZUFy?=
 =?utf-8?B?dnk1dTh6OGxZdGRTZitGM21zVmhHdlRkV1c4aS8zSDE5Q2RrY05lVndFd1ZB?=
 =?utf-8?B?NmFKVFZQS0NNUG5LdjFxYWFBWXM1eVg1QlJ4Wk1YdlJZNHB5K21HS3hrMTBs?=
 =?utf-8?B?bXZpRVlhMXFrenR0bnNWMVVxMURvL1dZUzZIR0xUVnZpK2pyTDZVMWZlVGpE?=
 =?utf-8?B?U0wyMnVDeDRSbmFsUjM4V3dlZ0tUK1ZXc0M4eVZtMDB1YWI1Mkg1cmYwZ0Q0?=
 =?utf-8?B?S0p5L3V1ZnpNU01PMmE1M1NFOGp3MlYyRDZ6UDZlOGxoQlRKUTVleGdNb1FM?=
 =?utf-8?B?Wno0ZE1BZDFJU3hnSTZldStBWWQ3TlpQR2FuY1ByVGtTTGJCdG9tOXVGZng2?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dqOq6WFowmkEbt6yoprhpROKpnHe6M8bn7KdrmawIHziTT8kno0OXnYwXE2y3AR2J14lRU2TJCD/jGBcraRBNIo2xl5WNO8kFn4/RlTpFzessFXyY6ct7aLzy+24xD4dwH4iSFfIdULgwnrihc5sfdpH/EwDRb1mDlT835s3olR5aDsO2npSw7Ks+jMfsxmd41P3n50Jgxs1A5j9/YIdKs6lYQOZW0LHmJITY5Pn9GXjbRpN24QOfC+EB/MHDGEYc/NHBUozhEcs86hnqLch8Wzfpt6TYmD7tlUEBVyHPqL87lYSZAsOch2WVipOkILs2dChY6DQk5rInpDWINJuMffNDN8daHs8fsyhr357my3VaWmkyAw3jSHIyfPUgGcQOgavgYFMtNgW90CwwwQcHUiQACemLhblQBeYsybZHSsMEdqLia+i/D1SdIpa3Apk3NjOeOCM4mYZlTBfbh1nWcS0D4z3ga9lBmfGoc8wtt3wlfmOv1qT00OccoEQ1RFoy3jIODE4B0k7huwPcO2Oa/aPSlOCJ1Z3y0BMCafMTw0gjTUXdZeZAlx1hBu0NlQJCh2TIm7rxKJAloAVSnyVMs9zrFiL2dqPtyoidJvjqEE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e27d999-2797-4112-894d-08dd78b32e6e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 04:41:53.4098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpVhrez9EuaxMWofjf9b7wExPXIOyHDXhBQ5xHOk6XRgsv7Tpf2lThNNwE39EqIPWDG1KVE3YQLgJ4L/QLHGlXpl5nO0YlgfphPsfdz+QRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4863
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504110032
X-Proofpoint-GUID: dp8On7e1vjRLV9FniEd5SYustOPbZ8t0
X-Proofpoint-ORIG-GUID: dp8On7e1vjRLV9FniEd5SYustOPbZ8t0



On 11-04-2025 02:59, Gašper Nemgar wrote:
> Added entries to unsuported wmi codes in ideapad_keymap[]

typo unsuported -> unsupported

> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
> Changes in v4:
>   - Changed performace button to KE_IGNORE
> Changes in v3:
>   - Minor changes
> Changes in v2:
>   - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
>   - Added performence toggle in wmi_notify()
> Changes in v1:
>   - Added codes for buttons on laptop(performance, star, ...)
> ---
>   drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 17a09b778..72d3306ef 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
>   	/* Specific to some newer models */
>   	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>   	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Asignable Key) */

typo Asignable -> Assignable

> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Eye */
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
> +	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> +	/* shift + prtsc */
> +	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>   
>   	{ KE_END },
>   };
> @@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>   		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>   			data->integer.value);
>   
> +		/* performance button triggered by 0x3d  */

extra space after 0x3d

> +		if (data->integer.value == 0x3d) {
> +			if (priv->dytc) {
> +				platform_profile_cycle();
> +				break;
> +			}
> +		}
> +
>   		/* 0x02 FnLock, 0x03 Esc */
>   		if (data->integer.value == 0x02 || data->integer.value == 0x03)
>   			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);


Thanks,
Alok
