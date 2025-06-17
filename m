Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A622EFD83
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750191054; cv=fail; b=k8RBhiR3GTs7tginM/Xnj9yGHA8lXlT+96IoQGrnXlgagFGN8qJhIp50Ri8KZKgvESZ1D57XwepsgWXdLWvx+G5AVrsKGeJ/PNLTqN33YpP7GQh84sv00RplKmF8tEvvdfJATTWhbXTzPB+SqfqGEBL3UA/YW49BIWlXPCiGt3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750191054; c=relaxed/simple;
	bh=UopyifF1Cxn7kg8HlK+AwXv6x52bc/zZvc8ApP0hDr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qC4WN4M0tWX6xzquiGQt+MFbkzlVKuyPEfZW4dMMZmfsbOIn2w9oWhx7kpkk9pEuEJc9GiSCS6DKE5KVqmiFCJcu66yckpNcSvJuX9/AHUjak0+QGYECqUDkBGUSUrg6CkQauXvTRBpIVTKcBVa1TgWM4XErfHiDrWbAuRczxs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XLfdLj2X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CqtvpSID; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XLfdLj2X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CqtvpSID"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHtete023704;
	Tue, 17 Jun 2025 20:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ho+lSwN7/Ixy7Zra9I
	rNb2Xn6MYweXSBucvje6i8428=; b=XLfdLj2XXxuNsnwCrgXsRoKLbRiGPX/YlG
	Ptj0//8s7k/S2LPJdkB7V8MRrtFVnsIqSjUKh5yxVrgQC4YMbKEBdIBBeSX6ztvq
	IrWPKdWOf0Wjc22v9TyTH+WaJLN/NKOw8T5IYZd6sIwMRZM+tTUSXigDgHh71s7N
	+vkncfvFvDaMn5K9q/V9zfb9rHrZt7LDVgj9vcBySuQCerYdL0K+qDVjaXGefyA0
	v4deTEJObd0OK6eDFHP2JDJoSWN1FvcIthWBmQmqHv3qtMLtpze8ECJMf7InfNki
	+quk7wp3tkL3DxNsbESlKeiBcCG8nzBeY+Mtx6x7lQTvj2NmLMmg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv5696h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 20:10:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HIkBqD025944;
	Tue, 17 Jun 2025 20:10:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhg08ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 20:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxyG20Bj4G04gLr8JbD35xdSqftEzRaqq9staWtPwYHn1stcwuchqQxIknElnYOqaaaTa99K2LlClgJAMf0x0df3OY0YNX/7T3uC/WF+AT/mItxwxqJQ34xRJ+V1BUam+X9vzU6B5y9eQxohOpa0aJdQ/PZhQ4g1b97jJTIjlsFADvKPmdbFPVyQU1RYR+YSXnozTI+CjfTUBo3RfM/4LZAg79vZ7TarVI2mAPMu0TwF3EyLx/fcJDz0XT8dCRRELnMDbB6f25RbAwCZS8BTjihAlNNgc+4GydDlYraGvKUGb0GIX/H4JJLdPEwb5ysprxSwBYRz3GLRO7dLMTy8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho+lSwN7/Ixy7Zra9IrNb2Xn6MYweXSBucvje6i8428=;
 b=O22hWBO+gJW2NDfXbnMwkIOvXmpArOcKpMIbehCO7Qj0zyl+3pSZOcPwyu3XZUv75XMZ9mKMteBtYpfS8Co8cXpVPTpwvZvK0+MwEaMflr0wnVUiYanlHfXv44/v58K4Avy4vasbvhUsYSbEi5us9SSLWqceyiQcL/Ux/yGAQttHOOEonEhP7k0FX/OZXd5FXHJ5lE/Ia2Ey330/92D4JOpRcd7PzVH+ZiHegVoGiN7nYT8PkFd+uaHrXQcKFtN9Q5iEXTw8A26NkSrLMfiRzUc7Xn+W/6lTXBTBiFVbS/YAuruZMlY1zji2g9/Kz6Ag7xFRnNllm8HtIXkIOH50zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho+lSwN7/Ixy7Zra9IrNb2Xn6MYweXSBucvje6i8428=;
 b=CqtvpSIDxEP+EY9nOJTXeYhPMoTLnI1d5+Qdfg8I52RxqnBY6RJRGK+MhEkunS0MpMNmZcaj8GN1Cg6V5dEkzkwP+kY0DJA/8p1Um1tXi1HkONkMIPyNyt7hKZ8vM+HuGEen+qlJ+NVkoc01DEgaN7pOtT03Z1n3M9kA+bsPyqc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB6865.namprd10.prod.outlook.com (2603:10b6:208:435::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:09:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 20:09:58 +0000
Date: Tue, 17 Jun 2025 21:09:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <46f4db0a-4b84-45b9-8b23-bb81493f776d@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a682d7-6009-4866-8d55-08ddaddaeefa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aSCbucnRLycRUdAkH5h5bn+aXb6yhg1/cwoIJ/BADHKU/u2VJDuxpdhmcaqY?=
 =?us-ascii?Q?YkMTOu7OotHnuWSf8ufDgQQ4K2+h9FR2F/VezJa1qzWua8Tuyd0mni0YmWTq?=
 =?us-ascii?Q?KhOkh0lV3ceLUMbOvE4HukyGQE8GvfBYOLH5aG759g9i/UGDrMheSc+NvUVw?=
 =?us-ascii?Q?au4gWFfB25V+WTu1SOCXIDWXC2jB2/jSWlbUIngVB8BhjorRCqmFu5aGjAJP?=
 =?us-ascii?Q?4SsYNFMFZUOQp7Yl8s6Q9vaLnVA2kVqUC0ZOni1pcMrWQfNk2pXn6a+I1szS?=
 =?us-ascii?Q?xui6FZk/Lzz0JUu631y+2s4wgakSNEfBAUWSZeDO83nkJrJzd1isDhiRrb2K?=
 =?us-ascii?Q?8aDq+WHx94BOW13sRRhjinwtrcFB56yjCKFjPekjLsgxQuD0jnjbmZtzjLuR?=
 =?us-ascii?Q?fzOtX5RAo+NpE2XWcJkEbvZ0JtcidOUQi1ifuoDuMyqzNOyhYQ6gaKivNMjJ?=
 =?us-ascii?Q?9Yi+YO9r39coeid4zmVfOyT02BN1TS401oTekUeUtyLernugO6PUdg5tQ8WN?=
 =?us-ascii?Q?+YBDPiD0BG4LbX29nIMAnluGfOpq2HIF0UZ6Ovds8tqWWYjqYhVg1o5ziYNU?=
 =?us-ascii?Q?lD/fvSjG+WY2VA+O3MNxLOYR903HzYkeDpu0dUYK9mjbuJyWiAnq8wnp0ruM?=
 =?us-ascii?Q?tYxtMdIfOHEOdPnfUWlLWQ3LHn0al9kr23OjSJAZ6kG0rcanaX5B6rFmlnbU?=
 =?us-ascii?Q?SOkM1Mmt+RFR40ckx9B1KlLEY1aor1N15jB98iyT8/MSHVQlOeRqmDMz3gfQ?=
 =?us-ascii?Q?HGqVpxCG6B7g12k6uRFxAouAbej/ACnoPgdPdhrx8zEgQh2Iyeb9fd+/CNOp?=
 =?us-ascii?Q?OSs45ZZuapwh0qCzj/zFh6HwJCK1pDOFMRMjKmdpBQEeifa8aateYsvy37WN?=
 =?us-ascii?Q?C7evoI9aERtD4uzygCV3n06T/hymglOqrYaXIrX4m3QKvJr7fgPTtDkn+IrX?=
 =?us-ascii?Q?m28JdeC0wqfzzuGKDj/UorZ+dP6vgnvdigvHQeeyTMaOYj7q9C9HEZ8QlGU+?=
 =?us-ascii?Q?ZBN7wYOhlXpgc+g1CnsachBbsf1swEbX3YUzhlg6qeyckZ/YMqsgEJnoPeHz?=
 =?us-ascii?Q?o0lU6/qlWYPWO+qpdVFzG17rYS6QTPX/JFyz0Pgkjz/ezF8A+lp91ad6Wwq7?=
 =?us-ascii?Q?nTF8Gi7wzM8Njr46jh1zF93BN7HsKI84YWn/3h5Q4oFf0yPgRp2LfXCJCWiP?=
 =?us-ascii?Q?KY8hOnqzbTi4sIFiqiygG4JLu7LECFgASOeCuZBhxAaxO93MBZStyAgDqNQU?=
 =?us-ascii?Q?CAXsuIskvjCC+1eGnaFXvLYKmZhd3m/AxWVEHXVJZsu6JJZR9scicFyTBVmj?=
 =?us-ascii?Q?zu8X0FWzIDDi5gJupvSDqSqCWlEPp4cCHdkAcG71gkNrhbTV9pkCUZDjfZC8?=
 =?us-ascii?Q?pyVsVIHr+uwjW/LcyiapkS137hKr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ymcukrqFf/UHpG78aGl2HW9klZ6IRjA4DBX2LT2dx3AuBrbO4p+Cabxv7Y1a?=
 =?us-ascii?Q?gOT4/AO8YXCASGrpU1mIH6KXeV065jlnzlXAfJmtyre6922/fZZAOMe6zL6A?=
 =?us-ascii?Q?kDzv5AzQnwnAQxpM3eK6TERCFjae2lcsrQwmDF9A98mV5jfH7q5Cimsjzy0q?=
 =?us-ascii?Q?Tx/qZhyGnxzoH1ajF6mzKkrSvb/SImh4azlWQjuAmwZAjMIIPLgrl7+D678u?=
 =?us-ascii?Q?z/kcw/PQKfsPHHBM8vAfxy7OwoU6It/vpljMnisXT4gtF05ONnCKnk/GfFJ7?=
 =?us-ascii?Q?1xjtUxOtv0bMj97op69+58wOUpzHdWA4V7zodU7fM7suS8kakbWP+tvRvbju?=
 =?us-ascii?Q?E4BC1znYljaGPgLAH48WUfksalO7mK4s6Qb+tSYjW8XxZnWtyvVVcaqhTDhG?=
 =?us-ascii?Q?Bl6Ud1yGSTKqrmKXjQSXXCev0ovWDuNTva4JsLmWgXcIi3FwJnDZulS7gQ/M?=
 =?us-ascii?Q?dFb8EOLxFtpYLQJsAPBXPSSm07EZ5HcAVIj2esZt5O4+SxZGwoD2/s5v5FiS?=
 =?us-ascii?Q?4SRzysEo+ZGroeqOLKfh8WXp1n8JozX8OZHuWXWgVUNGPpJ1LWeXt6qGNwHZ?=
 =?us-ascii?Q?GcxaXCGQGVkHt3LAXEjdsN3dwbAfwzkWRKDf7S99ZkNyOsH/46Rqwe8qQ+Se?=
 =?us-ascii?Q?XfE2vjC6s/tSNCoPe0leyhPYQNpy6ZoQTIraDZTjCqHaId8tMjSC8ew35i4Y?=
 =?us-ascii?Q?TBj24dOl5D5Wf0pbs4xI/+H+tqB3HTS5gBZRWrnRc50JT6SP77/G7jdlWFxI?=
 =?us-ascii?Q?8xuxaIPhdLeAVzJwmtmt6mXd/LX4gZO3j7vb+f2NqNXgYhpIUuleiH4KXlHV?=
 =?us-ascii?Q?xt4KjnJx7rAQ6Du/TwA1KZNAClxdJYMLS4J3nUolRLAq6B4poL6jrGahKaj+?=
 =?us-ascii?Q?T3VG0qCEDerSFVA3wNOKBdINq5akvkJsyt/tjZT74lRoNLvyZznh4yTcrerQ?=
 =?us-ascii?Q?5f6mX/Po8IHjI+OKYL9uHE3U77utgeMKD3k3bMFVxm1HIZi2W/OpoJYS0H0t?=
 =?us-ascii?Q?K8B5l23So2pWw1HR9nk7b1FBD8BQYnHAW+yGLDpRBrpNAh9+CenREZnd+IO8?=
 =?us-ascii?Q?IeU3sgPLMSNSzbghvhXCDzNskc65cSchX+rnMe+ljGG7JXKz78lUn9gGG7Ng?=
 =?us-ascii?Q?Q5jPwyECpEnffFRbOHHj6+QmKcj+sv6O8a0k5XyRqqoBUtkoVY/wtUEWxy7h?=
 =?us-ascii?Q?ENUIHbRkG1RdEVzTMiWtjERrJ731mxCVQ1+qNpvGWRHVZ5zfKt/56sAbfdFf?=
 =?us-ascii?Q?aIO7Ngru1nxd0knnZL+ehedC+elDqChgqvQBuJkKk3mHGewGCPkBWJ6+g63k?=
 =?us-ascii?Q?qnkSe28aa6zqPJXoGZhCcqgWHfhTvmD5Z94dh/nc5QDdPxjBzXhNyM7ws6bb?=
 =?us-ascii?Q?cOMvCDXmQIEMfcDy89fmyl09fEVdRlMGmXKCOPC/XSrdlJJey80LDkVVQ/fg?=
 =?us-ascii?Q?KZD/jqh0zUllwn/OfbBJAsvZ4SudIaTv/sGyytlZEPntXIoYhal2bvt3CGmI?=
 =?us-ascii?Q?w4OvA5/tojTZZi+Rr9QxaO+JqlNK7M+1cThPmus1BR5FTXOxUXfUgByeiEgn?=
 =?us-ascii?Q?uBmEgvNK5kpziWfy284nku8ehtYfLP+/P2UTw5Ak2atAq3lKGdyfZHPIercJ?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7es8ulqXJFkzP5C5SSIQ99KE9ZEyCi3UmEcwynh9vBZZfsOtaTtxiudr20WNEl0Dy3VxqeJHcdnwtwRzyRGE0N+28y6jXDuQCgUZ0ppFcncXEEQAko8aWfhV9kCqPlQoF92S2EcZ1RxfwY4fhPTmu9hzP+cWw4o/VP5V3GvVJuHNiR2UENFGFg43tDUdWgfj9x53fA1KxVX4vikVzUPF3yUHYmJK6XBd3b3Od8lcVAoPv3J+s5yb49hqUzH6I1J5XXxisChlpDKem7QxDkf4bV1ysz/QmstsqZT+ZWI25OA66e0xxzUrCWH21WO4CvQ70yva5H3r8/vib2CvuAUISjfkCKRGMjvkqBDcDzFzp6ZGtlp4moDWkJnJtD79Gr1huZogNjdGih4uxPkzgBD3UvcQPsxxWZKhOpev6p9VYRQSGBW9v2//XaeO5oJ+PqOyTGmcP+a79Vk9ki/eoySVcyvlU5kiPQgs3RjtaqTFtz7v3ExVwWEmc7D3fJXI/2pOFAY5qUdHpH92m3MeZtlaG9xkmRiuby6DOXSWG58Cdrh9SDedNSi0kcRuvDsHZPV6qqldyQji59NU8iLdrkFeCu5jhTDMg0xtwohuDoT5nCI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a682d7-6009-4866-8d55-08ddaddaeefa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:09:58.2439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lNruyrxRrxyjen7XXhjDosg+gkgeXAptAXBoALb1xBiWfammt38M8ICiHEIDOA66EPTy2jCfTxNqNzYBgsHH7PdF9TEY9mmlLjKJnunrlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE2MyBTYWx0ZWRfX6LuWZ+dPqZGs Tai8MAs7Hzi4S0o5Qf+MxzWs+vpIQC17I7Wb1s0Vof57cbu9NpbW+fvAxK9owNtInu0B4bstOJy W0VpnNyVMkFM1eVh82NtAo4WDo8QVRlYfhCOZX44bmtBg8ZSZteJNDrTOSdyIrnAts9swtZJeKK
 QA2MRUMqUVbR72bXc2xA7/6nJ9mnRCK2rHvWyNF9TMwZb9y4nWgSZxZalyMJo5tuiLrfBaBcpnc AzzKhSQp+CG4ihzLd0lyuDp1rijEHYTWTKRsEvbloI90s/80whupwtmRx4zuB9b9E9FZkpAfZcu suoXuSdukebVYJRzyMCziYZuYk2sMRa5Lc5Ui8tX1qc3RYHr2NitoEizrjOtQEwszRxevp117G4
 vYhRA8dNI4wAYx6d6KtyX99qipKx8CbSqI5B3lVt1WriBDlhhBDD9iPUgkLaS9x7PasvXoBV
X-Proofpoint-GUID: CBydUAE-i5zc6fa6ZrpUNjjppUhGt4cx
X-Proofpoint-ORIG-GUID: CBydUAE-i5zc6fa6ZrpUNjjppUhGt4cx
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=6851cb9b b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=zcilMpai_nAi3imjP_cA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

Hi Andrew, I enclose a fixpatch to address a couple issues here.

Obviously a lot of ongoing review but important to address known problems as we
go.

This address the two syzbot reports - one around folio locking in non-sleep
context due to PTE spinlock held [0] and the other around a lock misbalance due
to a coding error [1].

[0]: https://lore.kernel.org/all/aFEAPOozHsR1/PLI@ly-workstation/
[1]: https://lore.kernel.org/all/68512333.a70a0220.395abc.0205.GAE@google.com/

I will (almost certainly) find a better way to address [0], I have an idea
already, but will put in a respin at that point.

----8<----
From 1c0b878afb3c6f9cd8d8518df038182c560f4cc4 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 17 Jun 2025 20:56:25 +0100
Subject: [PATCH] fix syzbot reports

Use folio_trylock() to resolve
https://lore.kernel.org/all/aFEAPOozHsR1/PLI@ly-workstation/ and balance
lock/unlock in move_pgt_entry() to fix
https://lore.kernel.org/all/68512333.a70a0220.395abc.0205.GAE@google.com/

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/mremap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 2da064f8c898..a4ec69959fc7 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -601,12 +601,12 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,

 	if (!pmc->need_rmap_locks && should_take_rmap_locks(entry)) {
 		override_locks = true;
-
 		pmc->need_rmap_locks = true;
-		/* See comment in move_ptes() */
-		maybe_take_rmap_locks(pmc);
 	}

+	/* See comment in move_ptes() */
+	maybe_take_rmap_locks(pmc);
+
 	switch (entry) {
 	case NORMAL_PMD:
 		moved = move_normal_pmd(pmc, old_entry, new_entry);
@@ -824,7 +824,8 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	if (!folio)
 		return ret;

-	folio_lock(folio);
+	if (!folio_trylock(folio))
+		return 0;

 	/* No-op. */
 	if (!folio_test_anon(folio) || folio_test_ksm(folio))
--
2.49.0
