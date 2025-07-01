Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1325B2FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357220; cv=fail; b=JFCIIsZaulq40Qx+22R2VCSt7JHuzwCgBS4zPLjbFhaV+2tVOIzhSI2IDmiForEPmFfQC7PrIXL/O2qX1XXWRDTHtsks5nwZ8JuJmBfHImEcvwnFaK6plO33li4/tu4xFIh2PO4IlorvRm8llQbIeTx7v5PRoq8fW07L9UoCHmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357220; c=relaxed/simple;
	bh=1vKBHQiO2HHQrNMNmbIwrv0wCJuJzNOlc6rhj0OPBn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D5XKJUpJez/ATYevwoBWyNVHNqcaw/TN17p1TAxFimd/5iDICNYASaKpYv9/rfFQvjcOJ2YVGntIVX365mtQzg5GK+OLXi8yU7H6tSBcshB3E1b1nl31y4gB3xcC9gRKChY+egWFbxu+Fr6MiXd+fQak4gpdlmY1ydTJAsL1nuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kRqWA+Lj; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FcLEDSQM reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kRqWA+Lj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FcLEDSQM"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611Ml9e005244;
	Tue, 1 Jul 2025 08:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jQwofCClPQ+1838Fhp+8OWX6WIAH3++h70guj4f6aS0=; b=
	kRqWA+Lj2OWaTODB0XOn4sKthOZ6DH+oYm365hLYtwleY5k8GmcAiXdspo9Fqs5Z
	wcaQmMui98EnW6xEu9QE6z0GAY46Cq2FAITSQXIb6jPwxqyIvfAtBSr52dtMp34o
	qqb8UYzz8X/IqXeIsewhVMgRtAOKQKv69X9p/rL5TpC6QehHpdslgo9wi1QStgcR
	EH2ZudoPuaXCkYThbLLDZRobk4AuNgms5g17o44CRnZf0bpTPApCAnJ0cc7Wp9Tj
	b55v48ZJoY/8Ta4BxZsojOfVykSYzUhy/uf/9VDgdMKzf3iFNLAsQfLn7jZH80ql
	qfXnqwBtRtJR3zaoDsxwNQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af45m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:06:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5617EZ94009289;
	Tue, 1 Jul 2025 08:06:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9eu2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkQ160/VYC+19I1APNueiyZaTZMP5gImTkGbjo4ct4uwTJy8v18cGorj2GQ6DCNIhBK0WyPWOpOjzY+N7odimfoLsypD1N25O081qItfl2vgihRqYwtyudKzOOVT1iJOvk/ecDaF4lJ+91HRr8O+oIf/N0rVvUebEZQJLY+sMei6r94UQjNoC47tSODy/gBiwNqL7M2Sms9ikj8Rmrdompdbq6BRM3XNi/rBh236eU2m2mq8pkk0h09Sq6K9iAhMrAp1PkNCbfYlfDy23ZVFW2dj7ZfkiP38ZGA9ueYjnHLfni0pA7rsA/wXI7SU8mTmZx7hS84eLO00r/mDDac4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx7my/312ceqF9XzaQaWY5Q/S9TyDNOmS6cLGP1dJFY=;
 b=Cnzb908Jy4tx3BlgR7Cg+bHFsEdscQNqo7TTCLP4N/53L7PR6aYbltOwJIIQXi8IWZ/iuLJuBbjeV91r5AyQfvdzN/nt/yU4V0it65F6R2r38rYIzwf1e2JacPrtKqKpQNHZQsIzPV9Duoi1E3eqDF8tZD7KB0xipE6Evl9puAX8l+T1DEcCDXHYka4/wpczJhyv13PkOzUGQyyY7vWO+uz83RxFyIFCrsCoNRYD59xHj66YcQVxVD77uTWH8nDdwE1QThEyOndBRBAVhWGyavUKNB0GSTF/+fIXPphwCzH8TjlpHz2T9fjEL4cttldQbaVFOTqJmvCum61hG2iydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx7my/312ceqF9XzaQaWY5Q/S9TyDNOmS6cLGP1dJFY=;
 b=FcLEDSQM2ye6+zjkbixH1CdajHbCIhlyBpO8xrA7qjP2dMPXRH6KJwc/nOJ+6fjY9d72IeaVjdWQJp5HLmOBJ8557iFBclGfie91O4cNbld06eltPiPP6xv6mOEjLRchzWhuHOt3RerXnnL+pwAGqp/iuqSWI/jVXOLZv1OabSM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6564.namprd10.prod.outlook.com (2603:10b6:930:58::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 08:06:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:06:22 +0000
Date: Tue, 1 Jul 2025 09:06:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <b214edda-4162-47fd-a9e0-c2a4cee3ac88@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
 <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
 <23a213b8-280a-4544-a210-7c18a0caf8a9@arm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23a213b8-280a-4544-a210-7c18a0caf8a9@arm.com>
X-ClientProxiedBy: LO2P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be52ad0-b7d1-4bf1-3fa8-08ddb8762adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Wb5XR0yQH6CHQo/oHWUJna62RTQB1w59E22YFPoOWsKpRAxj6Xvw+U7JNa?=
 =?iso-8859-1?Q?ahxqMTKRqenogMyhWLDWEmM+40Kn8C+RwyBHpnY1LlGZqy9bPGry2/Ejtj?=
 =?iso-8859-1?Q?ByXNjr21w55hJQ/o0wu5x1vC4vuExZBwh8tBJdOyv+eMJ7tElKKCFQ70Aw?=
 =?iso-8859-1?Q?jJs6/6Q29K7P8Ic3g1WyT0QtnmdArUD2iL5k1dCM+8dg29tNkFrxtGQ3gp?=
 =?iso-8859-1?Q?OFG3XhFweG0PwHn7WZaX+PJPadgewqBl4C3qB/tv014jZrHhNb476L50zN?=
 =?iso-8859-1?Q?6o9BdMLapbEayBqEdqKnBkSj6lRSkGqFpCpN83GeFUwEFVG+bC71TxbZp7?=
 =?iso-8859-1?Q?DcRatedA4hNY7YXc/QjKPdRmHZi2b3G1i01QoZkytCBpNP2coYRMp1Tqtn?=
 =?iso-8859-1?Q?Uu5JozYG1s9lxHJ2ca0ytWj2nqBL14aMs9yYRtJKikJDr8Hrw1FEBVRDja?=
 =?iso-8859-1?Q?yWFcm14SaBVHaWUS5t9D2h271QSpY+m48Oha7MtSnWvJqtTjLU5SGgEC9i?=
 =?iso-8859-1?Q?44CvFRrAmDMO2dDDeynCP8Fb7RLd5ubDLqCV3vAMf2h1FGbHhXAvPhT/PE?=
 =?iso-8859-1?Q?cf66cmclHegIeE3C0sQBTP0Riy9gRMqk+vFWm29z8j7eF9cggRFCE+Tgfw?=
 =?iso-8859-1?Q?kyorME3PFXG3zP46F6QnuK4UgXbfodXV8ZTfUdNiyO3r0OSFBMED0QYABa?=
 =?iso-8859-1?Q?rGxn0RISQSfmSk3y6dSJVR1S4/ubVt4EXw/jSgAlSfUD6sifSpE4xtL5g9?=
 =?iso-8859-1?Q?ZxjLAvahPanix+uJrJCl6oNDLmQ+jiMI4DQ2p8l9fW+KMMtVmBIiYAqi/l?=
 =?iso-8859-1?Q?xk4NTQQ2BwLiUzmP3EGJWgq80ms9DD1uM/pXuRN7nTDJ6zXP+9FljOEuHx?=
 =?iso-8859-1?Q?fNcOAQoDRE/4NaLaNLDQSpllqTmvGGETkbvNwiQA6MU6sHYCh6TpiLXedf?=
 =?iso-8859-1?Q?Bx6M8j1EeAzT9nSJAr4pYIwINeNurwU8hGhTFd9TZ6rVTpskW2KVLcMcuU?=
 =?iso-8859-1?Q?5HR6695+ofZhRtK89DPE7/Ei5LuGroWXG9LpFwb5KxRMDWSiNNbdK55NAX?=
 =?iso-8859-1?Q?4AHzkz91qoxRV501FiaGLdpEitrbl/F96ZNDq5AqQIc63tiRyQRnlebCaC?=
 =?iso-8859-1?Q?R2Y3r+u1ca3nId7xePZf610eKGLd4QGKJQn18CQNKOL24q42t/WffGvNOH?=
 =?iso-8859-1?Q?OD/sXt0kNjUhOHZKbGCBC1OPDc4vrk+ytx+rSVQp41jx/9cuksUEHXezby?=
 =?iso-8859-1?Q?dSa33OmJowkkryM6AzV1Zehn1bJE1xYC7BC6n927Dw7IlM8eXVFe4qUll+?=
 =?iso-8859-1?Q?ZAPmWaj0bszXmm3+isYmRglhysR0rSAAz5gn/M1wi6lu6FuZqszFnWlRz+?=
 =?iso-8859-1?Q?1YTJvLkb9J1HbLezDw8MxZW+3S0BRwGBnnLLPY1vZeDZwO+U6cDh6mzKkl?=
 =?iso-8859-1?Q?fDdOUIH1yF7IO1mgP6kd9Piz9RMBpbt8V+m3FQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pIQutCUDg4XdLvtbJhCaUV/0rvWqKy2fc3J2fnIvCx1rvwhUu29OuX7tOH?=
 =?iso-8859-1?Q?/R2EFOfVWsgT0r1u1ww8JujXblkSYFaOZYWAdtND3ZP7r47kaVMqz6e9S4?=
 =?iso-8859-1?Q?LtPEhsdsNm/P0s/oxXYyejBitxeIsSM/YdOQq05xulJzg/3YcH22Fkmz0i?=
 =?iso-8859-1?Q?yjcHXCwkXYsiIeDRTp8a76+xzaFPup1ybZfW6nyPj06m77OdTklxPouGFe?=
 =?iso-8859-1?Q?Q13mSWVnwa75tYV3h0v4qkwiDoIuEpKW5VokNodfOyqyQBtMgkpHbjYkrs?=
 =?iso-8859-1?Q?6TJiltauo9PGQ790Oj2c3UcVfpkViHVq4c/HkQMYGlul4u1LCbxcsOWwgU?=
 =?iso-8859-1?Q?O0y9VEnyM0mbCQ1aWnBUYpAlIqLIAHNYvp/s/eBbiKmM6yeNceVRuscbEM?=
 =?iso-8859-1?Q?2KF15TFLXPltBeiwl2XrNzzZGO8r+zvsoIcYKBaF6DezUfB2aWF433/9ZH?=
 =?iso-8859-1?Q?tyWvQaNOKsV4zWctrbvgFUcdU1r1m+QLSPIMkjGxkih71ADhuVnoQuaECP?=
 =?iso-8859-1?Q?sh0CAH1WX1DnufKCPrlfUxDf7tBmoo0qZV7YfGuN8ndPwb1OlN+6tDVZwM?=
 =?iso-8859-1?Q?Uew8MnDiNWi5yzUHM9cTsC3J9u5am83A8Pe3GGnT0ks1itBw9RWKUFY11N?=
 =?iso-8859-1?Q?UHNwsBBelbPPpRCtuLXKr9b9j24khctWHvtt/1dAirUIvyQcHivpm65niB?=
 =?iso-8859-1?Q?owFGxJd0IdpYTkkUUWw2AFFB4FfSO9Mvi/eWz+hfrDrZDeEl8kkxPm2XlX?=
 =?iso-8859-1?Q?9AIVOMuVHctxfUl7ZTIdMeidjeU9++pNGYtV4q8lwu1rdz9G46v1kc2Kpz?=
 =?iso-8859-1?Q?xh5Ix8yuBr6mSlmv8cPjJ0lwqM+T/nu67eM/x/uiIiZcdpqvLTicidBkvB?=
 =?iso-8859-1?Q?HETuo+TkxfovwJi0LWmEieCYOD5K6aS5LIXgAfejDHvC8aTfS6oDdLIkuD?=
 =?iso-8859-1?Q?CL9qrOZ1nks06VXn3kORfz6PoE9084PsNuMG9wzcjv8L/J7yg16joEYdyg?=
 =?iso-8859-1?Q?vGPrbRQyERmGZ0/OA7MrdvB+9rOyBs0bIsc52y0Oi2gYiyujGyiqo+VDlt?=
 =?iso-8859-1?Q?aErVjZffvfoi/F7BrNTxcfzC5Uw1RtJpr/DpYaoyRdveYN5yj6tvTaXE2b?=
 =?iso-8859-1?Q?kqDKDloF3o6KIVlyZ5KXO2ZFGXdecquY0w3qr1T5IbphK4tBg5EackweqH?=
 =?iso-8859-1?Q?YPC2DR1MNUWQ03e03z8PHF53OcWwrYQd1S6r+zteoSSkIc8uLK4FRx9RRs?=
 =?iso-8859-1?Q?cF4oMU5fV1kzAB3ej1vv4/7eapMCXm+FV8/iN8VK5uh7mu8+fMlXPCQS0t?=
 =?iso-8859-1?Q?vKg8Yw1vJXbmetKigw+6asAptc62Vkc6DLSIou3vj/iLdFRvVKDtD/i5LE?=
 =?iso-8859-1?Q?hkltxC9HR0Ga0uHYoI0SpBOMUXtN09HTydkPaniZNCKtzs9Da7riHHhleV?=
 =?iso-8859-1?Q?W8eq3O2tGGSiAaMSEOIr4ywEEDQPRG/Tl7Cwz0iDcKtSjberkE2XC3Ygss?=
 =?iso-8859-1?Q?77nGVdZ4srI9UUHoFgPbfQsvUqWKHMMDJF5EQYyZTbiVcekElE9W50Nb6g?=
 =?iso-8859-1?Q?jW6+JAhorX2rccCmlr11tsbu3mUUmPWbgcWeK6fZSP6SEC5G2au48KPCD4?=
 =?iso-8859-1?Q?eg5v0yyTneGo0lcvwuoigI+uXEXS7mlQoA7AwZLDmIC6HBkruzcWRGtg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gDOhrNBqCDPTxyDOdu6JyFyvK1GPdgB1GiPSeSNWTLtwDw3O2NVk9dDUp3baTkQR4YAD+5iwX8nRAd19ONe2caM8jqpVxTtTc1v2bQJjXk4Mxbfu/iMzrhEChHkGuvZaH/d9a8ODfIlu1clFMxmS+Yn4P75NbcAvcrTL0UbBJvcoq+Kxqy/SpZOrb1DmD6TdgofXBKNaube+JoB4C5RnktqElOx4GtF/GJguGKbAKWFE4lwS5i032OFyuBollFHq613H48FF5woG1VvHwuA/7jdswUw7OP7hwts1jmW/hjr3pJ/5P66dlHGmUVfH99awY5JTqV5Wy8C28CqFUJDODtGYY+RzRCWYo3A4W2hz9OIG1+xtzNFFWPGm+V7r8eDjI71f4Kk9c+7jz6YYYa5UZXBDmvcqYrgUaRYLQsr+PWHhn1rKZb0HBkJJbt5OYDbB4bPfiJg6Yq3zsZvjS/tqPtPie09aO5c70LF2cJNPolahJ/HyHFf2zVicMpa34f4Axv7GgGJFP1CDw1RhCupxErRsBuxDNp8utO/pEfmcIZDWuPMXmBe56XBQBWvGRakMv/wkUq8WOrrYXcRVHlHlfgdGUxmhZIwszL+FLTBSugI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be52ad0-b7d1-4bf1-3fa8-08ddb8762adc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:06:22.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNG/9gRR41NFxro9dJUleqdYpSwzcl+vjT/aVkOwk1ROukM3bIB0k0e+wQ9YKe9YXkmbCsMNnM0m/cCs16ahAjDW85RahxbEzFa/VxoxyUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010045
X-Proofpoint-ORIG-GUID: JKLti7uLWeXvfa7RVqp-IJtGuGAt89Oy
X-Proofpoint-GUID: JKLti7uLWeXvfa7RVqp-IJtGuGAt89Oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0NiBTYWx0ZWRfXwI/yvb451d/Q pcSWMlTrS4XnrZylmCMWb+Ds0vcLDX5WSp/JVXKEQ9rEL5UfxsQjXhgBcTCK3GZTYjBCWcMqF8g 668UZrSwSEJJW1hi1ZHKKttm9wnmPooIy88FVrjCNGCq44a5i4drR0lI6u+KwS0ihFrZ+TMqmHz
 RwsdF0rq1xqzkdhWr9rC40dtmTuLirny42OGiqSELwMZn5q8egQuO47CIdspBYBfHeLUreCUktl QjJmhqHVpFuGEAHcJgPm2BboSZvmQ9uu9kz2IoMDEFnZZ2ljHf/fTdpBM2ChRnOgF0DWoLsh5Aj beYWrFubnsjXfwvhtehHW4cDUY6g89+YUx3LgfZ4lQvkDQSfFPcATICRVnyZsb6TIDwUTBL+/wE
 UCd5g8LEuVm5/aaWUM2m6iRkmgT58iNectXZRaQu6ULPDR+XhdVIgFeyA+cKyvnr/XoJSN4R
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68639703 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=Ij6Fl2QF9-xze8hG-W0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14723

On Tue, Jul 01, 2025 at 08:33:32AM +0100, Ryan Roberts wrote:
> On 01/07/2025 05:44, Dev Jain wrote:
> >
> > On 30/06/25 6:27 pm, Lorenzo Stoakes wrote:
> >> On Sat, Jun 28, 2025 at 05:04:33PM +0530, Dev Jain wrote:
> >>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> >>> Architecture can override these helpers; in case not, they are implemented
> >>> as a simple loop over the corresponding single pte helpers.
> >>>
> >>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >> Looks generally sensible! Some comments below.
> >>
> >>> ---
> >>>   include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
> >>>   mm/mprotect.c           |  4 +-
> >>>   2 files changed, 84 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>> index cf1515c163e2..662f39e7475a 100644
> >>> --- a/include/linux/pgtable.h
> >>> +++ b/include/linux/pgtable.h
> >>> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct
> >>> vm_area_struct *vma,
> >>>
> >>>   /*
> >>>    * Commit an update to a pte, leaving any hardware-controlled bits in
> >>> - * the PTE unmodified.
> >>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
> >>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
> >>>    */
> >>>   static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
> >>>                          unsigned long addr,
> >>> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct
> >>> vm_area_struct *vma,
> >>>       __ptep_modify_prot_commit(vma, addr, ptep, pte);
> >>>   }
> >>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >>> +
> >>> +/**
> >>> + * modify_prot_start_ptes - Start a pte protection read-modify-write
> >>> transaction
> >>> + * over a batch of ptes, which protects against asynchronous hardware
> >>> + * modifications to the ptes. The intention is not to prevent the hardware from
> >>> + * making pte updates, but to prevent any updates it may make from being lost.
> >>> + * Please see the comment above ptep_modify_prot_start() for full description.
> >>> + *
> >>> + * @vma: The virtual memory area the pages are mapped into.
> >>> + * @addr: Address the first page is mapped at.
> >>> + * @ptep: Page table pointer for the first entry.
> >>> + * @nr: Number of entries.
> >>> + *
> >>> + * May be overridden by the architecture; otherwise, implemented as a simple
> >>> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
> >>> + * in the batch.
> >>> + *
> >>> + * Note that PTE bits in the PTE batch besides the PFN can differ.
> >>> + *
> >>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> >>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> >>> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
> >>> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
> >>> + * mprotect_folio_pte_batch()).
> >>> + */
> >>> +#ifndef modify_prot_start_ptes
> >>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> >>> +        unsigned long addr, pte_t *ptep, unsigned int nr)
> >>> +{
> >>> +    pte_t pte, tmp_pte;
> >>> +
> >>> +    pte = ptep_modify_prot_start(vma, addr, ptep);
> >>> +    while (--nr) {
> >>> +        ptep++;
> >>> +        addr += PAGE_SIZE;
> >>> +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> >>> +        if (pte_dirty(tmp_pte))
> >>> +            pte = pte_mkdirty(pte);
> >>> +        if (pte_young(tmp_pte))
> >>> +            pte = pte_mkyoung(pte);
> >>> +    }
> >>> +    return pte;
> >>> +}
> >>> +#endif
> >>> +
> >>> +/**
> >>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
> >>> + * hardware-controlled bits in the PTE unmodified.
> >>> + *
> >>> + * @vma: The virtual memory area the pages are mapped into.
> >>> + * @addr: Address the first page is mapped at.
> >>> + * @ptep: Page table pointer for the first entry.
> >>> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
> >>> + * @pte: New page table entry to be set.
> >>> + * @nr: Number of entries.
> >>> + *
> >>> + * May be overridden by the architecture; otherwise, implemented as a simple
> >>> + * loop over ptep_modify_prot_commit().
> >>> + *
> >>> + * Context: The caller holds the page table lock. The PTEs are all in the same
> >>> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
> >>> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
> >>> + * a/d bits on which were off in old_pte.
> >>> + */
> >>> +#ifndef modify_prot_commit_ptes
> >>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
> >>> unsigned long addr,
> >>> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> >>> +{
> >>> +    int i;
> >>> +
> >>> +    for (i = 0; i < nr; ++i) {
> >>> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >>> +        ptep++;
> >> Weird place to put this increment, maybe just stick it in the for loop.
> >>
> >>> +        addr += PAGE_SIZE;
> >> Same comment here.
> >
> > Sure.
> >
> >>
> >>> +        old_pte = pte_next_pfn(old_pte);
> >> Could be:
> >>
> >>         old_pte = pte;
> >>
> >> No?
> >
> > We will need to update old_pte also since that
> > is used by powerpc in radix__ptep_modify_prot_commit().
>
> I think perhaps Lorenzo has the model in his head where old_pte is the previous
> pte in the batch. That's not the case. old_pte is the value of the pte in the
> current position of the batch before any changes were made. pte is the new value
> for the pte. So we need to expliticly advance the PFN in both old_pte and pte
> each iteration round the loop.

Yeah, you're right, apologies, I'd misinterpreted.

I really, really, really hate how all this is implemented. This is obviously an
mprotect() and legacy thing but it's almost designed for confusion. Not the
fault of this series, and todo++ on improving mprotect as a whole (been on my
list for a while...)

So we're ultimately updating ptep (this thing that we update, of course, is
buried in the middle of the function invocation) in:

	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);

