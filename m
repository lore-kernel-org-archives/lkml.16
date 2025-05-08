Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102417A310
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718159; cv=fail; b=H9dYqfHYp8OCNRtuAEaKovGwEtirTPONA41mNss9RIauC3PaLSzlhuyv/RJ6euw2nSchwP3+/apUHWsxlvqlJA0yzDZed5cEgu06oxXKE+mFslZrvW31XYSYvB5KEWUTAZoaSw35HSGUtsbJMyUEtS+dYczDv/fY6OdhvoA8AkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718159; c=relaxed/simple;
	bh=1ygc4n/bLKU/t88Yu6MpNQEporhuSUyDYlwA/cI4Ksk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EO4hcScHoMARSlf8E2r8FYV9WJd8aNHP7Q0N/gyoJuEb43lqelrcKA6cWxnkITs1fdeDsygMoEZt0rbsdPqE9nfsMFMLfEJyhZvI75WbIe3Mx4XKeTzpYz2wq+1KgWTwgK6UGohPbd9DAaBXfZTefZ0keAsEMYN8A5OPKgSBZiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I7LLoUq5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X2qb1aS4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I7LLoUq5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X2qb1aS4"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548EupuP011468;
	Thu, 8 May 2025 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=u4VLIuRddjTbkN2F
	YdI7M0OcG+LPeuKxYs8IwySbf08=; b=I7LLoUq5ogmB+Hohku+tJbaCgwUWvVV9
	0bs9O4fbmwnGTWeq1g6VA74jp454Ex8lEHB40bYcrTIinQ/3WizBNs+17DwB6Mdv
	Ta4UwbvHJ4/0eIPVtaFKVmijnhDl6d2V+eW0QswmO93jIzPFeT4rMW1QUYKhHolL
	i72gFOCWxuXKOSltzVn7BteKBEggwexNBWp58+9PWxlCRx1i4dc0f86Z142BMCTx
	pE0YYtb95+6zZpbmWpKQCQtYbTOThaMJ3m8wQWVeUopf+cv4KrqfK4uiTzFtqR1H
	zUS3uvxjwekhS1z01QevVpbV0HqnMX1sHYyAjQ0jR+G1iWO2MDQ+uQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gxp6g4a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 15:28:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548F8Rie036206;
	Thu, 8 May 2025 15:28:50 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013060.outbound.protection.outlook.com [40.93.20.60])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kck4mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 15:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKutOBNRVN6xG8g6qYaq7+TcC7DmEvX3NIO/IXziHNi1MUA6SC1v549bLYRMTD/AMdPMa/0S4TrhgOiX1XJSIF5vn1TJnvbeDICImBtj0nx5Uy27ACbFNYdiVQFME4xOQqe10kYyediAqvMT/SOq1R5hnjxjdyMYLALBb3CSdUg+AAZ+GkvmJNPDdI3q4kO+dPu6101wPgRUmaHfEBarhYIJLf35PwMhwOJklGRql102V7hnFvDnHcwn2LIi7Zu9ESUCtxKmhKYX5zKtCe23rldQFkMInxKc5rxiwk1jPxumalphQi7KP1W62KiSCdwu50/2YJVZyI+Y2o6cK8EmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4VLIuRddjTbkN2FYdI7M0OcG+LPeuKxYs8IwySbf08=;
 b=nA5J9OKhAI57kr0hfIyPWRxZbD0m4MyPbriCqEiUM1TqF9PONqhmGnopLzaDYTwpCh2LHcqmkcHCkj8E8hG4YQvm0mWjMDxEtKyBWmctlUyiZXqSbkwW+b4+KOXPcWyb5ZNsNFyRsW81csfGXf5hmIhOOhEFwnEn3lt+v6VSFQqrIB4MHIHqpy1SZI7vKma98R+ULxO/s1NQX0UPsnMVv2Of2/2q0mGryghthk0WK9s1bXgOQVxUcy9UJqpOtViL7IWGO1lrkBTraXnCP/6YSao87lyyNDFTLu4I/cpKyTHoM5t3mjCXfxmPXj35p21koRRWTcoc+unzwGBQWoER3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4VLIuRddjTbkN2FYdI7M0OcG+LPeuKxYs8IwySbf08=;
 b=X2qb1aS4R/r8cXoBPqPwsk6gVXwRNGgRPW9ZG3wdVuIozMHS20knNQdvEw61lMx3sInOMKSy4BEij1Esl2Iuca0Cxhud9Bl0mLWUXxCsUUFzhgITi5ISf3/IB0G0GkEdIKxwWnW0bvOyoDaxQEn839kEWQ2beNDm7qMETWFqPCA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 8 May
 2025 15:28:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 15:28:47 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Date: Thu,  8 May 2025 16:28:25 +0100
