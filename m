Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F03202984
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988529; cv=fail; b=g6UpVPNImaD4Al0PpeGLllmUtWC5hY/6kXF5I85fww/WpgKNsYbpLT21/rhoAjjKSFgjzeKQHuaDQKSHpc2cXY4boVWjP2xj/PRP6o3CXebroR3epu8QoXuEYVr21++LPwvgGNGSb7uEIxGStpdgKTFW/ZEgbwxcH2KftiYVN4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988529; c=relaxed/simple;
	bh=mE2l4aPNRvELE/Mmnkj22xyOIIoiYa+88U7H/yXlju0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EmeHMpY+r12REqGMHJrONzJD9LyxYxcZWFmegy/6yvglZ8oeG+tWsc+HzxTDMVmkNSVN1N0sw4iiGcIpFVfaGpnHg5ozgmjsGd0uu2HsXSC5uDiAWLJJm6f7M9SWeL/aHrFiObmLAVkHHY+lZ+/ykRMZUnD4jV1aKdBHCIdGA3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aBntguxz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CKv0ZBqL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aBntguxz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CKv0ZBqL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IEA1q3023664;
	Fri, 18 Apr 2025 15:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=tGHdKjInz4iqMeDw
	+aDNnFLbwNQ03w/ZBreWiyUrijY=; b=aBntguxzkP+egM0rN3DhjEuASsAaKn4j
	VZJoxp/tJWGGniu75n4DFRHyb/KRDgIGkqlQathg3gXHgmbup9DENzAjKPkdaAx4
	kc49v/AxmGiaOAMiwKdZepoZkm/TCRU5Hrxs3nhkzG7wbZ/Jr1oWpRhtc3I3P0Vt
	n4MhAWq9eyfux0VAaTiJibT/8njTUoquUTbk6KIJ0za1r74NqJIFPaYhAGhTib9a
	XDjO45kIeP9O9JtpjJD2gxt+GIrRO81Ope/6/sGW2evioqxf5oIMs/KaZRw1YgwB
	oQjHGKPDIMkSb0FhJ930qEun4W7dUrP0UglElPAZa1w9o0MSVvvv9g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4618rd89y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 15:01:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53ID3PCX009177;
	Fri, 18 Apr 2025 15:01:22 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012012.outbound.protection.outlook.com [40.93.14.12])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3pqby4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 15:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1RQyrv003T3rWcKZVxjFB+/WjpAwe3zALu3tMP5ROxGY4/pobmeUy/1zGQ33IuLqfVzlnbjri520U0HJF3eRo3s65vi4UfMB2QFrlstHj9MZMU9vBAJCbCC2H5hQHO/pZ8688UntrbfW0IBiEaZmpW+NOFJ4LJqKJVbvg7g6cxplUhtAnKNm9YPav+4RBSNnNh8JFoACmh7ixrsEbXxxlCiTdpGNYuSFsuqizJ09iUZRP545XvWoOr9SX+WqpRIc6QrLBCQPXfWMspIgSVpz8LR3XGSVtyguUSCNXhrjwHd7Vvz3vSjbhGnFuLAKBCL8+tq4S+MxwDssTGIiUEr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGHdKjInz4iqMeDw+aDNnFLbwNQ03w/ZBreWiyUrijY=;
 b=TRWNVwUiAOv2deeC65c73T+wC3GsZozFh+N5GpnthqhCBAWjUDm5XuLPpa5ckTlRh74W1dfU26QHUPQt/IMdikE7HsEF2KhDhh0Rr7e15+TLTbJYMsv0P25usY7pWxuAfL/aJWap7V9juSTwE4L5k0sYstubIzUlwycyakdtThwRrJSQyLayuI+CVxu57EMzcEHvqQtEdztKiqSPUSQJWhPxn/hJZ/MN9+6xKU5dnb8MuoPUfvGq1hL+Dfhipc9LNb6I8XZzhGZigiF3rRASz/oezOSRH7pS/2pjX7ARKmM9cT4lyw3RXn6H73id4zGe95RdMWnRhSLQKwL36bGuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGHdKjInz4iqMeDw+aDNnFLbwNQ03w/ZBreWiyUrijY=;
 b=CKv0ZBqLMOLgSMej/RK2A/TjvQDJHnuUHbGLcOSqMJB7ILtFEPlYKoSaPkAZsWJt+fclgt4X08CESFgL44NQlibjeWFPo4Rrymp02RyDPlkJ0XdTARsde5MJTlVyBa/Mx7EMerSgbsOauc2ZUuiRS358XVM3v+Fw7z0UtpIV2mY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB5996.namprd10.prod.outlook.com (2603:10b6:208:3ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Fri, 18 Apr
 2025 15:01:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 15:01:18 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2] MAINTAINERS: add reverse mapping section
