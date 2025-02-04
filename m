Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB5213C9D4;
	Tue,  4 Feb 2025 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664330; cv=fail; b=lnY3phx1xR7FfWOkg7QSugfswk5zcKo5m9guu6CRkA2cHmCpDIWxMlKofl5wV9SjIrdJ74Rfp47n/GObyVK9DhnWck9OP/H2mxLmVBi56SPa0Ty1qCUv2byHkPfqWCuoFkInfM/D4fp51v4mN0xAVvZ4N0ad4AQu63qiv2lWuO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664330; c=relaxed/simple;
	bh=HyN8qB12mBBap5Z0xgiwxm5P2ZLyVuxihDa28EBBbxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mFtN5SrNvEQR60q9Jcp4VMOTGbGi7lXTs9CLOwHpIckAIcOuoYPvZ8NL4gIlee9Y+vHV6WlK4Q5XOQXbVmoTOpZQ3QFgRgoS9OUTFStDUGXPn+Siy3zPhRZJuZX35OpB4zHtLgHAaCEjZQ+tEYFG+BHww6aS5xfDMwQ0LxXQzkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SdkEC9p/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iV3FcpK+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SdkEC9p/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iV3FcpK+"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148uE1t030955;
	Tue, 4 Feb 2025 10:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=w9dGQT+I12sQ9JnF8d
	BcCFwvzLWeEHlioIes4wem0Cw=; b=SdkEC9p/B2D/at/6Fj6Xcvynt0cotObHxm
	gcaKRmybgE1Brqef+hGdK45ozdtnEfdSnZSQ3lmGq8UlgcBHH8hi7oVPi8a4Gz6Z
	BiifWoZQpFaMiBxa668h+b9NqRNYSNPdRjECEANiTw9GmoPrxJ2RCQ/q1XdLagD9
	5+qzo2++TNg856O6BE0NY490HzZg53qIz/6E8LXFuJQzpJgZOmI0luzCiWcRb2o/
	M6q1rpYWja3qQUD8WD6xjYP6Chw1bP02iMWZbuj1tpDP0CSXPv4NFwA4WuyezEAm
	tCOsRAanc1usqkv76f8vLb7SJitEYLt8vdXLHGJqHzL+Ym8hKOSQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtchd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 10:18:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5148DQsf029923;
	Tue, 4 Feb 2025 10:18:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p2t0pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 10:18:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6DzR8s+TwpS6ZZ1mqGV4J+056cabF65JCxflA5Xfl/Cg3GuogMYeL9H5tg1n5FYjgxFw67fBRdiIN29+r4lTT/ssrzrL3y9q8sEi7O9JvTEBAUk2gR7O2s73rIVz5MccqMRUFofWUM9C656E2WKtMLpHy5AWUmdn5zSwoXbbs6Xifs8qFLMgtduVvLT8Qg8HBKLXOy6fVKf8ai/AzvBE/nDLz2K/8moUZAMKe3GuiXoMRMR4TWhTpO3SklQo4cYC2y/UEAmXlbfHTP3wZaZEct5561YmO/fxC6zxdRTxUBG2m2AGv0nvjHP0h9YPeZB278/kdtQzuSnQziUP67Lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9dGQT+I12sQ9JnF8dBcCFwvzLWeEHlioIes4wem0Cw=;
 b=bW/osN+3ZBhGuLOAO1kkB4ZVv0Cy9VIBISUlRYFZlRVlU2cA28Q5uIg481tvbF2kS9Lbr5+pnN9Jgw1RUoZ74e7YDE0x8+bf7aVc3lOMR2T8eYr/4FLMRFPgDWtj0P6OrXWetUB9MGmB4WhSSjsOMSASES8J3yDTDVNzt+LwPPCHQ7uZnxUAFAU6d2KZ+yiNOpX2FjP2pnGNgvunMLtTVraMDRsDue9ijmO1J5OwnJ1sgpuCHtJlG1Dn0Ny58MVgqLr27Zd5Ad6kabPC+6+oXrnu+5oxORP0+ZHrpfOaNMg0GusOOsH4U/BjPSJE5dzu0Wvwz204okttfnHZ2twEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9dGQT+I12sQ9JnF8dBcCFwvzLWeEHlioIes4wem0Cw=;
 b=iV3FcpK+iGWrJqBV4AwoiozIJk65bBkYhPtLBDONACGh6gnpTc+sSjGvIbSXqb9ZmRn7Ux3HASPYY/3PTuVenDYMMCuMa2vzimg47kIP84qXUrpkfKY/Yx837c1aEzrSukgz/Mi3vcBGYsZ0CKYVmHB/Sfa94eu+2T+tmo4GbCE=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA2PR10MB4618.namprd10.prod.outlook.com (2603:10b6:806:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 10:18:30 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 10:18:29 +0000
Date: Tue, 4 Feb 2025 10:18:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
        workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] get_maintainer: stop reporting subsystem status
 as maintainer role