Message-ID: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfb867a-abae-45cb-e8d7-08dd8e4506c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BVkK1DQJ0eVqfHQ/m7l5k39vwb1NU8MOLK2kNJi/kCZO/YfVpu1OMUFDbjWS?=
 =?us-ascii?Q?MEwNK1lIAr2ffN9yyQTVxQnEfOWQf5NxrYw8iXKPqdsVJyeSJOtfuaHMMOX2?=
 =?us-ascii?Q?phd0Kd6DQwNlUAvL896UVQixnY1qEf19sH4D1EVrVbDR5ioVvzIl0VG2nSJu?=
 =?us-ascii?Q?KJqsa4KIF1mqc3m5MF5YTeLt9HVBhFaZED8VMTwyPIyRhZklhLXR9rgPdKfP?=
 =?us-ascii?Q?oscEepTYm+zS2yQr/2FO4ZwlYH+AcINcFEbJrmoPGQtOYT3J/3DGwQyM23bd?=
 =?us-ascii?Q?mrRvOkDKYIUlH1b/0zBdCqRNrhFzv5uwnX6Q4oYMzxQJ9q9Ne3asOf+I9QMB?=
 =?us-ascii?Q?Js2X81A+Iardxr8Olea385nHiZxrY2SA7p+AEbj4hvLUuBEyMWziky24rW2m?=
 =?us-ascii?Q?lmZmzRW5XMKvVFyE2UlKwGpUA3DeUv7ar44M9HAcSPpA3lFrcvMMWmnoxeco?=
 =?us-ascii?Q?V2CmswHdiOV6WGZmACFvdvKlATcuOu4Ox0Pm+IPDWUemi5d8PU3P4iQjktOm?=
 =?us-ascii?Q?r8HTObjQUiUQxdngOdZAcTejf2qOhXaU2v1Ei/xt81RccMaImazii5mXmERb?=
 =?us-ascii?Q?7Bv1eGcgoJt2vw4YlEA/uBqln3rvxMnpLMObOHeiaWHnxvATAk9fICblTxjD?=
 =?us-ascii?Q?1RcS7tgvGYXogqFzMct2slEgSC8G3H81Z5OzqIgG2hHRPqhAQau9Qjab9Hvw?=
 =?us-ascii?Q?0mVevS/GJRiIaXcQiVmwjCtEZyeVlNnH/ou0IssKaNN4V1c9aMNnJPM/B7Sq?=
 =?us-ascii?Q?umsXep6+vfl6gUw4QaiUr31zshMrMHx6u8MJCf3MHI7EL6rnhhzeMcT7d95A?=
 =?us-ascii?Q?rMtmGa0pCuQVy4h6YQF2IxRsvI7WYDHhsvgk2Fg32LXAYMawbCncLjS95GLb?=
 =?us-ascii?Q?CExKdlpRXaWQRWFSpEU6McVb2EK7/3LhHISYy0Mbtp2sAAl/tLk1Ls1KMnpM?=
 =?us-ascii?Q?uL+4ls5nC/XkjPDu8CZuoD4mdi/2nnV2/EQB/fefHcdUv20zvCPxCPB4WBrs?=
 =?us-ascii?Q?A3bGZ0ZCgNFLbn9H+uWjdVa+i+QNZNPTaFFlhiolgKxBuO6IYbKueSL2qLRX?=
 =?us-ascii?Q?xUONZIAdwmbQk1By9U8KikRnkp1k0hzAz8R7ncm/ZyjHpEObw69TOe7h0lCt?=
 =?us-ascii?Q?juID3rDA+rsO4C+7PgibyaJZlEVCQE6fENcLlc5SETzOF3dAYrFVRrhliozV?=
 =?us-ascii?Q?bxmrVQVofBfrUsMPUOR3z/7EwjJYwN0ZCB6OkqN4atVakzggaGOPtGbR8238?=
 =?us-ascii?Q?l/w+dXP7yagD7Cm5XXSpCcB6W8kuU/MTuTXKNId5TzhsGWnBrTEOM4f2+cO4?=
 =?us-ascii?Q?jnVP+T9sDZ5akQZSYp261/MLimHXSQRWgClIiV49N0OgcIRceB5hG1ClVqD5?=
 =?us-ascii?Q?/BVTzh/wreo6xhhrsLSL6w6ZQgXc4UXUiDfOEoJrWQe6+IANGUDLo0Re6TPn?=
 =?us-ascii?Q?IV1cTgZtNmE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SPCX/NQuh+7MA0jsh4+WhPFFnOTK4DK130AaJ7Kmf/7zJ+sKgLSPEMDuE+4u?=
 =?us-ascii?Q?mYaEgH7kmS0zYpXvyUX1WbK9CrRgGjeIs6XnrgCGklfDZ2fcKIh/iTADXb/O?=
 =?us-ascii?Q?uQd8zTHueyG1gSOH4rSZHwFzBp89ggrc13gN8Z2IgjhPAZUi2uKU7a+k853O?=
 =?us-ascii?Q?Zzje+v/iffVWmSbJ/KvI7R0TUsVZGUFmSUOZIz4hUT2IVMtApBk7LHoc9Q00?=
 =?us-ascii?Q?3M6YStgyVkZlY4H8YIjW1euq+qXzKCJJ5O5t1oFZGcTkUroiiNdtTF6xnpER?=
 =?us-ascii?Q?Gs47vGPQ0vXZGsHPfYLEVrYyngBw8iQ+5AlCov+izwwbsKCWuULpuOGk69bg?=
 =?us-ascii?Q?aIhH6KQTdbKtPHuHYUccN/TOzcseoo1nXuA/VZN5p5xlPGUNwbnCkzwuwiet?=
 =?us-ascii?Q?sYda55elfXSf8Hj4BjRXADRrnR+y51vTfHXXwljBsQqLMrMKaCTJcrv4wt/5?=
 =?us-ascii?Q?jiakYwpIHsAkZBTlcbWg+qZ4/yHk0MDyvPa4eVcx3aTOxRG1rsoqt+q4ubA/?=
 =?us-ascii?Q?NYkhsmBk3fbkucPQeewGXov02SF5nsm2Ugp1eGd/D1puqxQ4sezvsxakDXQM?=
 =?us-ascii?Q?asqzfyImIqopNSyMmmcy2HWVVIb7DFMx79AjaC063xkffy1m+S4lF9zZ8hvz?=
 =?us-ascii?Q?cBiF+Ti0WkupKYMQLie9mxXh0/+bsbpl0oIdrqQNzJ+EavihAkng9X7T9PDj?=
 =?us-ascii?Q?IGivnMmHg/i8f9ozllfP5MduXvpJozgSEH8lUFUNXDF2zutKargVSlqKl7Dv?=
 =?us-ascii?Q?cufcJvj3Jn7JMRgUS3KIVQytim2yqsjgWQojNaWYOS4lHxUIS0XdOFAGMJW9?=
 =?us-ascii?Q?m0fK2Cm3wdruzctHnxuyOEZ9SzkF3RiKadWM1aJkWMXbsOJxOQG1kvEVsRxj?=
 =?us-ascii?Q?+WttXQ4DwYTz/G9MewaEFR4fxBw55bX5SGfNjrLr4QUMWUA90K3sM8XoQN0b?=
 =?us-ascii?Q?ywA7R/7J0+3vVOsnnZXs25llLMgdUhC4Ik3r1Hu2VlFw+i4srtudMon8yidL?=
 =?us-ascii?Q?1SgOuXruTplPlbvivPg2A0qhVDNfl+tGYQGlz0t3lIQNqQDIQVfSozSlGP/k?=
 =?us-ascii?Q?8t+SiyMXXhzeJBD2Bn9jkrE1Ly4nftLY0pah/u7mOkKEgGFtnF0mvxB3KbXM?=
 =?us-ascii?Q?m7njF0CGeTGeRP9XBql52NCLW7oS9HXevnsYbYQuFejCvIPqAG5nLZxV2/sx?=
 =?us-ascii?Q?Jo0bvAZSMINZ9o32J3TpeBngqvv/1WXFmHG0TbtIqycUKLIRji/jfnakNFN1?=
 =?us-ascii?Q?AnmHmKp4nxX3Lth4q59VlmVSfATd+8Mmk1/5zpHLZ1eF4EFdTbipiEzFXFV6?=
 =?us-ascii?Q?Lt+c38aWgXW+LADgucw+7YiUhNxDaD+Kbr8e/lSupBDO4/BjDQ8l+XpW+Wpj?=
 =?us-ascii?Q?1MaMgeP1tnlHayK2AA1Am/gmmztkBSBOTBsJEfx0x3lsaNFdIznlX+i60Zdu?=
 =?us-ascii?Q?dPjRP3hWOTD26Fiv7G0oE0ppu4XkwfOR1hB3uh7HgZU35mURXxOKrxxN/hBH?=
 =?us-ascii?Q?Yw9cfwurRpVV8U9Dv5P08oKmwg4VXB2wdqUW/Z42mN5pn9qXH52UPHwwwrT0?=
 =?us-ascii?Q?tl10Zxr7Hs//2C/Ji0KwFwpAcrLAikJj0R0SJ03EHG0Tqzh0PCTXvWNdw79k?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Cx6HYJEs+DDq0XJDRgNykVe+5shzf3JnhwBacT7cTYkgffrwJ9DfrDAHVzQRzE0l0DDFmKbZiPFYsmKEQPvtDVe7Ng8NDauSb8CGwp0ezeOoC3Cn6TOTLok6+Y1n5P7ifkZAQK9IeN17MuFZUTUoyeeLI+iGNxuPZWb+rDPelbp6ZlwVo4yFL92nEfeOeZYQFgEW5SRY2IT4SnNpCczBh/9+H9bU0zcLwYQXHfmcUjmn1um9YfvcrqeBue8IH641uyRS5B4BBO0RMJN0SFn4+gpbKplEVbrIya52eiu/fJZx221JT7cKsqrSXDpAJLKWCCYJkkly3qmjqih5OTbId4rtyQ1JvebIeT/GH3t5p6CVfNxblxAyPhawL0nDgknwVUweDO8rmKniTZSHkiLv6HqOct3bz8nt3JXAd3BL3fBFJcbdR71w+rv4F0cTL/FZkGm2GQX1yMsuKBWkujS2iU0BdpaIeFXQoe/mgheMr2Q5uqJ8av087BguRX0cjzzcPTiSQ0WS5OmMdLeKIzOTp3Hgff1h5E+L2Wj0Bgn7cqBRQJn3ZNnL+VJ3nWvyuJkQ5yhvH5+7DcLBWimCA5M0ZbikobIWR0AURjJ77Q9ncnk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfb867a-abae-45cb-e8d7-08dd8e4506c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:28:47.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlJ+Y6s2ReqO3RaIzTBRYVsWG0ULlP/3Y91jECKxWkQO9rv6HAJzcOs+/rD/AW7r+j4I5GWIAQkY6ctUYiAp2mXJg0OqNdTaeA+M6YAiJkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4918
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080134
X-Proofpoint-ORIG-GUID: RGhQE87uFP0Y_Rk8asBYt0rHO-3CzOGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNCBTYWx0ZWRfX9tL4gTAcOzxb zXmx1cw2Fe4U5xZKJ68oDAcpaESts2tf8QmosADc2298vLnp3fTMjjPdnNNeHy/HAnhjWHHkR2r urrYEy4tLJgETXaUnXMR3HYUEFiqKvaltnrb+TDAlkPC90MIKrn0bSPxdiv68XRmQaRiCK1DRGV
 5Qz4VHnQYfzCpO/CgOBmTG6Yy/JXJorDPEzosRgyJZmZtuAIBje2w03MQjc4UZUJXBGJuibcxof pzkyGxt9wV14uSj+8eSImfUf/WoFZwIeINtfNCCH9Q6GGU4WhsHNZz5EyyDqZ6Hzf4SaP24CqdH YBNFTXfrErDC/cWTBM0lRMd7K9o6ekqn0tOUcmwunHF98BANWZMmJB5BaHL65ulmiABHtevUPjy
 qtCShFis7YGwpSsppRw4EcAvEfy44mLpRbz8KsRvtN6Alwri4r1ZBeY2UaJ2mP5Ec2/+qWW6
