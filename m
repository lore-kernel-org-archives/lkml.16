Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156A25D8E1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029283; cv=fail; b=k7Vpg39fQRb0ZB7CkRfYJYOnIpBpsKTpf3k9gwIPaccXX/KVryQ24G8oLf/9xlNlVud9YmnKsc3qtURD06g2PewiWUzeRAzzuzmrzrfC0crEK/v8s/DFL1Ni3MCTJBMgLshkqkJexsTF5AzWvbHDobhCl9hA0BvLgvCrcsIpjM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029283; c=relaxed/simple;
	bh=cxU+iDWe9Nybj0mlcXrYnu8GHX4t/+aCFZBFHfgeVd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FIbTSNeCbDwHXy2xMlORuuFVHQYpO1DG4hn7/8edELaPSz1EpuB9YF36UwKyLMGK6SVhhGxkYe5RAcfGV+wXTdXCo3XBZ84OvgMgIFhImAPYyzMgykPXv8nL8J44ciUHodjIb5ED+pbaz/N4eN+xCGL8b7T4PLNWpQ18PPi4mTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qIz4bpok; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zWEDqVB9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qIz4bpok";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zWEDqVB9"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UFMuxV021230;
	Wed, 30 Apr 2025 16:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bhZcS0mY5t0vXPkHaw
	ovugr0tFkSnb5Va1xy57xyYxQ=; b=qIz4bpokCHY+byl5o4VEZpbl5I+tDZrrXy
	q2MmvVOXGmKjoRS1i0my+1/o/RoPwX0jnZrpgyCxGH0GyGRokKKRxVCy9Y2Bk4kz
	NmTixyiaogmL9HoyW1ccYW+1BitsmcDtJqhRWqobR9fXMbuSTM3kNKvSiiFGrQ5q
	2AQ1lpo4vaPfDw+y8oovNp5XfeHSHX3dltjcxEt1WwvKlL3LrBs//S5cJZfOgVmB
	ggdUb0LksZqUubUdf5pjzsV25Qb0kCoFp26EcYatw64QM7hOJ2lnXVeRGWWhtoHc
	6T1NuZwxCvLyc4B/7Vwm8J9ybTD11c/NJav75RwFMZVCCN6WwQHg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6um9j23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 16:07:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UFL3Dm011283;
	Wed, 30 Apr 2025 16:07:46 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012052.outbound.protection.outlook.com [40.93.20.52])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxc1mtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 16:07:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FITxVTKSHmUDjQzFq6/zND6eaYQUg3QWXXNXOA5wFz0WX9PXKRSMMEJH1PEGAP5IRrc/LD1iEpyC0Kiedeu/pM2KdtKenJwGC+PgXUb7bvcHq46RuRBvMmcD9LporwSS/1fj4nYmKMCNPxMYWQvkJyafKlv243onY+qVk4FAnN26if8qnkgVl/UnO2d22FDIljzcRLwoesYa+3VnTVBjGX4XoQ1lxU+/ZK0uqSxUcm5w47USFNQ5mhzaJ+5r1lTG68vHeM5ZayhEPwWcFRA8gvPL7fyRku2lNUMHqzzFiNFRD1Zc/qPCqx63KPHnCbEQsHN8UQx6ZWdtBUMOJhJmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhZcS0mY5t0vXPkHawovugr0tFkSnb5Va1xy57xyYxQ=;
 b=bObDammJevumrkDjBOYMoWI0OTi+H7URopamvdzahBIJlqZ1idV4usdn7LQ3JWuBgOs+3HpWSHvXkBSZnjYtHOmYGQtapR2SMCO+G8iYg825abYwjhUkFn02l4fSEt/i1FEdf7AebSmpENMMyW+3ue8Sgz2HvuOJfMVAiFVnPPd/8R8c2nZzRqFqAKTajizArO3DaYQN9eMIB6SPHjJ58Oc8doEEhgujSodZjVruQZVgvBqLNzXi9LclgBVshSYqS53BcwuBE0/7y+9UEkfQuvNJNTSEgsnIRoY0v2PyoxSBP6IGJqKIdkZVhmjhxrRhb0haHAnOWRpK6AyIq18phQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhZcS0mY5t0vXPkHawovugr0tFkSnb5Va1xy57xyYxQ=;
 b=zWEDqVB97p6CNesd1vt9DLpf3VE7Ef/ykLafFGKWEe/U91xS8jugsK1YPxGxB+zCY05KpejQBHny/r1Q51p8n2o/sg2/vQuQjn6lbG3jybG2YbNWGb0hEWtbnToPEp6H3K9KDSDZtEwlDS4D+MNsV9jVP7CoE10MeaIToClF8tc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7529.namprd10.prod.outlook.com (2603:10b6:610:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 16:07:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 16:07:42 +0000
Date: Wed, 30 Apr 2025 17:07:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430154119.a5ljf5t5tutqzim5@master>
X-ClientProxiedBy: LO4P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e8fd08-aad2-44d2-a77e-08dd88012370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oZxuRjYwVfGBTnuo5Z3vB0HeDk4ohGv5o3Sgo77oErAy95I0xBE9Pge39u6m?=
 =?us-ascii?Q?wtpDpof2o388cYeKsVaOXUsVXlrEsYRiub7mkzOyWUDiCJTnJaS7euKv/DVX?=
 =?us-ascii?Q?WXefpbLLovzX7yap+ssCjEqM+bAZxkpFrXLIMIXbwGLFIIOjUVoyhM/dmDZP?=
 =?us-ascii?Q?yRQ80kNy4whMyJPMy3vrd5swKEfkDrsq3iO62vMfW6G2MlfRDem17IhYyS4G?=
 =?us-ascii?Q?wj4xoTZcoCz3xupu1Ct/nouTlwQWAk8hR/5XYhM8fybgf80qcH8LJSlHUQS5?=
 =?us-ascii?Q?uefctSTHJLoLX66WVMRG7r94YAf9Il0jNd2hTu0k3YDyEfbcPDKCKUi6HzP+?=
 =?us-ascii?Q?V2h3I3IEIO6Cop/4PDZxPAaUjZL6wke7tWhUkKj5gc15HccADc3+miRMeTBj?=
 =?us-ascii?Q?P2NCtSOjt6+Bx4LKGbqqiSkOP6TSbfgbNv6ktOK+N5h1qy2ZMuWZdhftHfFC?=
 =?us-ascii?Q?KA+DZyoy2KvW3Se1430e/dKDeKZwVaGc+1RscEK6lFuPELBkA/sDiUfMuKQ6?=
 =?us-ascii?Q?GE8kPeW2fr2JuxZS4Y6PDuIbvElniKystSZ42VY7agwKtEYZaf9w6qLAVVo6?=
 =?us-ascii?Q?4NAdeH8Vsrgijfs9jh5+3XrWmIQLIjjkge0Gy1Lz0UF9Z9Vgem3mWj1k5BPf?=
 =?us-ascii?Q?8e7vMl9tPpT8C/Fbp9t+61xCnmAuLI24JChKL/skL9J9qLLL+aEnQL/xlsZv?=
 =?us-ascii?Q?xg0qKU/z4BBMY/EoAxTkt+369+/Bya+U+3sfxarAJXCN8oag7dfqqhaZ7lQV?=
 =?us-ascii?Q?5KYBAqJAPVt43iXiu2vpxVjhVjWhOpNp0hDga3eYh8QZQ5QAklJTqXL8iDVx?=
 =?us-ascii?Q?1slQsobNlvSDzQFu3qqW10RB6oCANC/I0c2np4GZtr77U6TrzSd4yLmgGHoY?=
 =?us-ascii?Q?LFJHuuwbKTomrJUKiT5u7eaJoLCc6lhFAGOZ3MA9+6Ltx10MydsjcXZRpME8?=
 =?us-ascii?Q?YBx8C4kgs27OiZ40Tq8xiPCc6d8x2l5wOazdef8UlT9SyntIanXDGnWMu/CQ?=
 =?us-ascii?Q?GUhDTXkhG1tLgmhgr+TApUrPd4tulkf/EwAgtVXLGu21mPzMF/7VfogbKBVP?=
 =?us-ascii?Q?1EHiCfr/uz2AdpU+iOKuwIdIPxcrRQugUTZ2VZ7f5HOqRcAddJzEEYuit/yU?=
 =?us-ascii?Q?W24Ag5Hdh88NTxEDTxCswE27Wye6GfERO1xHoXt2mRDgMLn+u/p5Qst3STWI?=
 =?us-ascii?Q?l80ODPY8JUOv5P6e5ltAINJNUkJnH4C0JKqX5qn87+XGO4q81UX6XNHXLWzb?=
 =?us-ascii?Q?piBzagfKWGdRR25ia7Ef2zBryxMzmnwwS+NAFj5kexItcYpQKOxHdexNIAxl?=
 =?us-ascii?Q?4O8TeIwy+X6xChPJuD6gfJT45fCL1c0NnWdtMHmQ6cX2bNq8+hQXT3sIVn7J?=
 =?us-ascii?Q?FQuDFF28uDTzkG0YVS6x9jpNPX8FS7gpy72l7CClVhMbNLuS2FAwkpz4Q49p?=
 =?us-ascii?Q?32pKGk+gYas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vpCAXmnN2Fc6//ll/4mSwzKsQnwwpUvzmfhbkHVr0sE8DMYMoNHCEaCj6ZS+?=
 =?us-ascii?Q?bfJGCiXE/LIMrk+bjxHkIh63t4ioC/FHvyz6WAo4nYRCNJqie7302F5MLxja?=
 =?us-ascii?Q?UWzeno+0CrBJ65cRzQ2GDrIfltE+deiTEogx9zSy5mkkKHHP4SrxswDqVvkb?=
 =?us-ascii?Q?kHfAUCPaOpXGY9gnWN9Aw/+qw7hX/8CIDsGevm1luNGCh/9aVv67CWeN6Rpa?=
 =?us-ascii?Q?uEtbiHBoOo9ajdME020NLV5jRg7J2IxN/qSUGkNqo/9QnHpTeUNtSERTaDvg?=
 =?us-ascii?Q?6X0Ug1AsMSBOR32zVNrkcDrMPp0CPDOXVhjSWWo8JWLU+4khm5WZ8xic8hBj?=
 =?us-ascii?Q?OUp1/DrUnBlp9k0IkQmNuWOTYcEJztKZFi2HCL+HAlmgQDxYsc5YN24Pu29O?=
 =?us-ascii?Q?SgfoTWlqOdryOPHVMrhDLeiPYJ+LyBxaqN4OfrVgR0kv45a56Qd2VA0pCDim?=
 =?us-ascii?Q?aVwWO6uetHMJmxMYNO/o2Hg9nwsNCdV6OYdKkmk+R/dH+eCoCKKd3hJkqfMD?=
 =?us-ascii?Q?Q/oEUHN2AtZhW2P5GKwm1zZSamtMHLSSdMKkE3UxCWx4t5vEK0wTKWF+a53H?=
 =?us-ascii?Q?iGyW1GgB9pGgaHF+FHSMqtdwW1+2yYXelL8qA2tu4RZo6drjTu+uxoSagqQ+?=
 =?us-ascii?Q?A0krVVhOHj5QioSraJ/aco+7FOf5VJ9Kd5cX2H6e1XBiTctjc5tnem5LFkj7?=
 =?us-ascii?Q?y8bt5yHG0tppAhiaHMvx4njof+yGtiu1J5u9tXqiXlqtkEIL38eWd7JsptJ6?=
 =?us-ascii?Q?3gFKqOyGAF6Cu29zoVNOmtEu0480iTZRFNPwlsknG2cOipjhBschol5ja7hX?=
 =?us-ascii?Q?zuJOy7YQiTIcKtrTYl/RtfyVpR0pQK+fRCywLr3D2vbgHESognOHA8W7Re+6?=
 =?us-ascii?Q?wUXtiyPRu6eZFMiznuKBOcq1vH5asuSImAEbSlpqt9V+nyO/qe8yAXQv9jKZ?=
 =?us-ascii?Q?f7Qi1q2KZznISohXqQ0bP2bFmRlb2dQ9t0rZByHB0jlNlJHkusd61WZrP6+x?=
 =?us-ascii?Q?xZiTMed7evutwov/zuu06GQWsQVVuQtMUVY14uhcVHhd8qGi4bnh5UMDOBd1?=
 =?us-ascii?Q?vdvBTBYr0jW8aDZ63DEOTO1xY1bKIZMZBuhwNuIDoMW4nMDTvJVeyQLlM6rt?=
 =?us-ascii?Q?s9Re/Pgh6tcPWcBhC61G/+ROvaWM1VKyiwqqRIqVC/287C/ZC0/YIe1wykrH?=
 =?us-ascii?Q?r911r3cnm4Rl0TZBibD22qykbZcYZXN6XgvpFIVPnlZ7/TINCNEGTJk5F48i?=
 =?us-ascii?Q?rEiYYDhuc+p2QOnxeqc4GpvIP3S56/w11Yf4d8Duh0VEMpT78o47r82XurV1?=
 =?us-ascii?Q?7lPiQUb9ixtYoxrv7JhoWN1WluYUc++JMwF+xL80zmRINWwYGCL6gw/sWqyW?=
 =?us-ascii?Q?4XpA0E7WD1SzcQeEF3qbXj9JhOxurvJGnd6cadEl/Gjx9tLku4mc43Y1gfxe?=
 =?us-ascii?Q?pqxaAHWyANuH+LYiX9eOgzd8IX7yt/Klnho75FI8dkD6Qm24T5PEulE0ZE7A?=
 =?us-ascii?Q?fe9NfVYWVsFDPCewQ33NTE1rvB2Ahq2AwJEl2HhatCQzCGRmH6R17vvntfls?=
 =?us-ascii?Q?6l1aKPAYT8wC6oEODMfDmoK+/J+IBh3Ir2ldIwbnQ/4X3nPT73agMn+dZBCz?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QHy3Z785K3R+1KHQ5rOmOkle5im85G2Sb8hBbKU9722YvNuMcxJwPGuqDWpr1hGOHLVcsWRfIo/MJs0mlCIUmi7VdK1b9ct44fExFOhNQjwOfC3qQWRH3bqpV5zQ93o5CbdvMbW2MvSW/PsuBXdpR2tUI/j/748MutiyfNv8/mD1iA7heXwiSBlptClXwrLSgSVpWZNWGUhjy/lczL1wRLS1Km0LPQK/PaIuoRFRo04hT5JxN1J16JFHcY1f2Rh3MRTObvo5QFIlx7bgX8dhcWR2NRGxuW2sC27Wx/anSocqa3lVJEd+5yxmQOffz5alwEodtNi6Q3QdShH5cXLJtbACoW5xS61QB0J2ZDHNyotRKEU7OqqzuQhWJPIXs0rnscssp7r4ANqHPmijwXLGOhd4kU5lG7AZin5Qc/QvQNMOvoVBzyhe/8tbBDBTRFfQ0xfKhTgrJTMFopim2evzrBMsKlR53f+dIvLgkFU+3AkqPvBuRVeBBj7tf0w4iH3s7nsLdzAJWJ5usMGb46nqH3xRonhY9XKq+BK5rZNSNO8r1lcjy1wcUEKtaCD0BKYUceTDS0dpG+K4PjXAz6d4pVlLtdQ6B5m0BNAvbxUWiNw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e8fd08-aad2-44d2-a77e-08dd88012370
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 16:07:42.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDHRmuPrgFM1PTmTBi2aWWcL8v8J1VVb2Jfl/SvxESsSwG9KLCKg5pgx3sHAWVT8yV+oKtIyHuDKzRP/Eunh6nm3xlTA2o07gAZ/sQZKQbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7529
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504300115
X-Authority-Analysis: v=2.4 cv=dfSA3WXe c=1 sm=1 tr=0 ts=68124ad3 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=4v0pL4tEErWdBS3QsxIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: HpsTsaRCufUfTmwRwBKQDn3K3lAycaxp
X-Proofpoint-ORIG-GUID: HpsTsaRCufUfTmwRwBKQDn3K3lAycaxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExNSBTYWx0ZWRfX5nJarFsrr4ix ZEb1w6HxgbSMfAOWkd1UEmbyFGbQVJaGOGID5T/MbFhzqM3cUzDp95+xJKtkGHcJ4D/OPdzKN+X n3sLx4N/V5dLe4crccelVyPe2nw5xd+45FLyt0yIbtw17K+wPaZLUQ1S/lzz/S/UHGi7uzHpYFq
 6EfnCozXdG8Gb3OhjLWNF9gic5OnKZnnCnawLkdTPhwmvi/ujJ7G/GHHJKZWSF5xEMxMjy2wiKe bDaUxsiAnKy6VThLMDicW4vIUoO5l4rfYrNR5zZYx+EPBc9niZhyoiaDtHL3nEFV1C+boZc/JTs FutLWCeTpZ/NJqpi2UPd2ktXUFMX246j8gu58WsLmAzVyekO+VtrwGt1r2QFSANYT4Y3K5+G0Do
 21vpaEWQWHX9zbO/Tsw9VIbRRG07rLpj6EP7boKOf7D8dUDRwV66qPJSpG4uTf69wRhP4OlH

On Wed, Apr 30, 2025 at 03:41:19PM +0000, Wei Yang wrote:
> On Wed, Apr 30, 2025 at 02:15:24PM +0100, Lorenzo Stoakes wrote:
> >On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
> >> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
> >> [...]
> >> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
> >> >+{
> >> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
> >> >+	bool ret;
> >> >+
> >> >+	if (!anon_vma)
> >> >+		return false;
> >> >+
> >> >+	/*
> >> >+	 * If we're mmap locked then there's no way for this count to change, as
> >> >+	 * any such change would require this lock not be held.
> >> >+	 */
> >> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
> >> >+		return anon_vma->num_children > 1;
> >>
> >> Hi, Lorenzo
> >>
> >> May I have a question here?
> >
> >Just ask the question.
> >
>
> Thanks.
>
> My question is the function is expected to return true, if we have forked a
> vma from this one, right?
>
> IMO there are cases when it has one forked child and anon_vma->num_children == 1,
> which means folios are not exclusively mapped. But the function would return
> false.
>
> Or maybe I misunderstand the logic here.

I mean, it'd be helpful if you delineated which cases these were?

Presumably you're thiking of something like:

1. Process 1: VMA A is established. num_children == 1 (self-reference is counted).
2. Process 2: Process 1 forks, VMA B references A, a->num_children++
3. Process 3: Process 2 forks, VMA C is established (maybe you think b->num_children++?)
4. Unmap vma B, oops, a->num_children == 1 but it still has C!

But that won't happen, as VMA C will be referencing a->anon_vma, so in reality
a->anon_vma->num_children == 3, then after unmap == 2.

References to the originally faulted-in anon_vma is propagated through the
forks.

anon_vma logic is tricky, one of many reasons I want to (significantly) rework
it.

Though sadly there is a lot of _essential_ complexity, I do think we can do
better.

>
> >However, with respect, the last drive-by review you gave was not helpful,
> >so I strongly suggest that this is not a great use of your time.
> >
> >Again, I _strongly_ suggest you focus on bug fixes or the like.
>
> Thanks for your suggestion and patience. I would try to focus on bugs and skip
> those subtle things.

Thanks, you've contributed good bug reports in the past, I'm not just
recommending this for no reason! :)

David's suggested tests are also a positive way forward.

Thanks, Lorenzo

>
> >
> >Thanks.
> >
> >>
> >> >+
> >> >+	/*
> >> >+	 * Any change that would increase the number of children would be
> >> >+	 * prevented by a read lock.
> >> >+	 */
> >> >+	anon_vma_lock_read(anon_vma);
> >> >+	ret = anon_vma->num_children > 1;
> >> >+	anon_vma_unlock_read(anon_vma);
> >> >+
> >> >+	return ret;
> >> >+}
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
>
> --
> Wei Yang
> Help you, Help me