Date: Fri, 18 Apr 2025 16:00:52 +0100
Message-ID: <20250418150052.299220-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e33c04-c94d-4f12-ca10-08dd7e89df43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GN7qPATxLTdH6LYW1G4YB1dFNvEuNz40pnAx3C/8sX9VcfQYHqXS7qCe3UZu?=
 =?us-ascii?Q?4HUEbcTWzwdBMx1qeqwGvdW/MSKdNv6a/lEMvW9aSIuZju9gsrbAEn3/5z7c?=
 =?us-ascii?Q?7T/vl9gx7LhUiS+GQDZKMjcLE27xPpsrsgwXSEsl/KuyauKIdF7G5TjmqZ/j?=
 =?us-ascii?Q?3a/x46aOJMk1qNeHxs6LKYwX99yLg9qQAdrDWMQ5WxRX7VmVKlhYCnuPjRfC?=
 =?us-ascii?Q?mDFYTNwaFeo9hwphUIVa2VL/EW/IBZ02GHiB7I7Fr9OMetc0KuwBAQPd30zo?=
 =?us-ascii?Q?7f+pjC/yklHmxCmvJm9mNo4aP0/HRpXB9bFFIxW8Tmf/eUDkKucwvjWgDpCc?=
 =?us-ascii?Q?lsHd3fBV6XAwsemelmPtttY/Y8QoHTeqZ+5h4WmwV6pj+Lps2/Vu/6WhXIEK?=
 =?us-ascii?Q?3kAsSs3RYshHXLQ44XIfkQuFy9vcXvJhqzZ6PWXP+0xS3vaYuF2ghsPR9T9q?=
 =?us-ascii?Q?hIcksbjmNOtf9H+O0TGdVX5ntvqnrN2sG6TyjhmmzUULgtMO5xwYusM91c99?=
 =?us-ascii?Q?zCmkezgmnO2qxYl+1rDRhswdl4yP4yZJGrDv1UeiwJhQCa2CdMwWz/1d66uX?=
 =?us-ascii?Q?ICmdWr4uHDmZsBkU0E5IyBewiaaX6X9vG467LBEAxaU1HlMiM8Fg9ZOxbO4L?=
 =?us-ascii?Q?V49aKR/T7bEYLePdp4Xbl/rGUBGBsGHs/qhrbkb8KMSfbo0fa4vLpnbUHGTB?=
 =?us-ascii?Q?0EONMdGMedZShSVLFg2Xl9atZ8APrAY+LYz5lxx5rlmkzOQVoPojkYTQJPUG?=
 =?us-ascii?Q?RaddmkofyUOgtWd46h0g/irKprIWiw3FEd/GWKBuG7YYI6kkqOQbrzDXDhEn?=
 =?us-ascii?Q?K2zl01Ac9Ky+9jY5bg5YUMpdrsX1m6HapM277xhUKsMij6giZUXDbSwa2qQK?=
 =?us-ascii?Q?AdW+7oMz36qaSWBOPkhOY6hF8sD6XLsYEK3jUaGH0At3rTQ+tWLJhy1ysoxz?=
 =?us-ascii?Q?ShZ+smAzNSImu3QuUKCJ2kqSL+lPi4wUeotB4sELavkHksHjH1MwPVu26fwQ?=
 =?us-ascii?Q?Ru9hJrQcAQJAJsnwSlGfISuooL0UIv3rbNE6T5/JNIaIF8XoFPy+ZLp5qknm?=
 =?us-ascii?Q?pm3Q6Bvl7oDPs46Ddg1pGH8CyqMjdLqGLGVz1m5VCxyJHDerIZsaxA7diq3J?=
 =?us-ascii?Q?jS7aRuY7SuQPlTZDOtiysQVU7F8Dy23bz6SQx0S39zAFRV5H6vpLQnILapxT?=
 =?us-ascii?Q?KGbBruyyYJvZBbfYzOb3NMKTa8Y8xRmdmXvoEMU1lDXHu47iAk8OmPhHsU5M?=
 =?us-ascii?Q?xtGwTtPdxc7dsOK2N0K4iPAtXLji8W4FaV9dDjp9ikILvK0/TdIarQmkIHY+?=
 =?us-ascii?Q?0ro3tvAddF7DqT3fz8FVyBhZIfangOvtZn7vPDKEriSQkpZ9dRjxCDIfOFtz?=
 =?us-ascii?Q?R3zU17AHEiaXQW6YcdJkNfxwJkqJDeGK2J+b7XRgZcBpCrfGJqS88Qf84on+?=
 =?us-ascii?Q?ZvIu1u44Kmk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rT3gE7KjguqoN6QJfFKTdX1gJNEyTRpBwbaaK6ISpqZK4ae++qmbmGQhZT95?=
 =?us-ascii?Q?ts9tWxIIM7nUAiX0uMEuKE1tdlNUu44sZgfQX7Da+KGDMRtItRQOVzbo4MgA?=
 =?us-ascii?Q?nS9XjWRzRW+9eZVo5xBNQJIwHCXX3WF7Jw5acuW6lgGNYJnoP2E4oH77A1iM?=
 =?us-ascii?Q?B+LZ5fxwsvVJj55mfAuV8BlleExEVrObvdPnDnfcuwZmRVNxX5aokVCAr+Qn?=
 =?us-ascii?Q?Y8KDtwcLONmdD0IJCTXLqVpPpgixOgDkPCzRWBLVzDDU/1Ymzo9vvmmahKie?=
 =?us-ascii?Q?jXk8Bl9svhFeRZQ2b+UbC2ldNEeqZPTVbN5xb43qd148u/50jdkldlPWAUsq?=
 =?us-ascii?Q?/WtqMUeAMV9wBZdJOC8xLd+bDbseFaylTnxODGfP8HI8XWBwz1PKaihO5uNF?=
 =?us-ascii?Q?fkVFnlTYpgBQkBU5rtsT9B/aoTpR+XkMrXT0ZIceKTBDelMXgpy5nV6h1/ll?=
 =?us-ascii?Q?fDk5rAiISydSPVwFEXMmCezgyxYdaGRz2ByhtnDRyLQolFDjKWlzXY6R8iEB?=
 =?us-ascii?Q?7ORcHz/tdcDolCFppp+Nr/mZChTfLBx5FjbAQho9v+ibofVMQFMrCzSf6vHR?=
 =?us-ascii?Q?PhVrxv0YoMB8k83XRk16yaei8ABsHq5l/gPpCGHB5T1IeHtvdHsfSwY8amwL?=
 =?us-ascii?Q?5LB1awD2wwOctcHerQ+nGGFNYfYZIgXolqy+mfuYiXRAk/3Y8gpU9t+xTLDO?=
 =?us-ascii?Q?akKSQ0I7jQH0r1BTqxXTlJPwJaI3fWGXjokI/VRFbaS7hgx1aAOwoITh5tM2?=
 =?us-ascii?Q?oFIqfKEyibRCnSRFJdcEzQ6Bu2z/w53VMJTFtZ/M2hi583Jo1e6g8iEMMSdC?=
 =?us-ascii?Q?hwNnMchafa34wuZjTsy1C1uvPDuZdQ8fndlxEJpBE1oPCRU4pb/kUszjw94y?=
 =?us-ascii?Q?zP+oAcZv63+xDbO4Ye+F+OIsZF8DM5i9WoG0c7MBDzaih/M7aRAQgSd5YzOA?=
 =?us-ascii?Q?5SdwRdhDIFgoYOg1TfDDAMx9jf8xbXGFQa6J+kZhkFQTDBVxGlf1M+1eUjGS?=
 =?us-ascii?Q?X0RxObO9/H08TRNzpEMxFrNmYJudX8E+7dUe2UQwaYEGPw+zUandFK5bKT+5?=
 =?us-ascii?Q?soUxPFfx90xZaNi19Y5cwGktj3SD33zfs42jKPrA7GMGm+qQISYueLkms41e?=
 =?us-ascii?Q?2kB243xefA9FNuDzYZolwYsG6fnS3KxPgUSNtZeKTElAcXbVPXlH+fgx4apL?=
 =?us-ascii?Q?xte84DfQaePxjeACvqL0w/d1A6+PzfRNKBH9bdlzXsxU5ZzaGvaXlG6VweXS?=
 =?us-ascii?Q?2AlPfTQ4ipjDD9uYtYXGN0XBwdvM1OreW3Gk4KJyE5MiHUMTf2RdU5C2U9R6?=
 =?us-ascii?Q?j4g1rrkpFO8/wt7Z7DI0QhlD0NTTzkEh4A/oWh4wW/32n0WkMZKBK7vkvT9a?=
 =?us-ascii?Q?hYiB286H3JNO+l9gUqY8pSS5hqF3ZqKLww1Jy6ChEHnAHx8K8BXLAoQM8iiX?=
 =?us-ascii?Q?VzdUBSiLdDoZ9sHDLuLoldzYXnAvk86snMGulj/ry4iEMr0cYWFZZoOM5N3c?=
 =?us-ascii?Q?BHjYgixUzPZ6eqOV73cOrKjDLbdSCvj04toDrEFVNrRWmwGCerIqFUqJjjmU?=
 =?us-ascii?Q?JpxMt2q+q+sxbCXCHjZ4boMLGUU34hcyPKo/62q9ES9Ewca38099ebia4bxw?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UDkPj+p1TUj54kRr61ZMkGY3DIAEAyGqRXiggRglLGaVPR7XAflqfYykFfLrSgocpoGmg6mi7ENqXDfD9CHXmryYOpqqcDAmOvEUiAyHwqgCLwcxRYiQrqv2y/vPg2xybkwMuTmWxLScW7+7uuWHvF2mcoSRkFITdWKUyQMNYcOE1t6km792kI3y2bYcjjx8nSoFurJNIF7MtfSIXbHhdzrOgGqRlPk6OMkCIVEguOF9R9jOuQObEI43kmbSKi6T8XKo/1PZfPfFiIZguaEePJ5TPXMUgG3KPKB6l4XdIiwBCCCpy7DJDoyGRKznobEAX/dU4zX1VkfnysYsiE79TP97WBw/zq8fHZ7DZbmUXHKK9c7AgxSaCEktbpTts77+d6nIU5YtXubXTRyU+NnGay94mm4/xb9vCEiVSrJH+1fGWXiAQOi16fsPkkgR9NeBliLbOyLpwPRCWLySffv/n1vRqH0SgWWVtCrDADjiIcgOlXec0W+0f6NvNuaYJgSVmSvZlpo9wj7vfBtD1DexiXYmvbhXX7QnmhfFvby9rA2Q8OVnA77E/FcB2siXOkLa2f+PUZgvWMPLd7KeolO4Iz1vyHQhvGjhIRY+9V07kfY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e33c04-c94d-4f12-ca10-08dd7e89df43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 15:01:18.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr+Ie2X1qZSElkMFu8dD9Pd9tqe+o4dDOst/FlUgtMAUqYQrtNkD6x+HS97/71eB/LmMeE1Ih7lyn9GQqoprmkEGJ/weBu44dzh8op2xJZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180111
