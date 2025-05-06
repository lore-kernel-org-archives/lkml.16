Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9D22ACD6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529340; cv=fail; b=GsZeVFg4m+05dCxfN/dyAGil+I+XJkQ0WbvhZ+Uwal+qf5ZDcIhmJOSGa9FsPtmm+wu4sJSPr6zbjLYEc5/2HbEaRQKjw73dBhyqs77hPtdSWZcjjDxW8RItIaO5L69hYQLdnyPDswfGmIhjyspAECSJE+c8qwdiriRem4JKu7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529340; c=relaxed/simple;
	bh=VWugPGSNrrgX/wGJa79xCGlZIefs7Cl6H459koDwEyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c/3UriDe46qPu5PfkI9jPBzm0htTF6aAWK9AfX23Rjzt1AmC66fPJGZLtNTE01ja96BHCZvYs1BtHl+m+sUQ5AcNZkQbCjRzxY2MDWSJj5+fZkLuNGntgiforpoxAYHEy2XEHoigPeKQmT9ZqEtIRha/E1PjQh4FP1mqajDd7ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KcffBy7v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n2/Kkd08; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KcffBy7v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n2/Kkd08"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AWG94018246;
	Tue, 6 May 2025 11:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ypEiESzKiO9lTVtt5S
	c1KQE8oUVZI8hgTSsKQZXq3vM=; b=KcffBy7vz60uwcAbDVU58CAuTDZjiOnXqR
	1lgUwtXDwBjnNunonedkQufgW5+/HIv8Xz9MGnn1pQKoPkqW3d/T9loUYDm+KZx6
	pv35ybR3IbVVLWhdqPi8JrzJav0QyyW030wZfjI0DTL9paVObtUuILl8YhFKZ+ln
	nEorPQVaMwBhon4ETJV6TV5fYiDvwjge9EvCJmcoBxxHFwVpNL8i3BxiW/Vk9caR
	nTEwts640L8Gt8evjt1rFGdouQ7jffsh2ZneHZFVd99ifbiMvuulJm1ZySWmScXw
	kyNSMYcrNzB3vZZ1ikY4vtnY4EQkvyMoN72HTCizk+oVw7WxuCLQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fgrn0198-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 11:01:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546AALC9035362;
	Tue, 6 May 2025 10:53:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k9kb6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 10:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhURYX3BaW6J3Jr5UuTvcqYb8p1gTbthwTCPjUG9RSDIfPNZDY8MIvSxACu6Ndh0m4IEHAZFDdMzzqI/bOMsF45pawJ+w+Ecw32ciF3+T6JdOqVRDshWPkvL0kQS29CkIQ9KQj67MPR39WhKjXZQZa1ux29xMG9EsSiBjxqcmgyRlUFypPn6yyQp57YZVwLkz7X8AZITBP5V2jplwFvkF8hzCkguQth0HxYhw27HXt4+O1AlitMmZSlWON+tgoTalQvH10oct4UnBTNr316VtBMDUS/O2PdlWrSFJqbVg6HKT8tCerhZU4i0+1Qybrkr3ENEoo2CV8ZeshLFizuTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypEiESzKiO9lTVtt5Sc1KQE8oUVZI8hgTSsKQZXq3vM=;
 b=xIu0k5VO9TZQtzMPZZaCH5DQ7PHY8zcDkUrkj2J41rMOSsfSjsNlff4bOBXXTu7TaNux2EgkgXCSvaYDON6si4+2u0XbQ7zJEZCVN0En7Ezw2G9hj6JeBf211JfbBWMEMablEderkBXVaAz3ajYvEZ0kHDPqM31GLD8VsMNI4K61vLnyECC2KdVwHy3smqTfKy7301IWIkjNSD8kn/Ju3HRsDlTwzWbeDCNgRQWhyAvIWCbt8RojGUro4AfoIFz10QnpLa9weE7jG6a5Mncux6lv3J7FiJeGqOtfAyyi1uanGMd0qo6b1Hg9+elw/5ZEwzg3bbBT8KFflht73Ou5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypEiESzKiO9lTVtt5Sc1KQE8oUVZI8hgTSsKQZXq3vM=;
 b=n2/Kkd08nFJQ61rXDf1Aq7EWsH0phiwzWMJlHBcif9sgLzgzSiUHxtx2M1J/SXBTNVB1Yr42kFdhMGcF6vb0wdX48XyvETGcuJuQGJv10QPCJugtNcoQ2PD9Ndz42/UKhYL1P+hTNuG0mJ4whjFW5RmKRdxcXU27dJcLso/pHWQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 10:52:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 10:52:53 +0000
