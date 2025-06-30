Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFB28C02C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290065; cv=fail; b=YyW1XWeseQWnuY3hUsrGj5WbhvOUzddSTg/Iqha7w/QOMeXHGLhDkqTOO01L7gjv0psI2IH8qAjzJKl3XLCxsDcpSAh80O3SCNP9HFLqMJfJmYb1C80Fhn3e2RUApn6MXPjwsKCQv+SkQ4mlQyUTlQCtl7xmk2SGtquFJOgcrx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290065; c=relaxed/simple;
	bh=F4wcC7NZthyKNXnh6TM7RO43uqN0SLzFXMsMeNwsWis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T1xa/uSZOU7gLbGDJv7OXSighg+9zW1gnwoxkE94qpVaORbautW6RcUr2wp0UcbogTSBaiFTDy4HXGsmO6pywoGJkppSF505Z9peFUXns0s5h01KworpDekuffpGOoi1I7zaAWn5Qmn22s4EnKAPphcS2v9f4mV9445RvWaC9vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S/vW8ckM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H9yl673a; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S/vW8ckM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H9yl673a"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UDBmuV007439;
	Mon, 30 Jun 2025 13:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HJPT+grRklxfY2pI8x
	Ukluf7079U8fvC3qiQVTuY3Xs=; b=S/vW8ckMyumbkoXCcmhr71B90/dMJzCC7k
	HI7md5p618wEmgKevKIuSxPo3+tSDXFsw6M/yYNQK48CJNJM/543Pp5ujfS6RYmr
	rdpX+QS54owdvepk3K2UgYwu/0JUw15CtufcZHlUul9hd4sNsLlB87qw7EIjOQXL
	ycT1TtdsGwKOP9zaOySgPIhw1tASj5Rfr8LM+YNbbiKrnmtV98Xcp/ieJcyM/xFO
	tiBBaPp+QyAGAo9GxC/xS67ho5RttmPDVXHOYkhecO60YpMIgnOClMEUc7f//Rlp
	8Ckbw5ZPqzvmLsW0NjfP4UYJJAxe20XHPp8eY7+p/b7Oq9cjQf1Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx2f6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 13:27:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UCE8Wm025747;
	Mon, 30 Jun 2025 13:27:13 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u8b48f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 13:27:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5bjCkO0X5GR0XIi3AyofBrL1mbBd2M3i7Dyzv94z2DDK/ScPjVDJPGQRZQLJmMCErFmn2TUtbCpvP3koL/1fl08crlCsk3F/3Pl7CMrXkfYz6quMFme8X60RfeTJb2ZuYIivoBLcYsyZgwhanVO+aVMsyOlrKQy5KXOKoQkE3x7GO58zjrvAZYoiP2T3vZuuVPQqJznT7CekuxKxCpVipyTDFj+Jt5mixVEpil+mVHVseM5Wone5oB1aatbYCTBloRt3KUkQ85LxtJWXwfgXgY2tBks6CUhCI2Lxdt0BYncee8gx4xJg5Uf74/owTK7qCMQIHuyyd7mfLe1PWFJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJPT+grRklxfY2pI8xUkluf7079U8fvC3qiQVTuY3Xs=;
 b=K5dLXrMiJ8y7iUtu9Mtfnu4spWhrzOfUy/vExwhgOf1rgur17YdN+P1jREyrsYULuJsXsj68SBD7ECVkRg9fjhTZG2LArg+o65M9u7/N9W0xO+rdJzE7U69fKoIbYvZdxwrV6149iEhjZKwRzgql3gSymOSUc5j9q96zskMmeYz0BZBAW4zedD0b28c8UeLxAqdp9GX4CZB+hOBi+IKzDTw4nao0hNbgGT2LOGmjU3oupFjiMeY2q1INUWUJSJJ4Hx/pta4Ra3v95aRR8/b4AqnHtZxoSo1SkmtE0XJ4grobrA4hSyMAhpFcpx7oSDI9J3eIUKe/NLUC+MigL5ehAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJPT+grRklxfY2pI8xUkluf7079U8fvC3qiQVTuY3Xs=;
 b=H9yl673a1diW0W5A3qc5lXMKPGAhcR3n1s30VGOu7D02wL2U0PMx48FC4tXJJhmaXfRFq4KCnMSDsCKo7R9ZzLg8NupDVwu3wZ//u8Ou9MqvYSx7WziUaZsAtoXDfMwj1mA3WJUw/nVgL0bklfVVN/LgFKTQIDmxcy5CDTp4W/I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF2BB505D96.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::796) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 30 Jun
 2025 13:27:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 13:27:11 +0000
