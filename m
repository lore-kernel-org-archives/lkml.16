Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963001E505
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891565; cv=fail; b=gKVuUB56A0f6o69l1kcPdtKW6ahuomxMpzIZkT9WV55Q5+pItuSOXd4Qvnc3rvmv7n5zNNnVXYMQWRPtb88dmi6LpTMhLtRPYW0w9sOPBu4RAVsTWhM6rRmM4C5i4Zj/2wmA0EaX36BIaZBSLnd1wcZQ9Cn5WTi/lDny8OijP9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891565; c=relaxed/simple;
	bh=L5SiZi0WiAFhFvuNeeJoxU7+j0Kxv3GUxtysAJx2Izk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g8UjhBxDMOU43bCBFS4/QAXPN7AZCcfwP6CKSzW9kTzwmWMb0n/GivRvO7pnedvf4b0XinOOrGUPQN5r61B9h3ynQl5crGpd4WCIEu9hdkalFOyr5UNUQGGKgfFjW1AkuJ2rBVhv7EB3R9/WtPtWwICtuoOd1+3aVnu7hlyk4LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UwH0C2U2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L76U4gnl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UwH0C2U2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L76U4gnl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567BiWtx032205;
	Mon, 7 Jul 2025 12:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=L5SiZi0WiAFhFvuNee
	JoxU7+j0Kxv3GUxtysAJx2Izk=; b=UwH0C2U26lITi7hZYzO2ECTKuqtTbVXI2+
	8bz3wUPEmxH9rKUKYMgmrxvdY18q47ZDuYpKNfh6DPDHk/EMT7dxYk4jFhW6bw41
	6dV2i38YDjT3mMAqzTju5zpEktmojgkIpqC/iJlSvcpB6nnKbreN+bVTLnzL1TZT
	Na8AiDJ2WreQUhbIHqgf0c7hrSgKENfABl1DioIPwHNim6YCMu4MPQPvSOP9U33i
	WeRPgZzd1Rn5wip9kVytRgl0dUbxeyJBcVp7SHIEJaNaqcc2l8f6U59Ti/YwQ+hi
	C5w5u2KRGd2t39tspQulLyZ5qZewBbkHLT/Y70qHfpuci6sjusag==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rdm3r2f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 12:32:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567BAhJS014180;
	Mon, 7 Jul 2025 12:32:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8x4vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 12:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CW18JZcCDFANtRKJUiHkpAa4Q+OffaJrZFaS8lV2ZY4HuJBcXEXUjUnnp9fte9mvqa+aoOv/sF+ToijixwtY7EMk66NdlOZTR7xWqFBzfqnHozSj+PQdQW+nuh1RVq72qi2ewu3p1SDSqUFJw1JeSX6zfE9MrmCCDHQTot+LgDLQW2ndlr2wB37rKGji3TVNcY5AN0GB/TwaOl9MIWlhSfHNz0Drp/HwFVPPyAhTanP+V+yjsgP9YZOCeZaQUV7RDlPMVmQRLFPkxk9TfVUmL8VHbrOyUOdpGH1uQPLksnb+bPn9uASeKB+IMo52cDs7Iq28fO9LrgEvzGCVGOeY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5SiZi0WiAFhFvuNeeJoxU7+j0Kxv3GUxtysAJx2Izk=;
 b=F334CdUR5eVbXcFJR/urTO8Tjod50r2n9HVJYSRvQIV+V8Xrd6SGJg8/4rN6l0bzvCc3xHdOHZH5e7gmK3KM3/GSXD1PGfgISZLsfxDO0IId4byrMFROZLy/gZVXAIndoXUEBwwMwklsNW1WtH74WZffAl1n35wPWEr+WX9zdYGvKBWo2ek/1ojbvc7H7mXcrWEW/Axqgw1oJYbJY7B+NVCF4QvSjTErrZkIIrSXtZ0icqzIB5w8CYI8I3r3znFys38nuDxbR5Bm+FmFSF7yGuQVleSNHLjFEAVH8y8dfqF2TIoyx3B4iQ9rAS/KSMNTkWxEBP0QWyrEwwqcV69ysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5SiZi0WiAFhFvuNeeJoxU7+j0Kxv3GUxtysAJx2Izk=;
 b=L76U4gnlHns+/SMRoAK9Q+hmdCyIY489VGKKnHsc9AY8Gx+kqV4oD34qzg1nxUaqGMkOrJmptpSY5PYBrnRZQPOBKyRtFiH9/wbbjQCXj4n5K2fQyERsUFZcduAqcDBOznmoYXqHFaVGobO4wDH3oxFxKxszrv9+GNolN7EyfJs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6231.namprd10.prod.outlook.com (2603:10b6:8:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:32:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:32:13 +0000
Date: Mon, 7 Jul 2025 13:32:10 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Yuntao Liu <liuyuntao12@huawei.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, mhocko@suse.com, surenb@google.com,
        rppt@kernel.org, vbabka@suse.cz, Liam.Howlett@oracle.com,
        akpm@linux-foundation.org
Subject: Re: [PATCH -next] mm/memory: fix null pointer dereference in
 fault_dirty_shared_page
Message-ID: <0bc11a6c-6535-441d-ab55-b4affeb8aef8@lucifer.local>
References: <20250707105118.413056-1-liuyuntao12@huawei.com>
 <2b716e2f-0642-49df-a955-abfe0525cefd@lucifer.local>
 <ea66f8a5-de20-4f6e-afcc-2eda84709958@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea66f8a5-de20-4f6e-afcc-2eda84709958@redhat.com>
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8677ad22-b58d-4fc6-f7a5-08ddbd524cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jzHu44at91qEFOShCqOLSj8xzKYV4whYf6C2JRhgXY1FsxbCFmS0sdc0rzSY?=
 =?us-ascii?Q?ZHhmh8yEOTXQtGzSsyuOLhUY4vBnqZd0koY+DD+HDfvuC+kTb9jJo3Ew4q2B?=
 =?us-ascii?Q?ptf9hk0+c06nd8WIpL3Fqcv1C8utGqMRjiX/nvERcW+Ll84MR8SfzqkiDHLb?=
 =?us-ascii?Q?7CdQAsW5dusHTqTmwagx7jtX3Ze3GUBWEVX0WrkFrCN+DHVf+p+Icv94TEwW?=
 =?us-ascii?Q?in0oDLXKjcHEvCLPATFHVgQsFSbPyZlq17r/ICZj5UErH421IF+76/WoNNm6?=
 =?us-ascii?Q?MRFMWbKwZ2escaePbKM/dfUC96VVFm+bwjRwJd4TgCT/BEJaGJZhtVKH4Dlh?=
 =?us-ascii?Q?/6NZaRauNmrmPbofd5tLxRB0RVKuGuuiPT1/ibBFVLwj0bAfSqP9XPnpAtzt?=
 =?us-ascii?Q?2Cg5jbQ0y82qtZyv0fZim8cH6K3H0xoiph7sSmA90AX9uS6ak7VedYv68QYW?=
 =?us-ascii?Q?aj9vq3RhZPdpukGQsRn/44i5eKwNfq5sl78oMn1neQSsdbNSE8EHudzyVLbA?=
 =?us-ascii?Q?IAdv80p72rgn5bzBgdXkvkMMnBKSSXFHku24GqvQnJk6+hfv5RoQm5wE0ssj?=
 =?us-ascii?Q?k6NK4hpJyON3m8bkH/E9bBTHx66vfHYogH7ozGh8joK/2+/6eLUy+C2grAG/?=
 =?us-ascii?Q?b91zDal4G0CMyAJESEg4uQ9sjdryS4Ab8MoELWeaq2DG5iLLOnnmA14uAei8?=
 =?us-ascii?Q?0XCkUmkm59Bj031Ng4NuiWHe34Di2AO6KxMcg1KlUA7puctk2140JalymUaZ?=
 =?us-ascii?Q?CEoBxI3g5N+N3SYwP0JxQDXk7Hh8imbuFHaL8ImK7YhMi/Tqtg8M0b/wbizM?=
 =?us-ascii?Q?+Yj28jm/AeI93gXU0RFvzAqvPkV/gNojSCQ+bjFk769GIjve21RZnSbeC/ib?=
 =?us-ascii?Q?JLic1vzI99QYDfkIl1quATRMdE//S3F+SRxDMJ5YqHNzd7kZ3bARJaLeelm+?=
 =?us-ascii?Q?r2UGjj4ZNLzcAr3/0P+LoARyOl+rokyzpQOG0X7Oc+68bk93O9Mw7AHs/X3e?=
 =?us-ascii?Q?AeXWjuH4lvz9uJZ19DASCxlREY6EAkvORTIfgDBy4UBmcOlSiUT+M7jDA3K4?=
 =?us-ascii?Q?wMOShHcPKTuCaliH06pjxOQLlrydIe1ZWFOkk1np2UA+/grt8mzUFtFhP2qB?=
 =?us-ascii?Q?Lug8K2Jq022hIkZEGXgwS7k/GaB4sjYS04CZRm5cMAfGb4L9P10WPcqbarS5?=
 =?us-ascii?Q?OsCy1JOaK9FKPdSj/pBKU63DN0ExxKZ8x0qwZ1qDCZl560tF9efTsqrglION?=
 =?us-ascii?Q?c4dXx/Tg2BsI99t2Rk58pKHNDz1BkC/rch55afwNL51ZcnufEoUd/ATgkscc?=
 =?us-ascii?Q?zdSCuHyZogWG3JRgBMvycTQ6LrEjLH+832u3dQSNVSmRijw1SurWMb6RXlCo?=
 =?us-ascii?Q?TeEW31SY8OUZn/GuGwBuLfjKdVsNZuahuIFYNIbpw7+k0gkpqQfsb7xCOfHm?=
 =?us-ascii?Q?rTmq6SaqTPY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edRBS7o2KvvDl7VzEr6ZzT374keZOtFWBL+NYCFuR/IIElY+fvv5vidPtQnh?=
 =?us-ascii?Q?k3nRz3aDfyHnlxkLwEw+CYhteeUDU6DYCQxJnWlfnUM+OQXFM9deQt1FuptJ?=
 =?us-ascii?Q?AEkWBld5TeVwQRV8hO65TAbqert/YvBtt8xdm/39EE4e3/J3T/IhJw60li/r?=
 =?us-ascii?Q?u3W+jmzJF1DGiPPk2CF5uLkMg+B6zonhsZCggZ47BdOHTaMPSw8sio2ulvkl?=
 =?us-ascii?Q?Pr8SVJVvDoN6U6rNh70I1mcpT2r9Rz1T1vHU3yrVfJip3XPc/5TdGd00q/c1?=
 =?us-ascii?Q?fHK+R/xfA6Lx/KVKznJUpp6Nr8c5V7NXBb2e3eGpUhc/znh4ndmBvbNUPMOd?=
 =?us-ascii?Q?1vGWRh9nUdscvMpavtA7JbNMevFg63KOw3sVlulfOgxHmsxVUFHdmj7OiNFx?=
 =?us-ascii?Q?KVFB6Pm9XsnhOsNc9/gCrO2WpWhcknxyK9RRRXgaaB4KYfeg7D5Fk2mbmzc2?=
 =?us-ascii?Q?jEnW0LHumcmD6PD594r7nGZHg+YDWmhkiwiheUhq4lTrMRjKd5INeeBkCLyY?=
 =?us-ascii?Q?9pmFNpnAtWs9wLzOV/p4DF0aMZieVkMmPbO+Lg9mqGWhDvN3RijTRnSHSuMK?=
 =?us-ascii?Q?40zwQov8TrvdL/IoxouehnNCCKMiMzLJ/shp00+YAb0SMnHcq9PUyDI0XHWS?=
 =?us-ascii?Q?Y4LyAOlNlK4iqbF1fxgSt2PoxLYzuv2r+aFYReLQEB0/cLNv9Ra/ZbN3+Gh1?=
 =?us-ascii?Q?RXJF2Wtt4IVk1sx2EB9ezdhP20pcbiFeft49m2FSKqPiYX+BaNrXLYX1zJka?=
 =?us-ascii?Q?Itw154itsaSkTo8IszxcFkiBGDHtop3g9QZRB7KFsGT+jo7767HQxvabB22w?=
 =?us-ascii?Q?DLDd4+jbohvXOpQ7fioBDVK4L7AKpsmwLintHO4u0v00dki6LLdvNqZf3+Z7?=
 =?us-ascii?Q?R8eAxXg1Y5pmrekfJNjWvajDPb57o9hdfEgv5aws0cFOJidkQp2t6xN05J0H?=
 =?us-ascii?Q?k+krfNRUEmRNgb0poVyuPFfFYjQ2lkOeVXYNjA4jys7599OokT3GQWDbV9ZU?=
 =?us-ascii?Q?9TlYEVHx77foZCfWWRkl/qf+WhtwVYJDbgtsSn4PimQM7C1cvLTZk3ji/t95?=
 =?us-ascii?Q?i+ORDnoXsVqaBPog2SVnXM6KpKTzhikFcHcS/HD3kXNN5Y+2ObXfVz/81VzU?=
 =?us-ascii?Q?DiRnAOoo+LORcefB4PySRBE1XFOwGw1dP2V8ap2eIN7PBIj4h2BvC7xS/BtT?=
 =?us-ascii?Q?c+iBSP3ig2yPNYNaYxxqqkbptuK+fE2YQviMkGjs+rtG0AvQYdPcQD3uMUk6?=
 =?us-ascii?Q?quclq7wljETJQ3ChBec6DA0TgABCX0Wn9CE4rlGhjzwrHx7JpCYggs6LjzlT?=
 =?us-ascii?Q?YTq+NUXxB9kVA6n/W/ISADUf2vQ24UC7jpkSuL4B/yAGYR/UXpRdJCd2Xdy8?=
 =?us-ascii?Q?mj0eRwQTvz2p97UoDsq3J58TkP7Z3KzPUuK9DIDT5OdGoarh/GIAbZtOeoB+?=
 =?us-ascii?Q?V8V4okf1iyegrfWG+pEn511PKUw1CGKayoERN6nR+P5aozfC6qaPA4Rs4e7Z?=
 =?us-ascii?Q?GUOTOE4TB10bcmd/EkHzqgFkCemwvNBDsKa6WU391ikgFSRKPXCwAwzuME0P?=
 =?us-ascii?Q?5ZAa3pVThMaMC2m11Xr6kYHwriZuurp5zHHVBNvKOq/LpLidu6iOafx0RWRZ?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5knzlccdYGw2US6OCD+D7VeAywxFt91pOCC3/ixbVl1SLwErB75Bsh8vB1PBr8QqAeWSxxU5mi9ebw9FErOoxZQ2KdzIsju0ma+7MKm+cxEDK/So3IzTirWuftOwEvE9v04rxGgrlu19s2vNauc3rwPY5ksu2wPQBui/uLk6DjrQJO15drG4CKWHHMJ/LJK2Eej8P7iE2FMZi08+n04lfvXkey1xsuMMoRXtmiQyepxIO9SoOaLRbA3eqkR51I+hbqu98dGIuj/RdbCwEgHriMjesxbDR/W4sR5evB3yesZMLhzU2dYzKoj7fuE7fgjhS4VjXsAlbMzR4cwUBjRpdVCNhYTZdYFl6n8m6RJ2J3BOiQzQiCg0hjlAoDDp1PCd+OTyTj0GDzrsZ5NhcxYQWj77/KTt8THh9BXR5nttuiokxT9FbGbn9hSJn19Vjkw0kJdrPZ8FhrBkVnZAY+iFQla6knnXVJPaQxDakgVXABRbKyeZNgxmu1FPIAIKxiNJWqmqzmT5RRfQ6HIOicxedLzPTek9xi9elsxj6xigZby4NRxcjuGOgsyx1VMjZyKqCj/lLZqe9GB1O0eFyCIkgHkRyhLHwoRUavrdAFjYj8E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8677ad22-b58d-4fc6-f7a5-08ddbd524cd9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:32:13.1951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCJxsoh5VwxVXODG8T5iuv1RPX/qwGql7otOvRrjogYDqcQW+jVb8lHBdBaj/kZflLOFKihZiz3FiQc72CuZT/Rp6kiMBbQFltqr8r0ZFRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6231
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=916 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070073
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3MyBTYWx0ZWRfX5xC0yVvs98rG rz9hIKaNeB4WRqv5No4hwCduVhQ+gM3Now9TM0jHIWI/Ya+3N+k70DeNsPd6RMfWrTU5DZWfei2 Oq4g4jRTen7QfWk0jcCL79Jndg21Z2f4g1eX5zwEG1t2fdu/ZHCs7bIj/wzwt35IDdzxRAO+gg7
 /V/4oS1SYjBWyOg+fcgUfoCnW8DrLLSbS4p4LR1vDYIKfQawBATyjg5HCrsAbfhgpscwg662RCR iF7cGiBj8bnunId64E0B3n4DxjkNIY/dBJRiJZagTYYqFFMVsHLe41XqYqLD1Co7X1/5Pfr3Hn4 FNUVivO1IaEhaen5nPyTOpOe4N+HM+TzrR6D32+ZdMQ4h62OGKV6XzKVWmSYM8sGGJF5GcTReDz
 vDUodkNLNHMvtk5zQBRmfsI2BjP4zv+dqsBb81AWbQKgeh/+fwy7d5eVqmQYxsyuJ7PBZ3eV
X-Proofpoint-ORIG-GUID: 9wR7ciq_dt6EKtDME0R3S8hma5Ff7Ggj
X-Proofpoint-GUID: 9wR7ciq_dt6EKtDME0R3S8hma5Ff7Ggj
X-Authority-Analysis: v=2.4 cv=CacI5Krl c=1 sm=1 tr=0 ts=686bbe51 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=0v93pcGMeb4zWV5x07AA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13565

On Mon, Jul 07, 2025 at 02:27:01PM +0200, David Hildenbrand wrote:
> IIRC, MAP_ANON |MAP_SHARED would have done a shmem_zero_setup().
>
> mm/mmap.c still has the comment "mmap_region() will call shmem_zero_setup()
> to create a file".

Correct.

>
> I think this was moved to __mmap_new_vma().
>
> Is there any (error) path where we could not call that by accident?

No.

Shared means there's a file.

This also would mean we've been kernel NULL pointer dereferencing since
2019 btw when this change was made. I don't recall the reports... :>)

I think people get confused because MAP_SHARED | MAP_ANON makes people
think there won't be a file.

Our terminology sucks...

>
> --
> Cheers,
>
> David / dhildenb
>
