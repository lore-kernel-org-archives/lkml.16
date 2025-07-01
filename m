Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951ED24466E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377261; cv=fail; b=MBWWgVaXA385zkSfjX6zAM3X238QCISKZN4SCEPhxJdD4p4hJ8nSM0hFFxJH2i5GOu2Ken8ta+qGIJVBnBCm2Uta3A5vrR2N+t+3EqTHNzl9mNgVEg6joLTWSZLaTKPWG2UL0Yqi7yYUaL31JAw4jNrQB70cGLhkcT+eNUZHXlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377261; c=relaxed/simple;
	bh=BW75x4BtmNct/wLRFTHNFaCvqknuGRc2zbDVhkvV8LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LgWECdXBpnKxLZMcqOfAVx2Cq5wvVtILsgfrtCMDZl/zCbcajRDswMwg6iMcCdGF0hyVLrelrjFNj0h1c1ye7RfkrcyIYiVjjg1ti5P/3FBb/Qr3egN5HAGJUTFCny2PmCkFwVPhbrXnl1R7rKrAE2/09edo6FmQi+ftGbass24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DEvfPeOM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CFsXzdJS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DEvfPeOM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CFsXzdJS"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561D9Ydp026930;
	Tue, 1 Jul 2025 13:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BLtPL9jZ5Fdo5U60eF
	RG2+NVlo05N+tSLCD6tCJ60Es=; b=DEvfPeOMCJ+ThdJeyeNZ8ItrFTNlV2kfXN
	dERC6LVAv28jiekTVUuxHz+o4I/pjCYl2+mRZXeIjGp9qc3wS1vg5RIW/hu4Co2I
	voGn7QrOwYSn2wn6qB4NnZZQsPz7pNW+RV6euBsCtBlCrCTA/PQcnUkR1p90yiZq
	PdF+2hLi292jggA0nSqvMQ1XEGSZaiO3wzQ1ZrHK4j8NGVhZVqEJ7suc3/x2pscO
	8qHWrPEEm3pB6Bu3AYd0KXqdUgXljKMIWp0TB5AWcnYf0H73tf70n8LhDZLGkdkv
	vwHDtvcE8ckbyAPma9TmFbx6rWIHVX5jo9q3HB2EGmH9a8Iu/woA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx4rrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:40:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561DWIBD019579;
	Tue, 1 Jul 2025 13:40:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9hn5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huMjh8MPv+IvYSRiW8EpxJ8NyriGVOLtdFmYfQWb1vjnsmJUY+0J56Ga1RIluw4JmwMZRHv8D1tluIrvUJQnDVFX+vd+eT92iuNXliidfAlfqEUuEF9Jq/qAw4C0GgCi7Q6KUhw8ad7PbiaXhEeaMQAVpVkGfJAUZKKXN8jqGx0k/oPHYzQAZLVMo1caLrPLqNiwvhsVTGQtUZDzIw23iJ+sojxV2nKgCqvQT/EtfBxrXGwyezS6A5wlxV7GD4TgXde22FHBHOuCSS4oou1IaR6ygx5Z7l6vEpxiWIRzmE2sp0XwSMR5cHeHjFk7jprMXsz9IJAK/kEB7QiggsRw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLtPL9jZ5Fdo5U60eFRG2+NVlo05N+tSLCD6tCJ60Es=;
 b=Z9Ospc2tPRvHxoTtF6JvgZ9MY0ppw3B1GD+27T8nQPPGwzTTcpKGvkr8vPmg875odmIvJhFngx2xm92M+zPDJCZuADf68zmVm2RmC6aVPMJ3UlQVFYxHMfEtDOW5KSWd1cyXh2yxohaX6PUG3+UEu+4WavlMM2oMnn/dbwx02H03AiNwYKCGFxMQsVMMXRCB0TwRLyvP/JQx4nntz5zoEMwiTe7tRB8lRZRvrCdS7x5L1mkZKk/wDH+fdC4S8Y10bnxDQXHhGV1DkwN/cX92ioLVXCt6gjCL7X4T2FE9ZbjtzBTwutiSgG6tovb6UgdZud2jFNAn6qttIz/ZK05msQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLtPL9jZ5Fdo5U60eFRG2+NVlo05N+tSLCD6tCJ60Es=;
 b=CFsXzdJSKp47cuSZVYq4O0I9uJGDgOYTO35VgQafoHO9vMknU1oeAsUzUva5AFsu2m4qHDM23ibC2iz3B/32hP97vM+1MtN4QokQYNmEaV3k7hLSKsUmrCKLaWnTrZt9X8DnWFRDfLWja9qSyhygAf3nX6RdofUb+/aSiRQH3/0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5540.namprd10.prod.outlook.com (2603:10b6:303:137::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 1 Jul
 2025 13:40:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 13:40:16 +0000
Date: Tue, 1 Jul 2025 14:40:14 +0100
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
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
 <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 8548ba86-7eb6-46e8-31a8-08ddb8a4cfee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BD4k1rJ/g3Dy8JmkGtOyz/4YcekSfpjXNax1QIdFRFb+0NNp5PLA3w2vb08z?=
 =?us-ascii?Q?EB31sS/sOhq8EKTQwzMsjXe6Ad2AboiD1MgVdTANF7G9d5m9o/OJCrNC6yzh?=
 =?us-ascii?Q?X+fnxrq4vYWkqjJPdbrUEaGwQbrGMR/gXTKSi8FRGLODMpPBR0pNydjXNO3S?=
 =?us-ascii?Q?dk8PEo7J9QuCNMgoPteNhXqOSCpHypQwRpZlN8EJXovnHDT3i1wFHl26/OLn?=
 =?us-ascii?Q?myqbELQHnfBp7lVmOqEaU67ItkrXegVy/81jZNm6DFFTburoK2N6tIT4vKKm?=
 =?us-ascii?Q?tro3RjPAAnIryISQL/m5NNfZ8E581RouKmQ1opsA14PW96mXNutB7s6Wqcnh?=
 =?us-ascii?Q?OxKNUUWpCgKwCwPJ08xEFrUvrE5JEfFSyRTbR8HoWmpfXKuyIidWDOfE+OsE?=
 =?us-ascii?Q?9YYdUD88hbor27D0Gbn7h2IvEM1xaQ5Ad4Kpmxc1RRsvYOwcWnfORJ5brMyc?=
 =?us-ascii?Q?jRRnfzuqBKV3wofs6d3lAXCaP9UycckiTTterr3WAx0UlDrr3mjI3khJwOWt?=
 =?us-ascii?Q?ElexVcToYqbr3zrkkj1YSFnPseSUaSBcnY5RnF5dFkvbr9xIakIktz9ua74A?=
 =?us-ascii?Q?TnM9RfqVQsECePU+sRl1pDjOS6V1Ntp312HIq3CoOKXcUE97P98fFBY9JwF9?=
 =?us-ascii?Q?FOjCjLDfu3rheykuqTYINHpjs1v0eKeVcjWsfK4FJDqv/1AyZgFKkzO7qjt9?=
 =?us-ascii?Q?iGaZiXIkTw24BE+cQXCuPHT8VhyaKBNMphTTbyyrPq7QS3poeSOxWnPIOCny?=
 =?us-ascii?Q?ApZQuTMl/unVJMMOCnAzlIdpRT1cWj5de7Cs20lBmgDXdWimy88/PdMI+Jsk?=
 =?us-ascii?Q?7n549FLpve/7ldDKKwCjViYmvHcQMFUpzzK8F37B47KxL+JK848lT86eC1l6?=
 =?us-ascii?Q?tCchII+SIiN3kwhJGUOzRjDkeSoErazkhtZR52qVyuKvS0AAF4GSDWXLTTyK?=
 =?us-ascii?Q?b/PaHFAk4tvBjlCDtxecCAg2y8F3PoTjRLF9z6h3XgdYbYS8OyVvGf/qmFoc?=
 =?us-ascii?Q?1B5/lxo9CbjM5guH3jlmHSJmKt+a/M7AHivCbWOPCKzJfCm8YLI42/MDeMkF?=
 =?us-ascii?Q?yMabVGUPB8iE6nfm1PUnzVLTkPThApPGt+D9INwGg7+9t0f4+mL9Uo21aXRo?=
 =?us-ascii?Q?aHNUAL6MXp7WJYqIefw93APeK1ajQNjndy2d1YsGOsOZZUckpidngj6ngo4F?=
 =?us-ascii?Q?Z7x6MemrvjD1jfb8UNFN5/EC256L3h0E9ikEJAztxf9Amdt9NQ2k62LaNj4X?=
 =?us-ascii?Q?AaZwCQ1Rkkjgz1e6TKGioV4KhXfbMk2457gMc7HacCIHEpRPiAmszxlS/a4I?=
 =?us-ascii?Q?7qvDpJg4der2ClN0wokrsScG985tULbi94zB68UVvWKY8S/CZoII9YzhoK3g?=
 =?us-ascii?Q?9dU5Pq9+OP6qRTStXl65O99VAPXJhzgxBoXqjMz8Z6+1AoUMXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xGse3OnpQGhQ2fhOTKDHlzPM6t/RXsLUjdJK/mUX6VOU9fA2pnDR7vLVTOJf?=
 =?us-ascii?Q?UTHpbMliW1WTln5ooLUiSo0cqpvi8n6/+YNT8B4yzLbox+kyAfe9JoRe8+T4?=
 =?us-ascii?Q?Y4Z6P2po47RLcludULicZInRU6hphBll8HKIUCsmATPREFdNKU54B/vibZ4q?=
 =?us-ascii?Q?nRCas7rLadXFSv2S24E3l+riHVMU2MLqVKs6/b1wCnIDEq3GC9jPDr9TT55e?=
 =?us-ascii?Q?r39mcYlKmdBueHlqZ167J3w0LFcz2kIPy8Je3g1mDiFNGSKRuMdJto6OzM0n?=
 =?us-ascii?Q?XZ2sCEm1z/d7DKSAe0ZZOklkVCemOR1g6vbf+KxpwaWtQUCgmjyoLPTVvRoU?=
 =?us-ascii?Q?2r8JH6AniK1rUoQFAaeCnkYE4EWd8ijU/MhPcT/ij40C9W6Zb0NEyXx1tBR3?=
 =?us-ascii?Q?mYKvORW+AVqsMZUPcXlRMO0rjJ+qNsaW9iKb6jxesghzm/XWhQN642LYN5cP?=
 =?us-ascii?Q?zM8G4k28EgxNTHJYijSNpwDvhJPOGlIqLBEhosrSjAlhJqwFZVgHSdWwC6/r?=
 =?us-ascii?Q?1y2ThMFarPMs7jG4g23ltZnacxa6EETa7T168tg/a5SP8MNZ6R6M6cGM2VQ+?=
 =?us-ascii?Q?NJtGOLnqNsMow1bCSYjuwBrIMaMH8h8GtlnEVKq83nqNjwEC7g9bkTVERoYY?=
 =?us-ascii?Q?L3jLH8hYsGCzKWmCN/JeRO3CgXBIGZydVHv3OmG84FqJbMwnGxMHrwnlJbNx?=
 =?us-ascii?Q?0Ze76yTJFZDoqJZTNfnLGnheA/JyRwSVvVsI5cRlfFfw7/+IgEduFx/zdMeI?=
 =?us-ascii?Q?xdjXhUue3PoPuwwgJ8hbNKx8+nDIKaMFMCfsMSoAcYBbOEiBCFgCB2c0xzD/?=
 =?us-ascii?Q?NGRvbYm3XLqBRhMmuOlr3BQryXvOX9DW0RFuybzW/SwZQBH3NbSJ7Sgf0TGv?=
 =?us-ascii?Q?IXal5v2CnOtwXCva33oNLr8lkSJSklK8eIYTs3AYQoNpw14lRhI5y3EabErD?=
 =?us-ascii?Q?0aJC0dr6DzagINMyBDI60J1olWXsKnhP1NLynG1Kp8z2z7tgQp8HnamjPWq3?=
 =?us-ascii?Q?65IY4gRSoO1v3gS1smmcDiZxIRFOSvzhc5o/Obrp4N/N276gAMgwjr3feGJS?=
 =?us-ascii?Q?3H6nwptKYhz2Zj1AwlZ9sy7ofS5x4IaRdU/oslEdwZjycwtNqCOHUBFONdjb?=
 =?us-ascii?Q?FNVNEclTWRAZpYTLB0lPRkuEUNMdN+NJmi4xCiEoZfvFfGM8TOt5nQVQlGT9?=
 =?us-ascii?Q?hy3ntC9ctBwQ/Ct/8owJ18mqJFpTv//MJVbm14pZB/MUMSbr4Wi9ISpvxRZt?=
 =?us-ascii?Q?Lu+81hb+S3Q5GuZHnlYIUyP3/KOZkhFzNji6wkZqKC7SQxZ2kE9pdQINAChu?=
 =?us-ascii?Q?kLQ0xgfR34eLVRsJuCKf32MPXF9jzRnBBGjwUCdb4if6kZv402i3uEF4PPud?=
 =?us-ascii?Q?uaoLVZBD/q8vWryfXlq3dNJs85OHVsp7KLyy+jwejfyNcX5kp3uVje/tHTkf?=
 =?us-ascii?Q?Rq/uS/mnhblB/0avnXpNtQ0uVYkFNC6k6to2jh20QWvWx3aEDgtj5P6iLqm0?=
 =?us-ascii?Q?jsds22hW6wyq7sHwh6ZSaO5PFVg5DxkRJ1TN+2WJLltRb0hReMMQ5zYi2mze?=
 =?us-ascii?Q?fe5IbJftgCCArnR+OdJtpU3j3qr1cfxinmNnTZhXcWIxepbHG0x1wC6P/r9Y?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i9Qt10IYIX4tJA9doyrgy93rEWx7/NP2hH1FhvaXvvWSfXRJcleme8BG+8YviFP+80TX/jzWxnejAn8UwjvbtDAq80TKh6CnEg4f9OF3bCrsRptyosLGWebRx6vKBy0HmTPFb4sgDuRyOdIeTIy5FIFdxKDQK7YmYtvQhHoVi8qOY292IGP9XVj6qtiG5dhwnSB+miJsrfEBYseQvy2H9q9fs3C+f28IqP7WE1upe5/Sq76Clfd9CAtKxVKmRrMv8IxPolmTIpPAhaOpV7Atwp228eg/3gIlzyUJMde42UHeoFv0PHtkilSDX3WwlP55NQ8strsAMK7E4Zxepxv0PRwz/1o6ToIjDKQWLr2vqxFBRzHGzMcQ9TYc0evi7m6I3J8WBxW/HDdkxv+7/Ju7K805b3SRgRZzpbV8gpWRPCwzO2d4b8mIAIHDH0ctG4yqkXpFDkuZuouwQUJDu65Fc7idfqCSsVRPlSFGXu1yLjbt0xFHy8+evVofW50PajKQaNo5rhpE7Z1yTR3ehOrdIbwlfzypIdvj7AiiDmRAW5ME61DKNW6k8D67EzOlu0rNpTMtqmBUZyV9Mdg7S4qyqcMEx9iLw9ncubchdZlxwEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8548ba86-7eb6-46e8-31a8-08ddb8a4cfee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:40:15.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbalILHpt/sBFoT7QU0QR4jqWz+izA5doiiWCIg/jAoJqnbsqPgsG5ZRjaDxH6Dj3a4jyux1i5zyGUa5GD1I3BIP9sYNeBYG9yUdSNZX6is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5540
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010088
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4OCBTYWx0ZWRfX3XVhUdTgwQRk pOCW6KaGax0C/15FfOoZ2m3CkAWcKiQcP1EHP0gOxG+2UZ64BfEK7F4ih3CuOwY+Aagw/D0wYT0 PCTN4hvlPh3nYdwd+c1jPYvIZYLqHiP0OhnbsNJZAWGJwbju5Nw7kR8acUqAVKY6Khhbl6yVbxE
 A+56CS8s76khmfPub7SA8q5rFb9uGK8f2fH37CwXLuwuGM7yvD/9i8M1YiftZudwH/RorKqOvby 1P/3CCONdpv/tAZttwQ6OrN+plCJXJEi4rQjYoyPu+045b3NCnoY20UYQbhrL5uJbA31bcaP/tq OHX/yxthQfMNdOMXZphbmXFyO1FRxyPo01RiNMcRJ2xlHe4LpeZ7LMS128LNBPwif3UIxV3TyX5
 c2dguNnCSbw7YnIi9OyzUsTZSSqilxeuj60lyV0IEbOOHvidL+ezCKAz4omnqXMXHbHo4dDv
X-Proofpoint-ORIG-GUID: exPOcZURvTPFSg00fGe7pdsN7YE_ju6X
X-Proofpoint-GUID: exPOcZURvTPFSg00fGe7pdsN7YE_ju6X
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6863e545 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=EROEeW_xKzzAnM8TDq8A:9 a=CjuIK1q_8ugA:10

On Tue, Jul 01, 2025 at 12:31:02PM +0100, Ryan Roberts wrote:
> >> The issue is the efficiency. Assuming we want to keep the PTE scan contained
> >> within the core folio_pte_batch() function and we _don't_ want to add PAE
> >> awareness to that function, then we have 2 separate, independent loops; one for
> >> PTE scanning and the other for PAE scanning. If the first loop scans through ans
> >> returns 512, but then the PAE scan returns 1, we return 1. If we don't remember
> >> for the next time that we already determined we have a PTE batch of 512 (now
> >> 511) then we will rescan the 511 PTEs and potentially return 1 again due to PAE.
> >> Then 510, then 509...
> >
> > Hm really?
> >
> > The idea is mprotect_folio_pte_batch() would look ahead and determine the
> > PAE/non-PAE sub-batch and return this nr_pages. It'd check 'this page is PAE, so
> > when's the next page that is not/hit max_nr_pages?'
> >
> > So that'd be 1 in the first case.
> >
> > Then you loop around and go again, and this time it'd check 'this page is !PAE,
> > so when's the next page that is/hit max_nr_pages?' and then it'd return 511.
> >
> > A better example I think is e.g. if we had, for the sake argument, it return 16,
> > 16, 480.
> >
> > Then we scan ahead 16, set nr_ptes = 16, process 16 PTEs. Then the same again,
> > then the same again only for 480 PTEs.
> >
> > Each time we set nr_ptes = the sub-batch size.
> >
> > So I don't think we'll see O(n^2) here?
> >
> > It would be like:
> >
> > 	do {
> > 		/* now returns sub-batch count */
> > 		nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
> > 				   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
> >
> > 		... rest of logic remains roughly the same ...
> > 	} while (...);
> >
> > I may be being naive here in some way?
>
> I believe so, yes. But usually it's me that ends up being wrong. Let me try to
> explain my point and we shall see...

Haha no, being embarrassingly wrong is my speciality. Don't take that from me ;)

But in this case I think you're right here actually and I've underestimated the
complication here.

>
> There are 2 separate requirements that need to be met for a batch to be assembled:
>
>   - All PTEs have to map consecutive pages from the same folio, all with the
>     same pgprots (except a/d/sd).
>   - If anon, all of the mapped pages must have the same PAE value.
>
> The first requirement is managed by scanning forward through PTEs until it hits
> the first PTE that is non-conformant (or hits max_nr). Currently implemented by
> folio_pte_batch().

OK so I think this is the crux. The folio_pte_batch() is naive to the PAE thing,
and so we end up having to rescan.

>
> The second requirement is managed by scanning through the struct pages, checking
> PAE (or hits max_nr).
>
> The final batch is determined according to the smaller of the 2 batches
> determined using both these checks.
>
> So, assuming we don't want to fold both of those into the same loop (which would
> enable checking the PTE and PAE in lock-step, mprotect_folio_pte_batch() needs
> to call both folio_pte_batch() and loop over the pages looking at PAE in order
> to decide where the batch boundary is.
>
> If we want it to be stateless, then if it scans the PTEs first and that batch is
> larger than the batch determined for the subsequent PAE scan, we return the
> smaller and next time it is called it will rescan those excess PTEs. The same
> logic applies in reverse if you scan PAE first.
>
> If we make it stateless, it can remember "I've already scanned PTEs and the PTE
> batch ends at X. So now I just need to iterate through that to create
> sub-batches taking PAE into account".

Right yeah. Statelessness is not crucial here and doesn't seem workable then.


> > The current implementation is not acceptable on the basis of adding a horrible
> > level of complexity. That function is already terrible, and adding an inner loop
> > for this batch special casing with _sub batches_ to account for PAE- nobody is
> > going to understand what's going on.
> >
> > 	do {
> > 		if (...) {
> > 			while (...) {
> > 				help!!!
> >
> >
> > We can do better, and I'm going to go further and say - this series _has_ to do
> > better, because I can't accept that, however we do it.
> >
> > I want the efficiency gainz as much as you guys but I"m convinced we can do it
> > without causing eye bleeding confusion...
>
> That's completely reasonable - we will get there! I'm very happy for this to be
> refactored into help function(s) to make it more accessible.

We'll definitely get there :)

>
> I'm just saying that fundamentally, we either need to flatten this to a single
> loop so that the PTE and PAE can be assessed in lock-step and we never
> over-scan. Or we need to keep some state to remember when we have already
> scanned for a PTE batch and are currently working our way through that chunking
> it into sub-batches based on PAE. I don't think we should entertain a stateless
> two-loop solution.

Yes.

>
> >
> >>
> >>>
> >>> We might need to pass a flag to say 'don't account for this' for prot numa case.
> >>
> >> Yep, another bool ;-)
> >
> > Yeah... but we can't sensibly add a flag for this so the flag idea doesn't fly
> > for that either... :>)
> >
> > I mean I don't think we actually need that flag, let it skip the sub-batch size
> > then check again. Now that, I reckon, is a small overhead.
>
> Yeah, agreed. That's probably fine in practice.

Ack.

Let me fiddle with this code and see if I can suggest something sensible.