Date: Tue, 6 May 2025 11:52:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com
Subject: Re: [PATCH 1/3] mm: Call pointers to ptes as ptep
Message-ID: <5c20ada8-4863-4a33-bb1d-3b5695d0bf66@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050056.59250-2-dev.jain@arm.com>
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e47131-ea3e-4d78-652d-08dd8c8c26b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LIzRU5y2LELO4gtdRWsZ7KRhBEISy9K5HFhXahkoYcMmmdaMjNsWD+r1pwLh?=
 =?us-ascii?Q?SUVYgSNI+SVbaopiTPB1u+eA9A8hAzwiNm+Hp+BkisKI91mEt+ytOimn4KfG?=
 =?us-ascii?Q?QqF/zxRR/V+eMA3qpTLfYmcLzSL3fhhcv9e7j0HTL9yZ2ep8a8ll5oZH1c/Q?=
 =?us-ascii?Q?kRTimxbuJGY4zhkinCqHN7YtL3P9TamteIsd2I5pQA4z/VT/99ppcoDLkB0G?=
 =?us-ascii?Q?84p8lhNi+CbuOFjIwCnGb0ZHCnwLcT0zZ45pYrHEAqONzq6QkXlW0d7yLaWR?=
 =?us-ascii?Q?YgBtW14eIkJbehLLlaPskJ0RnziToyDZTE3IC3ANzMOEYV2f2mO1DIr9af1u?=
 =?us-ascii?Q?qK1I+LKwAejPhADx13XA04C3zJIKxJD4DMeIwA49gXvEuK1QW4aNRo0VLiTW?=
 =?us-ascii?Q?xz2Xku+xwjVkEeFKxnlYVpLmoVcVtvbheIncDGkRighrYVHIinW+cMdVvUF3?=
 =?us-ascii?Q?y7NR0+ZPbf8AGgPLES7mh1bsvQ2Zsp1r/wDhpV/81WRp4jUXYIllT0EPSGWn?=
 =?us-ascii?Q?6C02c39G/PsbWrTuCy5rpFzAdVfe8W6oFUcZQTRWK57uA4Bpo4SuOR+BK3ee?=
 =?us-ascii?Q?3Jn8o4mYFI29E7/HDxjgJKnKVglR+VwrBf3KZRKv5JqNF+EZBE2WdPZ2G+MP?=
 =?us-ascii?Q?vJeU9KCh3o6HnA/lVUNUT1jIpUjJ9sZ4Rni5+Ym+a6lVzkdTRfvn8EldIlSl?=
 =?us-ascii?Q?KY2ISjOUOcc00KKvI06C29dG946dpigoI6xqPqvpSR5PQ6YOjSYcY+m1AaaK?=
 =?us-ascii?Q?vCxqKzY4q5lPjLzL0atXz4IA12WXWKzsC+UGLLBfJzkavlHE4cb8PbWJg0A8?=
 =?us-ascii?Q?VNFqhCt6GqafVsjRXtGbWUSxUYfhANLAeLwayAmQReCqsakJYXCXRKXjKHnF?=
 =?us-ascii?Q?JFTA8vFEQ8UtR8fzhVeDuRWVw3pSaB3PTafxNpnONzV1MuSlKhxXCNO70nVX?=
 =?us-ascii?Q?6OQabhINaJLMLFxp5hBFBGMVkasdtBXSmW00SnEmLW3wSvfXYu4Xh3ptHU7H?=
 =?us-ascii?Q?EOsi3+v2jKqw9MsuLcel7lugoJr6ptEM2GqbdkLO6M6+4d0oTsg40siJnkV5?=
 =?us-ascii?Q?S9PrzWNDSEe7ZVk92s8lUZsczAaWeW0W40llyWHitSMW+cELH81d7T4w7NRz?=
 =?us-ascii?Q?vQ0ueNXrnzeNHzZOtPWzPgcVAPWCOE5vWTIqoHeJ3+WX5ohZ064ZwXnCb8xJ?=
 =?us-ascii?Q?TJq3jiAqRZxbTf/9J1tTUIuvd1td4CxSw/ify/UZzAKsg3hZmLtvVHY1ap+W?=
 =?us-ascii?Q?ExiW7ifYZAtuOwj8Xyq8WePysHw8EC/8ErjRgIsUZWfiOW4YW928BAmzbgVI?=
 =?us-ascii?Q?2s2+uZP1qLqHCXybTjzetpRNa8EXmIYAqYh7e6d4syDCf7+G9Tj75KF6Bvs4?=
 =?us-ascii?Q?wI4ZkYTV63YYJVI7Vq+WETWBPo3BVT04XKB3X1PyjT1/1nof+1xwkXQeelf8?=
 =?us-ascii?Q?iQpYkhI78fg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNzJAs6DK5/uPic55Qr8uRiqhX62HVz0PGwsggJgVj5SAzqiR3sL6dVpZtif?=
 =?us-ascii?Q?eag1hL10XLRNOBxM0wAJONhlYKiVBNtTv+gvhaGuXP/dbNxHcFND00bgVDGc?=
 =?us-ascii?Q?utiAlq4eDiRwG/U8nZH1LDK/svzqOabACA46GLQGBuWr6DfMYWj8CEXcAIoK?=
 =?us-ascii?Q?uh8hl55ARxWETk0bg4fyDNYoJQir4wpZYF182teKaSGdbO+AJYlgj57nG9yy?=
 =?us-ascii?Q?VGkD9xd1kY7mUAYiR7mbVPOeuKh71HA0AcKXfj9/KyLBQlQ2xXRd4FxtJlaT?=
 =?us-ascii?Q?qrLknHsOPuPTbXtxdnGwRho7ptjulI/6Sk5vXdfZps2CBXCmO9Pv1s/TwGs8?=
 =?us-ascii?Q?cM2eIcV8nAiCBs9E0Cq4vZ4rFCe1mQ5ZeHc/0uJRIE3zsp/7pfm5SHvLb6Uc?=
 =?us-ascii?Q?tfqsdo/K2aj46oXDOAthVZSg6oymoiCIhicJXiWW9qU7Br9nqAY8Xvx6O/RE?=
 =?us-ascii?Q?JxLcKXYjs2WFlcaPAht+bRqiIInMJNlIFzUhfxbGWotLloTzI1oo5lgZzqid?=
 =?us-ascii?Q?wSHQq9SVyVMwyOs/rG1dcB++Ggunlx5Od3jGRyEddag6C8m6c9awxK5AXHbK?=
 =?us-ascii?Q?wGlwGKDaldM61KOVSsSQnqp+sELv3xmaRPM2OhHBUhpKFmZJ4XD+8cRvmaWc?=
 =?us-ascii?Q?2FcXRY0epJpmGA1ka83VfffPKBzioveBRxCxT4e0xdNhfLJvBAykCRyrF09d?=
 =?us-ascii?Q?wrh5JBtCQSTSdpJfQlFTq9wH7+7tC/gJ2miOBWCX0MFWzIkfCTjKyX36qemY?=
 =?us-ascii?Q?IsR7mXXRqGRDT05AAiI07XrlzP3el/ulkSIHtywz05OgMNxk/Q8SqjBj9s1o?=
 =?us-ascii?Q?gc5b4D0SGpDxcxXEwH9DxqOfJuqakiyNkwF41kfsNqbHY4TlzoWuugjdvreW?=
 =?us-ascii?Q?vkwGqbQ//4M+m3hGkjGmtx0TRkvDOJIgyPn6bd3Zwto9G4zDQQgQy7D0egQf?=
 =?us-ascii?Q?D3GA9s1qJnGE+O90za2c5yw4LDvbKZUXrumPf942EhOl4x2qhz5HStfPa+D/?=
 =?us-ascii?Q?eDeWx1mbsKW/Pwsh/GzOPdiMyBrqenYOl1znrodJFUQdGEciWug/bJZNqKwU?=
 =?us-ascii?Q?Up0E4E9xfHxL/zJPsbcDXDTbFS/glxxEAmg+ulvXQIxPiCtSthlfiNaI/VL2?=
 =?us-ascii?Q?NKxPTI7Al3YHM+X4q2ZfTNk4SQ6Jbkt4hh7t2MDwT6RSjKKb4TL0pPzTa7Kb?=
 =?us-ascii?Q?QmaXw/bxbyg9x+GibB9ZuFmjtOR+EzEX9PQxqF94tmhY1jJqdu+RbZseE7IM?=
 =?us-ascii?Q?6qtWAY3lz5Q4xkFjViF0y8nu39KeTuvQUYutQYu+PBKRj5yDxMoe8H9PSmLa?=
 =?us-ascii?Q?Euk3wk99Y6r6DIakEHlfPBrVwnvtZL7NDzTDKefX02/RqfFy1BGzhVCEC+oE?=
 =?us-ascii?Q?2Vcnwc4V6/sPA3NBpQLjEbebdg2xgv6FO4/0/XPQypZGDsm7ERxZyvyEWgy/?=
 =?us-ascii?Q?j9lwSiYAzKfCpoFHrOmq0IwdwQjrO6EW4JGLyNbSQfmnjjXbSFp7utChsnRF?=
 =?us-ascii?Q?UTWsFMkUFfZicNwmn4SKm8AM2caPPLy+2mKiJ1lRlGfd0QAf5RMf/WVhW7tI?=
 =?us-ascii?Q?09wgCysaER7tNtk+LiU90Be0Bh5zyL7guXZFsq6TsvLEhhGoDTLQzLupqwYB?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UhLvHAMk7AD5Py4q7IoTXPpu7TAHspGl+QVGN2fykXZfWQO3ChinV7f9/F+mUWo4pdAjiutL3W9xbKU4dTgnMiN7AmNwqcKQXSZpMU4TCT7II7JXydukPoYML+R6kzkc54x97frqd2fEeO8onB6Vygc0COzZTS1mZ0BsQqTrfauli9879a6NNWtKCcbH0BA1r8y1lvYd9bZZ+9CtSnF00CrSjkzAt7OqeasupJ3qEP0xZ9AUU7oUWKFCuopvP+crSyuXl2XjTsiQUY1mkU+3VyX8UM0o6DzhP1TpqLVjokiV0cZJffWFXRKS/ViREvq1xOlgQ5I8q2zFSFVbCdYPDphDfocpQZUJy+elTk3uYyP1hGIv8yIaXDzrESrzc0tqkIydJp5JcYrv+/YpMn+3bXyV6aQHkd8rvIHQ6EiHA6DRxQv+nC+wQGSCTmG6ZC+E+QgNuoqoHphDyvfi82la5gctpxMkmcrRz74NbWaHy3ZZ9rhAsryOVNyYzutqzMLCAGtIfy874R9a/3IsMUANKlhX9IxaRRZZa2abIZUpzWMkT13Vyi2iG4Jv7z8CfHvk/P1phSgCBNsDXJIOF3aI1NjCU3qEjhPmPxLJo/ByAC8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e47131-ea3e-4d78-652d-08dd8c8c26b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:52:53.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kFYsxB7Y7WQfUHNHNJtiPmJ7ZKGYYae2k9liur7mwijPvFvT0CI/Ia4YBjwKs6W51kssVybHUgiyt92hKY+/9BVtZgCi91D1uenr9NxGNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 spamscore=1 bulkscore=0 mlxlogscore=183
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=1 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwNiBTYWx0ZWRfXxSWZlceBstr6 M9irKleMI0+NDCW6l88tDwkGozD6CBAAuZinoMIOqgy5RnfJ5CpMvVKDkHGPaAV1EK8CFLV2AUu p6A3QJlyJgbG4EAIfoV45Aj8lCQ/ymhGo3gdgpMD1SvhtEBXVucbCr4Gs/dUCnCISalgKEy71kb
 IqHVZKDJSLF5SVP73zb6dM1cGwBEPFVhc4r+/5IyqbkL/A4e1+oOp8l0YBfzz2R+jWSrPGR9230 b8V8FJaQfVz56lyTmZHmSJ65PVS/xlaWC77AaTVlEoc5FcqZpXf0vn/xtIzcSaORzD2pu/16Arj o7GtoAEtFZjzqlBAKLm/qRN165pHapu9xXTRRYfFrplw2CsWx6h8DwcLG14vy4fKFlPPgVpekTw
 VgRAeAhfP3PoaDtat7W1KvLBQHVRVL8QLn+9gKwMwgrVGzZj7zNIBZGJSWkUinOKfiPdy45z