Date: Mon, 30 Jun 2025 14:27:08 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration
 and khugepaged
Message-ID: <e05103e1-3cdc-4271-b78f-84299d1a4efe@lucifer.local>
References: <20250630044837.4675-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630044837.4675-1-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF2BB505D96:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d99ff7-aaa2-4ada-b0a3-08ddb7d9d1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sNDhIipG/80qWvrJExJss0Eln1Il3jBAwmN1ie9Y2flqfNlywknov2Ti0/Ak?=
 =?us-ascii?Q?mbBhKj7P3vvRlmExWio2qTbN7Ps0hP2+AbfwVZKfDjh9nA3k8PLK4apBipbi?=
 =?us-ascii?Q?ngX774nKjpkjvnw4CPTMt/uVSSyPfrcb6rsI1NPWagxxXbCCnVOvkiB2Nx1Q?=
 =?us-ascii?Q?95eS4ozlxaCdEfHvvi1WeiYulI/tMaFQg0fFi/N8dGHTZ8z9ExAcNCk3FVrs?=
 =?us-ascii?Q?pmK5ieIn5nU80DR0xoUKc2BHIU19uDbK7mtMcIFK6GNBqtEeAwZTNWv/5PuI?=
 =?us-ascii?Q?6MuVqx8NTLSvXWoJLF4xpTAWrOgx2NG6zZlSvzDz9nDkrCfZFtCBJkom74KL?=
 =?us-ascii?Q?uu2dr6oLkBUKAPxEwLOis9x6I0Mhxy8+GQJsur/p1Y5c7v2eYUnvzjQnf/mB?=
 =?us-ascii?Q?0KvaAMWw1jK5Oi02xRnnAxYIoImGF+qpm9s3FjKv9Jsj2+mddDPRuvhrDrge?=
 =?us-ascii?Q?wdlmI7l86kaR+b32Q8BvDFnflNI/1f+Ni5U1EeutTO+ZwRSjFX8kewrwlT4+?=
 =?us-ascii?Q?nQoS39abhEvJ/4/FYcyb5+Q3pki3eFfB9TX07jUhqKI6x/Rum3R0uc9ccs6X?=
 =?us-ascii?Q?qD/EH7HsA/QOyARq0kKgSXM32eWIpkdGgqUBOtZovrp9+7sZLrPg6vwQK/aZ?=
 =?us-ascii?Q?CpMtzA8vvxETsE0nXQU69szZkWDSew4nf95GZxc1UGHFUTCfSHHSQuknc2Cy?=
 =?us-ascii?Q?XVw4yMx8zx7gmmVv9qKav8212phBqE8VPS/8YPz89nfrDd6S6N1fsU9UPnNw?=
 =?us-ascii?Q?MLARQDP2K6khGOBpQ2EQeCkEt5nw/OpqIAiyRfXmuXBt/9UvcogqqITle1IS?=
 =?us-ascii?Q?5lhh+Xzb8LGWNi4XTtJn/MrKoML6J8IxzXmKhluVpFkqyVgh1cXLPM2LbxJG?=
 =?us-ascii?Q?qMl49/24ADuLperZFOy+laPRtWAbTVq3XuX5zA7tMlbTpU88tUZUldgFwOv8?=
 =?us-ascii?Q?ltg0uB9nTJ/XMHV1An6ExhOVnyaaJMv496La8KORj65NhuH1kidYomp40iFd?=
 =?us-ascii?Q?QJt04OUhVHri/Y1CekvDmtHVbzJ70fB9ElBu4hq+Yezgg+ZVOI5vJCQCsnZF?=
 =?us-ascii?Q?mQtbKqKLSiy3inDOc4OTjCAmO22cEx6oHJVMfg+KbJDJwuJvaJVR1SNQxA0U?=
 =?us-ascii?Q?S/p2BTfgOFwfBsnNghj7mHDMm+NiPZ+FRxe/sG+vqVPkvnGDMWgBK9ts6w56?=
 =?us-ascii?Q?muHzlD4XynsiTsJjBGUW9Ju5A7qlVt0BKYH4WaSbNeT3MY80aQas2WOjqtDF?=
 =?us-ascii?Q?HQ8wx5p5DIVbxZkwUbPsRSM3z003Xwd7wUfIJk1jOIxCZep8oYdmUidqpWH7?=
 =?us-ascii?Q?o3Hi6B7OQNnC+g8ZrrEdKHJONeBahlwxHh4SPYqgtZKh+tE4iRz8XWHTjRm9?=
 =?us-ascii?Q?anenk0Y3XHP98W5H6zHGFpwXU/4s/Rzli4tGHs/JSwR27RPBhAufwI1W2oXi?=
 =?us-ascii?Q?MrULlfYucYU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6OvsafHVqhK5URqlXeSBLdXg+5l6HKpIz7GRGWIMhj9hy7wopadomKBdmr1q?=
 =?us-ascii?Q?Ma0cMbrWNA97zyAGVQlnJFGhJG0sJxWdHQ6C4sBMVGl3zKXxjldddiY0Li3l?=
 =?us-ascii?Q?G82vOmuDObJSJIYF9hNxa9FwKQ8K+5OwDZmtKs3IplH9PYhT89r95HdbarvZ?=
 =?us-ascii?Q?SJ5p2XQVr7W7xoJA57WIt9qJ46uScdejzyXOP/mvoVnvIhsDkbF3o4atioYo?=
 =?us-ascii?Q?saHLbywxgRrEJTyHuS5KETpclsL3WJCU3rYNHXohE+LlvPyn29fv3NSQugtD?=
 =?us-ascii?Q?2FWzuzCFcXqIwFrzw54YAZtme2P6U299/9TvBaic1PApXw9U8/MKIZBkJFw/?=
 =?us-ascii?Q?28PkLLuBD8ewgdyMUoJkflEGti3VfjfGib3k4IA4CcCWwyikI0Hi6XAHGaPC?=
 =?us-ascii?Q?Zz/r7YGTug6opURNZqW6lYzX/LITX8kBiGbSR/ojOn7niHfaFw9ICA27OS8k?=
 =?us-ascii?Q?Q7sIj73nq6BTgLYbH1oBsh7WcKpj3FZFcirHEPeFqHJ6AacRgWX5P673bcpW?=
 =?us-ascii?Q?/EGvtfKMADE1afVzTqWfxnzFh2dV2kjCiNoAv139NVuvRF4duHLCoV+ADknQ?=
 =?us-ascii?Q?an3avnH8dxHTliZA9r7x0x/VqZ98gCSzAJJSyrhza3Dut9lvO2/w2c+ZndhP?=
 =?us-ascii?Q?Lw62VUzJ9p6e7xEaPHmQLLzF2BrqUByDUEUSpui/KYYcmG3ZXkm3gbC32H4I?=
 =?us-ascii?Q?Nj7UWSz1r/Z62SdOSrIE/4WbelekYABtXsZZNHFRMEdGwG2hUu1ZGflgz7HI?=
 =?us-ascii?Q?u+21GIhlFiOxxjRCUw9wl80eK4uLVSsCyTo8ihCTP3pMJ47EUMCCTryhoqxM?=
 =?us-ascii?Q?pUE+vFhTu+assiUno0y94eP3tXJbJOGouWElElv/8Wq8g7n1F1SRVpqQpFZ6?=
 =?us-ascii?Q?wDXP+nuO9GSskqJn+mJF5DxFRqs1bmjPA2+KHCyp3eYD6ZH2UDSp45fqz5wC?=
 =?us-ascii?Q?4jYnfxu72MeazST1Egm3A4c61GLY+3YUjXI4zerAFxT6vYKB5Pf90ANG1ZTg?=
 =?us-ascii?Q?tmOCsgm6izMTnB823NGatdR4XfVSMNtfUwHBeGHl9N6zu8gDO/vAYjpYSKSf?=
 =?us-ascii?Q?y3WbipknVpRhr8tGwUc2c7w3Qo4Geg6hHrFzjiQY41sYQ1rTR1ebZKhBh/jp?=
 =?us-ascii?Q?8P966WPp+AGub5l55EjBlHpUgT2UuRQA25YrbRWea8VxdZ4UTh1UGtXG+DQx?=
 =?us-ascii?Q?TQhVFOgano+ggeypdfmqu+eG1D2gc5eiiASZ34KD40dez9ke/OBTLEatUc9X?=
 =?us-ascii?Q?yB2FXxEf643nZThlLLHjg3HTPxmsv6aUZ6xTptvehTY9n6pjfLbzWgYHkzdX?=
 =?us-ascii?Q?KtGJibD2erfcARcYL0aC6Bv3IflcahRhVGC2s1oKMF9o/lGBK3lVR3uv/zsm?=
 =?us-ascii?Q?J221ITJoh0/Yv03n6tDtqZppeWOKIQaF1nSnYpk5sOseGhoHkoxYUk/t0Dde?=
 =?us-ascii?Q?JchxjUs+Hyr/9AJeJ4cJlH1ZMWcW7HGxxHXh65BX99RUbFcvn1fCj1TN6ISB?=
 =?us-ascii?Q?D/+bMin2K/Ka7ewgfBqCwJLndn1CrnX+hIp7d1RVf0NtMFYxyXVPU4AwiHdn?=
 =?us-ascii?Q?8ZV9YSHkes1AGZJ7RlkM+lM2BGmRY4f0t/f1lXC8enk06gS5Uh+b5aEAmQJr?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eejf7UvyJdlsVjqKjoWaHV63uH0Tpxe4TrhDT4eM1bkTSStNTrdqyeZl4ls+qykAHPJ9rDA2T/2YEzsp1S74v7GI7DaK9DM24mci2jN0/vz9QWgxAmoxi3t0w80YP1kVLEcAtR7Eo7RMzeUv2Gn3zWM1KWS5MX1Bd3KelUJ3oxrUQujr70/4BOM9OnOp1y24qmRySbcw66AP+MNT2F6i8qUsmyZhxlE5lICI2vmQXQ0xFEjJFerjehEGVuPKIto6agjTv8B71lQaq9W1f92eIgFmeVK9zOaMzvqeVFu/jWM6XoBg9NW4tpXZNr2i3NNFIohQEshfiGaYwU6ez3pjiwwU7ByCNNF1a8NvW1AiIz6kpW98QtwyNYQJjFnvYoTjyMGFm4FGSNGC+QUIx/1/9d+jlL91iKojXNzwBk7meJD0E/VPQuVRvAx/aYdZ8jxtuj4Y0lgeljwkaJObty68TU+CumWrZK0HZrYPdHUTt7ZHCRoJ7HV271710i8hNaUaChw+06Xn1Zp9n7rbzRVfT39E4U2YfnAHhnrbZLQ2dPCAawXFKkbdhTgnNA2c1DlGl+oc82ZrImNO/6Nk68n+c9kt+gr0lBbJHlDg5EfIw1M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d99ff7-aaa2-4ada-b0a3-08ddb7d9d1c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:27:11.2324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNy3bUJ1N7pRnrJsYjGLoZ6itnksspS73HCZ6Y5hZOSWGKcT0fRIT7LNpVfJKsygLrA4YjkJ+KCo51vW1rFFRDz0MwxjsfN+5iTtSgc0fVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2BB505D96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=826 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExMCBTYWx0ZWRfX7iA+siXOtzJn 0by/1SkHQck6WSUQ5EGMyzLslfXfVcGmGmvpkIM2P3WW28PuS2ogQmAn6IJRruJ7BRw/SXiKmvg S2VlY0kJjFXWv3GusmCFQT9Rgn/nRFS2svh74s3EEyXvGpQHck93MWqK4q/w8n4R5rhodHTS8Z7
 z5ZdG5Vn6rnqJhjq6ZlrRNeGFyOUVlcrnX9Nfp3MkCemDu6TlhJG/XBnd+3/H2miS1A897l1HwB HCqKSaYEPf/ehCEFyQF4QBGoomXWTzp0I4q3mKN7nTP9SQ5EL+haGKh8Qgl5yWDx6qmddk3k+z5 TVmFARUd2wnqAaGyZsJ5TN4eM+QD8SSHIRJfwmsZqEDGD/2P9jnsuK9ZWJUehI9WdKfeXUa4kRL
 AsXetW05KSgQ3yz5x+ogZ4AIYt+GVN0X5YCoBYfviZT0cCDKVqtLmOCxr87DNlQuMctOQ4DT