Message-ID: <4d914b58-af27-47d5-a0da-3950a2530e92@lucifer.local>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-2-83ba008b491f@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-b4-get_maintainer-v2-2-83ba008b491f@suse.cz>
X-ClientProxiedBy: LO4P123CA0162.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::23) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA2PR10MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbfc858-64c1-4d05-628d-08dd45054554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PYv9t/4Y+O46RkQXP63mzL7eyh/e+zZlaNCTTs3PHSUx2oe+pyAwH3B8ZNJm?=
 =?us-ascii?Q?wGjo0Xv5ZXEcfIUFHMSQacPJpl6YtribLktCokN/nRv07lGrUzVVjWSWiAC4?=
 =?us-ascii?Q?PL8L5yTxg/wJt1aBgzyDPsAlo7NZmJJc+EkjjfGV5HD/yF8NjGcRtq8KE7XU?=
 =?us-ascii?Q?bJRCLfajgDaiUuB/883oriXhnLqjaHEF0LoRastTfs506SLbv2MajaiKn8fa?=
 =?us-ascii?Q?21GlLxYJ/368LlDUZsT95MvAyhl/1+0JNhJMVo+KwOLaeb2x9GrHeybwShlG?=
 =?us-ascii?Q?xH7toBwg5q4UdDZkWeVtW1WszVKkOp0QSPpQpxaKV7t0LTlhEo64Ffco3uqr?=
 =?us-ascii?Q?ticejlohTf2Ci4QMsqGwLXYJZAFP7neIWh+6GREVKAm7NsMEpXPcbFMewtzk?=
 =?us-ascii?Q?2+gJErmu/ly9mDf2xHm0nZgX03BzlByRsYWrxsu32nQAwH+by/AIOf7Be4S9?=
 =?us-ascii?Q?4zHbBgby9qS885Pv84NZjs+hEs/p5UD75dzQj0ALTCljyHknCqFhsv1VQfN8?=
 =?us-ascii?Q?YJyjMEs6CEpAr9BU/ZyzrZdmWYYJUpaXV+lQBr3ZyOZlNiW20TB5qVAfRm4Q?=
 =?us-ascii?Q?qeyVtDvytDfJik7Fdj0a+2lvMRnfyvsj3ETska248J3sRJLGmDm9C3YDw/Kn?=
 =?us-ascii?Q?2LxqIApP6o0VvbMTlj+aKYGd9qTljUhh7bIAYNdweRJliFVu2eWcm7xGGs2c?=
 =?us-ascii?Q?kPC9k20BQrd3FJmj6ksNZyodndowJooMnwjGStm+X2KoMQFJInxBFQFq1vWP?=
 =?us-ascii?Q?K+J0q6JQGSFt9MWDoubZj1z1vFPFx7ivCb1rmMjRfkISIZ1rb39Nn1BenL9D?=
 =?us-ascii?Q?au5oZ+/N6YmqrZvQMwTRAHWLlQpg29rTlxUY+icn52KaeyC2STGxnFLl5pum?=
 =?us-ascii?Q?OJByyJcEtBjZQx4Dep9WOBqHL61Z12MM1POrnXBOgv1VRiKEV2zx5obBGz4Q?=
 =?us-ascii?Q?6X8iSybHdUoaGf+twhmnjq1A/cWf9gWOjz4Fezl363NDvoO7p0mCKpPlfoer?=
 =?us-ascii?Q?7c6+nIwKY7K06Rwq/0FTkw2lAzmQH1KyMDcXPypRfWYHnstQOG3xmySH2jWR?=
 =?us-ascii?Q?Kf3T5IwZWLe+ZPj+y9Th1/c1/mj3iyLnjV2OVSXFuTonZvCTHwjwa10ehODs?=
 =?us-ascii?Q?hzVX+ZLVhR+L4HIAaqJfb5GugY0mynHd7eOVZIuw455TVaOqXLosKxqzHDcy?=
 =?us-ascii?Q?Kzb0Hzv8sgHtChks4ms9hbud3WswG/bfFrro8kZVQ6bWlzgCTX1gU5yfgKHN?=
 =?us-ascii?Q?wXZnG6ejChMFWWHgt6lM+DlNZfRsi0M0c7r0dGhxW5bh8Z1zPz5iCYWbVGeK?=
 =?us-ascii?Q?SCpAoIfqY89aB1uMThrJoUVSrupP3iPcR9bkCtrxwDzXiqFTzOM/4OsUJXbZ?=
 =?us-ascii?Q?fKqUJBiye34/vHlyZgevb7NW+uUn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bwyQm5m6gmoKy36d6c4SSoP0cMFy2zS7Ut7r2Uc9S0XbQrrz4lIhnonL2nZ3?=
 =?us-ascii?Q?e1e8sksCYe98j1TZeBF7v1aQc9FDRaX2KAMskeBOAalRrvB54HuEQpADLsJ2?=
 =?us-ascii?Q?Oz7KbhmCrXZGLyOY9+xa0m0OilMhj3zERDhfu3TJcyG+WdjwRNKnwlir/ph8?=
 =?us-ascii?Q?RApuz7Ur7994HEGz3P7DW0snkYykqkLNIszpYgDuwQRncFETtlD5SX1F6nXs?=
 =?us-ascii?Q?wMRhcVrJtki1qaST4rTKEFAahUojH0DQOCcq4uBm1thrlZ3CxKxMcBQxmGzS?=
 =?us-ascii?Q?iPaAtWvH0QfwtBbmUvw4uTVlmW409IMSSVhJ1Noq/bPwprnaZWGAUOtW2aPX?=
 =?us-ascii?Q?CRZvKlc76Lfrdq1PNMZEw2qcBpY2F89jA40gYYzvKKZbz5VXLCH5AhwC082v?=
 =?us-ascii?Q?UTuHfL+85DEh7UggDJDp/t6ZymRoZiLPGtXUDT1kfF/CeZNXJsM+4g1P1DS0?=
 =?us-ascii?Q?XGdEQlDlffjL/GDyN3WaNGlluoS14uShhJJ3HWbzZOu8o8Tx96Ffn8AxaQi3?=
 =?us-ascii?Q?IxTQCTKrMLdpt5bpK0G2TiTrgXYgbS/jjCnPQEp3QcBBW0/0mvnjCGLYz1XE?=
 =?us-ascii?Q?APrph3I35qO0Xqj0+C/eKN2mFVC4y/eove+PGdfBQAgmeztNm2ybO0HxFxpZ?=
 =?us-ascii?Q?+68X56E60nYAr5rue/Sm9XNsPRgLb+uvmD/pxRLB1+RGgyiLITJ14knHJ2Er?=
 =?us-ascii?Q?jEWt+lFXgT7d1S+2wiBGlIGsV1yJazhD62jMXpSC622gfREE5GB1VEAz2oBy?=
 =?us-ascii?Q?GhVV5SDklCATv6E/13AD0CBaW+bU+Vh+vUGyux6hkrI3ZCGIwruKWSvf/fBM?=
 =?us-ascii?Q?fyJZ/45RIXUoV5GDQz4gnHF6dxaTwGPqVsSR3Tptzj9G5oPw5H8+SxOWxO2n?=
 =?us-ascii?Q?qn+qezX/BO2FmhwdApGdIvU5wlKWqhbJIXuurZOjNwXzGAYzJjbL++JlN48O?=
 =?us-ascii?Q?5YsxhOtsfOWYnekgY3qYUx8RFSedxvwTOPzb0Q5RwZYUygwkq40l/QhnV930?=
 =?us-ascii?Q?mQbTOM1PlVXi/bBd3eH/Nv2lOvwW+tOpm4Aaqs6h5G6gLXlvFHBtoEr1M4x1?=
 =?us-ascii?Q?GdKJcpz1ezP5vUwzbaucnZ3ncHPzbfbL0wovxNCXhtoVVXqBnfoRqnTAdZwu?=
 =?us-ascii?Q?9u0VlPjKgZQxKuyrmuWSlIkUX2yZxAHwqasVA9HqPWrSSie/CKZzQaCgu/Qd?=
 =?us-ascii?Q?p0Eq9AQt1sXdim7pFqTYZijZGBppPiwDeCJyP8FzuxwDCc5Sbbv7CtLaZQC+?=
 =?us-ascii?Q?5TK5JN9PvYb0GABzoS9JxrqDJiMDxPtPPqDHkB7peWpdePDNzMoHKDK+Htqw?=
 =?us-ascii?Q?on7KBcm6UBHMLlblIoB6qnhYOI2YzWqyWpCyIHgEwOUPhGpnVdytm3cRr2oH?=
 =?us-ascii?Q?Y+mMNgcel+Ib7xt7JFBtLC+oJqEYDxY23KmLm+KodiZ4y0nUbPcZOzD8ffPd?=
 =?us-ascii?Q?1XdckPnE8OomEfjn6nsXr7ikTsUxxFVAW4mFmeJsmbxQ83AUwwC7NSPfIyps?=
 =?us-ascii?Q?FB0copeqioOkLH6K1Qjb7vI+W+Dczx/pDC8VtK0k7nmlPwK3NmI9YokDR/Xi?=
 =?us-ascii?Q?4r/23qzzPpvUlZvHY61zkYwFGp4kttT9M569ob1wSTzcBpRCO4tmMqFVmdi8?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	irsFhJOh6UGVhwMwaQxfy6w5hZ8cwS1qIuLj0WtYboOtpjfGSpudrHZGsv/pU5a+Ma5BcqL8iMxftD9FXbYDUFeRvvo6Hz+3xgCarv0+/CqmKA+kSMAuj+Po+JVA0rFwoyBNI7R8traff0LqGRSTAOejG0zHhN7LarAgJO+5GjN1Wdar0ebbkjdvmUfX+C7BjUUqo96NWc/70Tt3prZ6IU7mmvxI6MTCXFmwJ2Swmnf0TIWjkT5MlEFQGJE6iYHlem/0Dzd3Zs7ENJyvIWb41s6fBhGasaDM3/vcXNPwPxAqHY8QQh9TGzedJ1R3RB6jP7LH0ySCwPco4ZBJJ7NTOqZk7h4PbPK3NC+0lkES2Gnwr3qzy1ck49NEbMtIX+Ky3cCHMd3/Cx0rOaFGlPI/yMcgHY2MNsAlaHPhLcjciAUfGOvKu/3oqccq9sV9TAXYUNwF8v5mSIBNEP1YcXd3aKxBS9Lrd2NEelDf6cJnBtSavWgKuyKfAuypqQOOLZwwrlcntqEsOKEpK9TZ/4eB4S8ixCBwnErpNcZNwCqovYA0Kkke+mX1DLkBzPgnHj3HoRhid007cJpcUbundYogRV76n1FttcljmGfkWfNy9KA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbfc858-64c1-4d05-628d-08dd45054554
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:18:29.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F08dGgESFCTa6JlsEWcjEeye0nr2ypqolHqGkCq9+YE9Ha/wlT4wsjlSYSKtIaECWXHE/gmtTkb2zBkGfJRzPY3/oTPps4evne+Z0H2vgs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4618
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040082
X-Proofpoint-GUID: V19wYi9fMYvO3Noc0YhGnTKnNDVpDLhT
X-Proofpoint-ORIG-GUID: V19wYi9fMYvO3Noc0YhGnTKnNDVpDLhT