X-Proofpoint-ORIG-GUID: 5pwUnJBtt8RxTa0v9ae3RBMYDIdZbyAC
X-Proofpoint-GUID: 5pwUnJBtt8RxTa0v9ae3RBMYDIdZbyAC

Separate out the reverse mapping part of memory management and assign
appropriate maintainers and reviewers.

David has long been invovled in work with the reverse mapping and continues
to do so, so is well suited to maintain this area of the kernel.

I have a lot of experience working with the anonymous reverse mapping and
continue to work in this area, and also have good knowledge of the walking
code and code related to VMAs.

This helps people identify who to ask for help, and also additionally makes
life easier in review.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
v2:
* Spoke to Rik off-list who confirmed he wants an R, updated.
* Propagated tags (thanks!)

v1:
https://lore.kernel.org/all/20250417084904.16806-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19ade456d1b0..aa926d4da027 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15503,7 +15503,6 @@ F:	include/linux/mm_*.h
 F:	include/linux/mmzone.h
 F:	include/linux/mmu_notifier.h
 F:	include/linux/pagewalk.h
-F:	include/linux/rmap.h
 F:	include/trace/events/ksm.h
 F:	mm/
 F:	tools/mm/
@@ -15543,6 +15542,19 @@ F:	mm/page_alloc.c
 F:	include/linux/gfp.h
 F:	include/linux/compaction.h

+MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Rik van Riel <riel@surriel.com>
+R:	Liam R. Howlett <Liam.Howlett@oracle.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+R:	Harry Yoo <harry.yoo@oracle.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/rmap.h
+F:	mm/rmap.c
+
 MEMORY MANAGEMENT - SECRETMEM
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
--
2.49.0