X-Authority-Analysis: v=2.4 cv=HsN2G1TS c=1 sm=1 tr=0 ts=6819ec0c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=zbFZV_eTRfgqBz0VDosA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: UB85JYhw4kSFvszbkGthq1fxg9vxal2p
X-Proofpoint-ORIG-GUID: UB85JYhw4kSFvszbkGthq1fxg9vxal2p

On Tue, May 06, 2025 at 10:30:54AM +0530, Dev Jain wrote:
> Avoid confusion between pte_t* and pte_t data types by appending pointer
> type variables by p. No functional change.

NIT: 'appending'->'suffixing' and 'by p' -> with p'.

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

This looks generally fine, could you fix the nit below however... sorry to
be a pain!

Thanks!

> ---
>  mm/mremap.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84..1a08a7c3b92f 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	struct vm_area_struct *vma = pmc->old;
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
> -	pte_t *old_pte, *new_pte, pte;
> +	pte_t *old_ptep, *new_ptep, pte;

While we're at it, can we please move the pte decl to a new line? Mixing
pointers and non-pointers is not great (I refactored it but mremap still
has a bunch of less-than-ideal stuff in it :)

>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -211,8 +211,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	 * We don't have to worry about the ordering of src and dst
>  	 * pte locks because exclusive mmap_lock prevents deadlock.
>  	 */
> -	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> -	if (!old_pte) {
> +	old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> +	if (!old_ptep) {
>  		err = -EAGAIN;
>  		goto out;
>  	}
> @@ -223,10 +223,10 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	 * mmap_lock, so this new_pte page is stable, so there is no need to get
>  	 * pmdval and do pmd_same() check.
>  	 */
> -	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
> +	new_ptep = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
>  					   &new_ptl);
> -	if (!new_pte) {
> -		pte_unmap_unlock(old_pte, old_ptl);
> +	if (!new_ptep) {
> +		pte_unmap_unlock(old_ptep, old_ptl);
>  		err = -EAGAIN;
>  		goto out;
>  	}
> @@ -235,12 +235,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>
> -	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
> -				   new_pte++, new_addr += PAGE_SIZE) {
> -		if (pte_none(ptep_get(old_pte)))
> +	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> +				   new_ptep++, new_addr += PAGE_SIZE) {
> +		if (pte_none(ptep_get(old_ptep)))
>  			continue;
>
> -		pte = ptep_get_and_clear(mm, old_addr, old_pte);
> +		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -258,7 +258,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		pte = move_soft_dirty_pte(pte);
>
>  		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -			pte_clear(mm, new_addr, new_pte);
> +			pte_clear(mm, new_addr, new_ptep);
>  		else {
>  			if (need_clear_uffd_wp) {
>  				if (pte_present(pte))
> @@ -266,7 +266,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_pte, pte);
> +			set_pte_at(mm, new_addr, new_ptep, pte);
>  		}
>  	}
>
> @@ -275,8 +275,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		flush_tlb_range(vma, old_end - len, old_end);
>  	if (new_ptl != old_ptl)
>  		spin_unlock(new_ptl);
> -	pte_unmap(new_pte - 1);
> -	pte_unmap_unlock(old_pte - 1, old_ptl);
> +	pte_unmap(new_ptep - 1);
> +	pte_unmap_unlock(old_ptep - 1, old_ptl);
>  out:
>  	if (pmc->need_rmap_locks)
>  		drop_rmap_locks(vma);
> --
> 2.30.2
>