X-Proofpoint-GUID: RGhQE87uFP0Y_Rk8asBYt0rHO-3CzOGp
X-Authority-Analysis: v=2.4 cv=LtaSymdc c=1 sm=1 tr=0 ts=681ccdb3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=j5PtLZGL1ZuHC3UwFroA:9

Currently kernel/fork.c both contains absolutely key logic relating to a
number of kernel subsystems and also has absolutely no assignment in
MAINTAINERS.

Correct this by placing this file in relevant sections - mm core, exec,
scheduler and pidfd so people know who to contact when making changes here.

scripts/get_maintainers.pl can perfectly well handle a file being in
multiple sections, so this functions correctly.

Intent is that we keep putting changes to kernel/fork.c through Andrew's
tree.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccc45b0ba843..55332d5bc499 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
 F:	include/uapi/linux/auxvec.h
 F:	include/uapi/linux/binfmts.h
 F:	include/uapi/linux/elf.h
+F:	kernel/fork.c
 F:	mm/vma_exec.c
 F:	tools/testing/selftests/exec/
 N:	asm/elf.h
@@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
 F:	include/linux/mm_*.h
 F:	include/linux/mmdebug.h
 F:	include/linux/pagewalk.h
+F:	kernel/fork.c
 F:	mm/Kconfig
 F:	mm/debug.c
 F:	mm/init-mm.c
@@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
 F:	include/linux/sched.h
 F:	include/linux/wait.h
 F:	include/uapi/linux/sched.h
+F:	kernel/fork.c
 F:	kernel/sched/
 
 SCHEDULER - SCHED_EXT
-- 
2.49.0