We are setting *ptep++ = pte essentially (roughly speaking) right?

And the arch needs to know about any bits that have changed I guess hence
providing old_pte as well right?

OK so yeah, I get it now, we're not actually advancing through ptes here, we're
just advancing the PFN and applying the same 'template'.

How about something like:

static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
	       pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
{
	int i;

	for (i = 0; i < nr; i++, ptep++, addr += PAGE_SIZE) {
		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);

		/* Advance PFN only, set same flags. */
		old_pte = pte_next_pfn(old_pte);
		pte = pte_next_pfn(pte);
	}
}

Neatens it up a bit and makes it clear that we're effectively propagating the
flags here.

>
> >
> >>
> >>> +        pte = pte_next_pfn(pte);
> >>> +    }
> >>> +}
> >>> +#endif
> >>> +
> >>>   #endif /* CONFIG_MMU */
> >>>
> >>>   /*
> >>> diff --git a/mm/mprotect.c b/mm/mprotect.c
> >>> index af10a7fbe6b8..627b0d67cc4a 100644
> >>> --- a/mm/mprotect.c
> >>> +++ b/mm/mprotect.c
> >>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>>                       continue;
> >>>               }
> >>>
> >>> -            oldpte = ptep_modify_prot_start(vma, addr, pte);
> >>> +            oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
> >>>               ptent = pte_modify(oldpte, newprot);
> >>>
> >>>               if (uffd_wp)
> >>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
> >>>                   can_change_pte_writable(vma, addr, ptent))
> >>>                   ptent = pte_mkwrite(ptent, vma);
> >>>
> >>> -            ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
> >>> +            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> >>>               if (pte_needs_flush(oldpte, ptent))
> >>>                   tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
> >>>               pages++;
> >>> --
> >>> 2.30.2
> >>>
>
