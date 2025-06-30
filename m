Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB982905;
	Mon, 30 Jun 2025 02:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251494; cv=fail; b=bQYKveyIPRcGXDQIhrvK28EpYUpQoBqMlYZ6GzFxpJTY2P0Qijr1MS67MRNAA4Ax6NxkakVjQppFUX7aKnfI6dyLXgdIe5u0kfew5y8xIjRHu9/Lyix4glTPyQZF2vK2KCRQP1MjHV3LoyzyhJlSp+KDKmjOLVbC7hZtJXqhsRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251494; c=relaxed/simple;
	bh=bUaFjoEmaBjYcPbcKqaLUNP8GaM6CrGYfZ9DTLwZ6vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JvlpLUBedtZ8BmRIrN9YsMB7SKD/1fvUxSq9qJq+mIbLlV1ucrjd99ww4umZutpvx9XraS10Ic6we4GzVtAw+bJuTt0MtZJhqtf/8UkRbEjP5jIi4v+iulCDBKJx7bT7FoWcb/bygyDZh1HXt3c75kbN3vIxvaggDtLvxwf7/BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Papv4VM2; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Papv4VM2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIdqG88Gdo4xrsHnowb4eTtQM21c/5P5h0pYvcg1FZuMgiioQ8KXToTdTCaJONDs0+lplkZc7GRqaMYOat7OQaGFBmlyicMYCILp1UT1mnnalERc5cPICoqH/hPZQhcUfnPKZrTHgIsCvZmJhG5f5dWqxEjIN1+cxIeN+zam8ZKnbGPPuiSZUO2pdF+hEWI030WCakik0H0JLAPJBAVSKs0CVc4NcQDZ9WTtHfqus2cdK0MO1QaZ5AR8y15tj+UPTmPnFFElYePoimFPeulKrIJg13m0sCKhE0lKU5dIoOJW3ISkVulfR7msjy7ngLpd8bNiG0QO5r2VDUjQiL8V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRH3q/37hdrtk5Uj4bT67uEKkcrRhjWtGsPMJCjNmrw=;
 b=HA5mzVK2CoUf5TD1DCULy4UYJXsyNe3dOv1Z59HyrOzIjSYYE1Ryvde15ZLFBaSCmnRmb5uGGIJB8vJkAoB/VwtVtkTsu8W2GkeWetNZAaK0IwHhwlbJ93bif/oUrzkkoS73F/nnTZyocd3Ftx9J4EGSEhVcfzXR82+Xj15hIJ+eSsyGjamZfStz3KRxdqgV78MzXgpcbrd+r0lTXRgXxcjPDySbWeFeJbHVfDF8y5JGUD6tE68mHGN2sITatBgL2Roi0TEPsC3AR2l/wwSofvPNMquhSDRcb2Dqm9NPtvMel2WHjPmrDWX7vMbwGrRxOS5C2WHSYXNMa5uqBQP/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRH3q/37hdrtk5Uj4bT67uEKkcrRhjWtGsPMJCjNmrw=;
 b=Papv4VM2evstKgo+MVPtxN3saWpl6AJB6ruP0h14IDRyzBRpF6wqOOb6VcC/PAlMOKOIh1DoXUPAKmmWvQANsIIzZyTgmIN/rMVfN+TAc+PwjV7cpI9uFB37xwF/2qBTQSOGHXcMSF20n7VGkWRg+pEkQ3f4hiRGmfQhtjDN0ao6KTjRRvIifdrwEabxrvQLXUlNITrqR94SEWXrZTKbFlqkw7FP7r5NX0aMHb3Bzrc47JLfuisKX5FTP0b60XzAVJ722YzkJORVAsQqyR0NLI2EIUIREnLhMgVXL7L0CP/dhq0hiux3Tp8POf9gjB8iW2R+PYq/G5mBi5QWRjxFuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BL1PR03MB6088.namprd03.prod.outlook.com (2603:10b6:208:311::22)
 by SJ2PR03MB7476.namprd03.prod.outlook.com (2603:10b6:a03:55d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 02:44:50 +0000
Received: from BL1PR03MB6088.namprd03.prod.outlook.com
 ([fe80::21c8:ce4a:b199:fc9d]) by BL1PR03MB6088.namprd03.prod.outlook.com
 ([fe80::21c8:ce4a:b199:fc9d%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 02:44:50 +0000
From: yankei.fong@altera.com
To: dinguyen@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	matthew.gerlach@altera.com,
	robh@kernel.org,
	yankei.fong@altera.com
Subject: [PATCH 0/4] Add 4-bit SPI bus width on target devices
Date: Mon, 30 Jun 2025 10:44:44 +0800
Message-Id: <20250630024444.3071-1-yankei.fong@altera.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <70e3a367-8d9d-477b-9858-9f2a7b97bbca@kernel.org>
References: <70e3a367-8d9d-477b-9858-9f2a7b97bbca@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To BL1PR03MB6088.namprd03.prod.outlook.com
 (2603:10b6:208:311::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR03MB6088:EE_|SJ2PR03MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 05469dc2-3ed6-47bb-401b-08ddb780158e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JLRYz2nzBI3TojsLd2QXkM/FdiELIfor4Sr+LKYRJ7miIZkf7ZtRRHwwLAod?=
 =?us-ascii?Q?S9IQQw6yiANPjlrKmAixvExa+KIpLJKoO2Je01jMdaNuISllSNtVATmIxOrR?=
 =?us-ascii?Q?tp78AHksNDysF/Q19eoCaCtVeRRz0xHunYTYbWnyK9nvpglTNP51G98UswiJ?=
 =?us-ascii?Q?Z0zGeLDFWgjWBeTmKt+mY0kKDAGPpr5wuYLQv3Wmi944uaITYmJBJB4pHE6N?=
 =?us-ascii?Q?CNvZPT8N1pDIFlTfWC4NGZ6qu4OXhochDUGIegn/YU/xOjeMSTn7IuZ06i0O?=
 =?us-ascii?Q?XK5oqKQvlA7u25nJUidPHF/6ly7tsnPW0mXfCs9pQDh1vvCCZA4JbXQO+ZJD?=
 =?us-ascii?Q?oMlVjI8mudxkKW2f1UtTkIhsW4LanPcmFe4jTuHCXoN1Sx06SAkUzfOU8obY?=
 =?us-ascii?Q?pbf4rtC4TKn5DBZVU1ZFRzhfRPE8+f8tGL0XeyDLOQtXLM2QSO+d9R7yQdV6?=
 =?us-ascii?Q?ymGAxQZh8oHUXEI3sehiwjQk67HURWl2oxiRlNN7ZFOcdMShDvfVExQNso3v?=
 =?us-ascii?Q?XRY6m8G1+RbeO0DLuguLItmBdooayZbWtgQ4JRzDr+AutCHcSm45KFoHGUEc?=
 =?us-ascii?Q?eQDSq5Avt8AziX1rCGblAaMwp4GbyGxJdD5h4Ejlaogs1zLiLsTOBIEAQPu3?=
 =?us-ascii?Q?ud8k+VzWw730bdTDxlZbq4K+lslhECuS0P0Q6Z3ognTWLT6dWFsObV/ZQTyB?=
 =?us-ascii?Q?pvkLc2xNea++XqaF8Q0usxxG1hbMpV4GrwjRJ2wEsTj/69GE6MH0ipqg4r7g?=
 =?us-ascii?Q?kw7SwZ3bwiKn0CykaDZynMxL3iUiYl1f6j7ZYd0MIAkO/6CpKFB6uUL56TAm?=
 =?us-ascii?Q?coGB9P187WUIahDZeEX3kVtnUrNptqZWWPJvw8mFx0tX62krt7HmpRg6Z7g2?=
 =?us-ascii?Q?YS+BmNxKs8z5GYsJnUm0NdgQg8041JPhreWqgKbs0y+TgCYF5qr7gpXGKNLo?=
 =?us-ascii?Q?pGJ4nBS55Qil5fhoQhsdIZUBue6Atg3hpRlsTKzNAlI7LnWkSGgmAhxl/mRG?=
 =?us-ascii?Q?84eJqwwFjnr29CalT7VUVcA31tk9xs2rahxq/ZyxW3smbd6vamktaMS00FPP?=
 =?us-ascii?Q?dXq9+6goA63WOJCHd3iBozeRLoChlkGvGSU5rGNJFor3B9Jh5en3/wigvFY2?=
 =?us-ascii?Q?Ml1SqNDHhe1/PE4EIb4HSdWuoYSV9MCu4rNiBZ5Bu7wcQ33qakxAlZ5V2Usv?=
 =?us-ascii?Q?DruNhEC8+TwdbnywjJVHnxB4MzDcFFRZS8D3KgCZ1/I9m7FNrkHf1ChUq/9G?=
 =?us-ascii?Q?sH5URcHkElKy4gaUMRpYX5fGj6/n2rVFxH5FnuzHWOrK0iTslXFLzUyj868d?=
 =?us-ascii?Q?G9jmxY5UGzu4HuYcWqiKOAwPcYtEjwqtMH2+L6z6mpvGCARLgXD7FWWXXowN?=
 =?us-ascii?Q?4ALiG6SxH3K/19+GE4oEOX2OjyRTxH+c+DvLHMx5TcNiEqVzYeP9E4Np165h?=
 =?us-ascii?Q?/y/tWiiRAto=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR03MB6088.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MXbTXAZLRehF1CkmJPUHABWnvy6DHIXrSsiSUy5A+7yQiA36F6I01PnxuN1T?=
 =?us-ascii?Q?UKlR+xGCPmTTabOr/m7NtsRItzF52SYgq4jSAJ4PzKRJINUIRd7tgdJgXmhH?=
 =?us-ascii?Q?ukHI/2JeSlIJNvJi3E/sjGj5sk23vm1uYr37MRFpq1aOIKRel/VChmvKLRKr?=
 =?us-ascii?Q?NclEtSPiatT6fsOhx767+mRkMjtMRxop0ue0Ocunj49wqM/Oc4Y6C20lxZ61?=
 =?us-ascii?Q?Si8/OAoE5arAQKphadftNfIEgTdQjUcZ0O4MYMAsCs7wFArsYCMO4c8+B/Ke?=
 =?us-ascii?Q?GcvbyQ8VBoZgX0VSQz2BP180lRrvAwXC4hkyo8slQnOb6gnTSxIugTZSFpWz?=
 =?us-ascii?Q?AWiBvHNb2BBcaTSx+lxtfQ4PozibAwCS9i/T6yui0FF+cYEpD2A7OCLUGOc3?=
 =?us-ascii?Q?Kq6wHX3rydzNZAla6P4iq6BE//Tsnmnl2ft40av8lK+Bmm7oN0Cs4E3ncW3f?=
 =?us-ascii?Q?UQbkNXoBcl1o3kFLAIhTt/sP6sDl9W/Il7BCswj1D76NLOdtFIzY2WmwlpQl?=
 =?us-ascii?Q?0f3lFyeb+sZPEhCSCmv2W8OR4qJqDfGFpB5i07Kyv1wWBVjtE1GOF4mJoVTt?=
 =?us-ascii?Q?koq1utyOLz097abFDrFEY2zuR7k1cJ3KqJLzqnzTQPbDubHMD4KbJmupaS64?=
 =?us-ascii?Q?RgX+VGRHZEI3xmL/DNevR/uHHazda+p04eIKoj+6ohipl+ig37MN2cVCrjRE?=
 =?us-ascii?Q?FqjUFStf6XjLrYm8DiwB5XVDtKu7TSxV4b6jNJ7Gibbt8p8NlIhTEqXsA9SH?=
 =?us-ascii?Q?AttZNtzovj5mwiknAPBsZRF0NIv4Tk2yBUu1Fr+MWPbdKDYFQ47E2W5pDoTS?=
 =?us-ascii?Q?akzY/I/fJRb1BpHb7CmBoAlHbJzzQ5AOZ3paL2mf3GnIUCspEoyTmnJvXOJ8?=
 =?us-ascii?Q?kyS4fT8hxLuYiBUqdSQPi2nxK/twyObPD9rdSUwgfJoe/F0ZRpx6qd/ltBLp?=
 =?us-ascii?Q?PYv7rd5kq5lCo1WuNitcdvBoXf7lnGWSSI0KAr1KWmFn+P7P0hEHnT4zfaHZ?=
 =?us-ascii?Q?JTghefV6T1e2/A+Kaf9EgEgm5ACteHfg7agXDw516oRBakYcyez3nkhHQJJl?=
 =?us-ascii?Q?idHMEMnUbuMZXD73Cs1auxiyK7ast2o6ZkRujKgSj37oj/iPWDOgK5IPHvLa?=
 =?us-ascii?Q?ScsD3VhNN0pibRhXLPeZNMXo3/Lmwq44J4uuEnM422FVHI0XrFQhk8KpPpUS?=
 =?us-ascii?Q?3x3Nh3UOSxDgRtChprEhSHh2oqjXGDSWUd+Ut6AO6K67isEhnZPYMlo6U8ZW?=
 =?us-ascii?Q?a0JTyU83jIMV4OxFxDb1MJfLLAxmUnwC/2K2el4e1c0d98hcIZPstIV3EinL?=
 =?us-ascii?Q?IMD9LongiZULAG+nG5/YF8Os0Uwu/+L5fHW0SF4mEgVikzF5fI5MBrzrPEgq?=
 =?us-ascii?Q?qgo5PD3f4pGJDaqK2rolW+iZt4M7PZaLskM+lGfR0K+3h5UV7dy3fjKFk09h?=
 =?us-ascii?Q?dJwf8B073eyQX9BBl2AWkNQEDOL+EO0D2Fc2pE57cH/ICRYFlUWOnFJ98obh?=
 =?us-ascii?Q?+6o92VlrYb6B1oF+TKkAMAU/wM5AMyCKZwH/Xq6aXDM/bjxs1UzeqaRESWSr?=
 =?us-ascii?Q?flMALboyjLrEVtAWZQh0h/bPyo+FqYHvgQ4z0DF3?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05469dc2-3ed6-47bb-401b-08ddb780158e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR03MB6088.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 02:44:50.5013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSyj7tXj8VxCiEpr77gQlvpVtryDOqQKY0VusQTdbx7EmTGDyFS4ZlRPSkzUGVeanSskrZWujQx6XVbolnlvzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7476

From: Fong, Yan Kei <yan.kei.fong@altera.com>

The changes required for the QSPI subsystem. With this implementation, the
read performance will be greater compare to single bus width when trying
to read the QSPI flash chips. Below is the test results:

$cat /sys/kernel/debug/spi-nor/spi0.0/params
...
...
opcodes
read 0x6c  -> from micron QSPI spec, 6c indicates quad output fast read
...
...
protocols
read 1S-1S-4S