On Mon, Feb 03, 2025 at 12:13:17PM +0100, Vlastimil Babka wrote:
> After introducing the --substatus option, we can stop adjusting the
> reported maintainer role by the subsystem's status.
>
> For compatibility with the --git-chief-penguins option, keep the "chief
> penguin" role.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

LGTM,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Tested locally and working, so also:

Tested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  scripts/get_maintainer.pl | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index da7fc70f17cd8d46b45da8db0b2029bb11b25af1..cf902417a52cccfd5dd00ac7d2fe43d9f43d2528 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -1084,7 +1084,7 @@ version: $V
>      --moderated => include moderated lists(s) if any (default: true)
>      --s => include subscriber only list(s) if any (default: false)
>      --remove-duplicates => minimize duplicate email names/addresses
> -    --roles => show roles (status:subsystem, git-signer, list, etc...)
> +    --roles => show roles (role:subsystem, git-signer, list, etc...)
>      --rolestats => show roles and statistics (commits/total_commits, %)
>      --substatus => show subsystem status if not Maintained (default: match --roles)"
>      --file-emails => add email addresses found in -f file (default: 0 (off))
> @@ -1298,8 +1298,9 @@ sub get_maintainer_role {
>      my $start = find_starting_index($index);
>      my $end = find_ending_index($index);
>
> -    my $role = "unknown";
> +    my $role = "maintainer";
>      my $subsystem = get_subsystem_name($index);
> +    my $status = "unknown";
>
>      for ($i = $start + 1; $i < $end; $i++) {
>  	my $tv = $typevalue[$i];
> @@ -1307,23 +1308,13 @@ sub get_maintainer_role {
>  	    my $ptype = $1;
>  	    my $pvalue = $2;
>  	    if ($ptype eq "S") {
> -		$role = $pvalue;
> +		$status = $pvalue;
>  	    }
>  	}
>      }
>
> -    $role = lc($role);
> -    if      ($role eq "supported") {
> -	$role = "supporter";
> -    } elsif ($role eq "maintained") {
> -	$role = "maintainer";
> -    } elsif ($role eq "odd fixes") {
> -	$role = "odd fixer";
> -    } elsif ($role eq "orphan") {
> -	$role = "orphan minder";
> -    } elsif ($role eq "obsolete") {
> -	$role = "obsolete minder";
> -    } elsif ($role eq "buried alive in reporters") {
> +    $status = lc($status);
> +    if ($status eq "buried alive in reporters") {
>  	$role = "chief penguin";
>      }
>
>
> --
> 2.48.1
>