X-Proofpoint-ORIG-GUID: c46Tg_qd9blQvCnmIZZf7nHatCn6UWrP
X-Proofpoint-GUID: c46Tg_qd9blQvCnmIZZf7nHatCn6UWrP
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=686290b2 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=UJl2IDr5niIEQQ4vw0QA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22

On Mon, Jun 30, 2025 at 10:18:37AM +0530, Dev Jain wrote:
> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.

This is a nice find!

>
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>
> Note that, this is not a "fix" since it only reduces the chance of
> interference of khugepaged with migration, wherein both the kernel
> functionalities are deemed "best-effort".

Thanks for separating this out, appreciated!

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>
> This patch was part of
> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
> but I have sent it separately on suggestion of Lorenzo, and also because
> I plan to send the first two patches after David Hildenbrand's
> folio_pte_batch series gets merged.
>
>  mm/khugepaged.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1aa7ca67c756..99977bb9bf6a 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -31,6 +31,7 @@ enum scan_result {
>  	SCAN_FAIL,
>  	SCAN_SUCCEED,
>  	SCAN_PMD_NULL,
> +	SCAN_PMD_MIGRATION,
>  	SCAN_PMD_NONE,
>  	SCAN_PMD_MAPPED,
>  	SCAN_EXCEED_NONE_PTE,
> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>
>  	if (pmd_none(pmde))
>  		return SCAN_PMD_NONE;
> +	if (is_pmd_migration_entry(pmde))
> +		return SCAN_PMD_MIGRATION;

With David's suggestions I guess this boils down to simply adding this line.

Could we add a quick comment to explain why here?

Thanks!

>  	if (!pmd_present(pmde))
>  		return SCAN_PMD_NULL;
>  	if (pmd_trans_huge(pmde))
> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  	    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>  		return SCAN_VMA_CHECK;
>
> -	/* Fast check before locking page if already PMD-mapped */
> +	/*
> +	 * Fast check before locking folio if already PMD-mapped, or if the
> +	 * folio is under migration
> +	 */
>  	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
> -	if (result == SCAN_PMD_MAPPED)
> +	if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>  		return result;
>
>  	/*
> @@ -2716,6 +2722,7 @@ static int madvise_collapse_errno(enum scan_result r)
>  	case SCAN_PAGE_LRU:
>  	case SCAN_DEL_PAGE_LRU:
>  	case SCAN_PAGE_FILLED:
> +	case SCAN_PMD_MIGRATION:
>  		return -EAGAIN;
>  	/*
>  	 * Other: Trying again likely not to succeed / error intrinsic to
> @@ -2802,6 +2809,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>  			goto handle_result;
>  		/* Whitelisted set of results where continuing OK */
>  		case SCAN_PMD_NULL:
> +		case SCAN_PMD_MIGRATION:
>  		case SCAN_PTE_NON_PRESENT:
>  		case SCAN_PTE_UFFD_WP:
>  		case SCAN_PAGE_RO:
> --
> 2.30.2
>
