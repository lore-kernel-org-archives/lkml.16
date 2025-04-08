Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755C223715;
	Tue,  8 Apr 2025 01:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076252; cv=fail; b=dlOx53bmISAj9bGh+UQsGExXo9OI0cyqIgAKJY93Jt65WIy0qlhhO+5rniceHpm2XFJrRotUcwZ1shq9wWY6oW5jXFg37qhF4E1nKMByjZTuZBeDZkqNsTKy0GFbyzOnwtw2uLO7upodJm8j7yq3FtwXPfhur5zqUp6smJLczII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076252; c=relaxed/simple;
	bh=m0Y2f14o9d/SeqIVJPTJdO2r/8IqOcK6uFEWbh07IVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eqjuTC5N9kKzsupqwuF4vqDwSvzN/dJbiI0bvobnn5BW6LlUQ09pJmVAq4mdxWIORy7LCjvXzIzVNbBynS8lTr0MOG1oGxNGZMe9UzDQbexNoUbLIFGH2Yl7nhXiS97QJPzI05lK7dr163uyl7OtcrC36MIc30CQ+f2fRv2+eI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lNrQj6e7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hHQ+qY5i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lNrQj6e7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hHQ+qY5i"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H0jHY024548;
	Tue, 8 Apr 2025 01:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=880bCp41suFtTTwjxk
	XyggF1Cld07/1RDbAMxAwAbp0=; b=lNrQj6e72TpXX+fcUG3a72AKnkMGnr2WQZ
	ihxB4tShbUsrLfFC8xivtwYkAKl+Zl2EzBk4QY+1zMU/XI3wi07sedqq/Nqci3VY
	lnRBOo3fx79Bk/8jVW6yQ+Uus88v5XrXC6BjB4dPx0/KMFNePlpp0hLKzG9dn7Sj
	UrxicDJyCePAFG/wj1mVgViM7GiOAd8g60W/wTIyVTGJJjo/INqaUy6avYS3BRMM
	rNlZYLI397U2KUqhFkUTam0BKUnE8JOvuxkC7Q8KdUTBTDVTBJHJeuvxDkjNoqzU
	QqHg/i5p4C4LGqFbnOwdEfa/ci8MwMkgYauSpomHPj4WWW1d0HZw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvd9urfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 01:36:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537MhSGg023813;
	Tue, 8 Apr 2025 01:36:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyeuvxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 01:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neJL2Jsn8NsmmerxZV+JoeFGzSc1Z2mQvFqw64dOBBK2YSPeKXa18RFFvhZGKz3hdrupytxsY0JJmKt1/pGBTymj+TR/2CqghiXckZZlZgbJlT27pTiZNF2YuTWk4czEHLxsKGg85K8uO3lTsvke+2cI9n1r83z83MbcHG5NAuhNcdN9RcBbhDyzwU840GROtAMCXUBIozPnowA9DjiYd9D4okGUBaB3b6ir9RKads0OcBSZKxmPoMml2LqseOh/7wHQ1k9u+kD/4/D3cUoGJFQvCuuB6TWgMEf3ee1wsiCQl8akjJAfaRK4cjhWIGZ/nVIaLgRPuaVvPIgJRGenHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=880bCp41suFtTTwjxkXyggF1Cld07/1RDbAMxAwAbp0=;
 b=ywPptbXdJcvVcSEd/ZKTBMs3Ct/fMJGBnfl1yrkiznZmXL8F1e9p+/GKScWopOjz53Y9//tyl4DXIDdrzpEObGDdno4Xm9ZqWdRG1dzKFoUx20SKQCj+U3xHvxgI3BH8C1i/gvUwHHr253an6xl8MsVpI9X7/H38jk/WelbKvUo+VkAUvJhv4K8SIqWpKc6Tgg6eFp1H++4JedB0yId1lb/qIW0RNIFN8zvLfSc+nJlls4ByrpJ9KE0u+b0jdSx1JEBW2GJRe9vawbNmIBUZNHVhHmVc52uOS4aCohqCN0CRqD/5KHj8ReBWP7QV6YdtvJSA6dbG0eG3rTjc4qttcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=880bCp41suFtTTwjxkXyggF1Cld07/1RDbAMxAwAbp0=;
 b=hHQ+qY5itAteuiLFzDR3EX2dGuuCUHMX4yHm+mRchPp9QrUL2vW45KRUhfQRetEHWnmFic9oPFPFsChjQU4fyxDFwTaIpZhPJYK6tPw9NY5XXRp15CpGXGVQ8CmGP6tZ6vNsILjtfqNVmhRHoYHrdFVVXGJ2+6aXBeC/BADZimw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 01:36:40 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 01:36:40 +0000
Date: Mon, 7 Apr 2025 21:36:35 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: a.hindborg@kernel.org, akpm@linux-foundation.org, alex.gaynor@gmail.com,
        aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, brauner@kernel.org, dakr@kernel.org,
        dingxiangfei2009@gmail.com, gary@garyguo.net,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, maple-tree@lists.infradead.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, tmgross@umich.edu, wedsonaf@gmail.com
Subject: Re: [RFC PATCH 2/2] rust: add maple tree abstractions
Message-ID: <mjn2lz35u6joosddwrbgshgqitwx66fvpie5y4tledbcb2i5p2@gbp2sjva6iop>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org, akpm@linux-foundation.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org, dakr@kernel.org, 
	dingxiangfei2009@gmail.com, gary@garyguo.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, maple-tree@lists.infradead.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	wedsonaf@gmail.com
References: <cons6o6begjlf4eu3wvhplimbrjtns553nugtblki7u23a3u3p@efca7vmgmr6w>
 <20250407200250.1671534-1-andrewjballance@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407200250.1671534-1-andrewjballance@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0076.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::13) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 6930ea4a-37e9-45be-30aa-08dd763dcf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iITTko7OJXSpB02c4CACuqKQEbuBHlggi7YK35CbaA2pdg1z3nvvNHxFo2Xn?=
 =?us-ascii?Q?7FiYyD8IIK555hGxAgzLOQLLj05BMmDIOmIvv75lbjrTD9W7PgQnyzUJ7TF1?=
 =?us-ascii?Q?0Yu0qi/awsAj3bXYB0ldE9VDfk5Cz/PXlx5be0+bYHSvWIK0Ij7lWu0HlBYd?=
 =?us-ascii?Q?vVKu/K/HOo3eqhawf4H+sfZDa5e+OCvwYZmiXPV2BPCTFrM46+gIu7Ck2/PS?=
 =?us-ascii?Q?ftSOoBv/sxh+CXchfDujNe7suf+3GP2GspAzAq8GbHku1x+S7GQ3D5ez/X5L?=
 =?us-ascii?Q?0LUljlrL2NGX52xUQvg1UkwSeRJJo2yNm9HAmOsiG8r4Faf1P3bM3dSTg/Ol?=
 =?us-ascii?Q?41v4SkZvNXuSSO47eGZQE6gxxt6bdpECDw/1en2VYP81SLKGyOt1ri705EO5?=
 =?us-ascii?Q?XjXTsAb44DjESdnExGlt7CJCRUAcwNh0PmNwHy142jd5mn5MIgbufCyJ6YjP?=
 =?us-ascii?Q?DOAQ/Zyw5wQYSid5Z+jE02GuO3IAAj7Iv8VPuti1Teq+QMv5rzC/MeA27x51?=
 =?us-ascii?Q?eDBizjvRv0kg6pK1eEVpz121BICqAMUbx1NpqvbwacVcMee37HxO9Al39ZIw?=
 =?us-ascii?Q?5ZZEMI1VTHG+BHnjlevwuzDDdAWMQ9Jpe7FIdIgUyWMjBfnhOd8d//XlzK+j?=
 =?us-ascii?Q?LgbnEbL4qMJHGE9Tw1JMETUUF6aEkLohPH1tXc/Mkurmw3JFMvar6OQX6559?=
 =?us-ascii?Q?hY7YSMOlwmqIxzQtnHjCoieHOnMli1nyhgMv40ruTbfzLvg+z+yWPYMXoHiU?=
 =?us-ascii?Q?TVZDSnJvXjrElBl6FiaRA6PgWw/zZS74m3UwCACYZ4P/TtkYW3WYUav1qj0j?=
 =?us-ascii?Q?X/DRQW9DK7luxgJy+EsKZD9YREv05KOJQd2HriPwsYOlNhvS6pMmodzylWqG?=
 =?us-ascii?Q?uupayTTU/FpDLkm2FIDEDAt2kwNJNsPlL/SWkxgEtOmbg6FWfhrfKTTlfMUk?=
 =?us-ascii?Q?VFiEd++qXBTorcoD2jc1ikjVNl32PnRCckuA23+uQfCNletWGgOaKPc0y3Xd?=
 =?us-ascii?Q?1SC2tKd4JPOiSmTjkVb19Mcbsh7syR6TtUOjCVdKy+bEgD3rp7RncZOo2jut?=
 =?us-ascii?Q?Gy30WeQCakWwSmkX1+mUq03ZgHlaIHSZck5J0HgcYF2FAI/nQkBhFXyTypbJ?=
 =?us-ascii?Q?+1cWcN9i3+dPW353zbiWYvtOulk8NNN+QsXDKmZlA6rY5u9WzMTuOjaXsdfU?=
 =?us-ascii?Q?QPN9/PXDXA2805stkad8m4/HkK33WheWq29YV5ElvpuK6tk54wNhYjADaBb6?=
 =?us-ascii?Q?qvxbQ5hiy9LlT92dsG+qHcGJIGaMRtzqk8qvUdxl0qvA145BKl90OXknigNT?=
 =?us-ascii?Q?K/0IWlUOozkg/K48oWkLyxAS4t1sO1wvoke/Kun1KFfoAWYwVEcUrxBKrR7C?=
 =?us-ascii?Q?cSHN1PWi8vFMM4GGYdORKCBUtGiIgrYFX9zwJW8sqKCUR12ArQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1wn0vhsdbVHbYBdazD+XTSnQe+cJj1WiNMZf3lhX3dpekjbsx1xEyaqC+GCx?=
 =?us-ascii?Q?l98rpY4I9riDzcqUDyjPBbUw5BLnRLFFna96xWnKhhUVbjxg3R6a07b2PTju?=
 =?us-ascii?Q?bFEtoBdY0THEgEwVTWT9eXJTJsZolysCTSVjkkS4MuZQ5V5c64Y7I3CNeKLO?=
 =?us-ascii?Q?nviCGGNd9N5ghtciRuozJVYGL0olylksW8pJDQoXDaUoiEqma0z+JChnacuH?=
 =?us-ascii?Q?/XXfcXqMJxqX0WRMFAncddRMCGHyykjaxA3v90MLJzDsFEpXda++CX1aZQD0?=
 =?us-ascii?Q?xhauCv7dTTIIQSfbQ2PLTp8eEwbx9wmXDifi7th01Ad+dAzpHW2s7HvWCtiL?=
 =?us-ascii?Q?0IFVqzIbWCs0orCmBnI6s+NBHV8ujvXuDTz65FFC9ANx6Mev3BMsAbFHZM1K?=
 =?us-ascii?Q?a5CKBrLG+JlSf1WQbW7qCwNJdH9T/yWgnBBbsFUHvhteU+b+bpfsyHXrTWnF?=
 =?us-ascii?Q?JfgyiYEbzn9Au9CMnKjwOkgtI+mdH7Fvrp/3WxlCy9omr7mfB9mK8IayK/R+?=
 =?us-ascii?Q?hUwOcdmt1L5wWsMN5VeW9uEB17Wv5EDTK7kxyg54HDkRK5lQFpa0h+WT/hXJ?=
 =?us-ascii?Q?Yos6tmssX5Pde3TqDlApoA20n61QG/rYx9ze0Y+UyztTQAn/694Hn5CgWIY3?=
 =?us-ascii?Q?QoELuVkEQ6DuluOsvX/QhHQCzejwHwvdWP5X/4nHAmC2PsRzpRkJLOWBTzj8?=
 =?us-ascii?Q?LhQlrYKE3JVVvS2sv1c1WBLd2nunpHGaEy2VijRYpfn7BNpvy56sCIiBgGAB?=
 =?us-ascii?Q?Em4MjyMGAgeKQP1eR6NTxOxAvrCwuP25u8QmIncXX10Af5SqcZ6a6lfVvdzo?=
 =?us-ascii?Q?RXwNKmh0k0Z/aybwc2xDD+ZOyhAPXw5mLzUDIF/kXlPy5iHPnAz5xler0thw?=
 =?us-ascii?Q?THUqM9HSCVbqgVrJkdnKmDixEhqMmfhex3/BAwPzoSL883akNaMaqRIppepK?=
 =?us-ascii?Q?KbfpSUJpwl/NI/n04YIL4PCHVzPV2uucWpDSA/T8kBtBGjjTICuCPViIWWUT?=
 =?us-ascii?Q?znC/5nVvF2N/iBHKtZacaDbV1xGh3GZcbn6KXfEQQti7OdSj93QW1PhKzXei?=
 =?us-ascii?Q?I2LDzMpLLOeEKJbqJP3cV94VylHJGezOcEqyt125ddQQ3s0Z9i/gZswlAnXE?=
 =?us-ascii?Q?iPCw8+9xHLxmcf2t8brDDAPvSkH409nmsN5cji1iDElMWZ8jNWmU2zuCdolz?=
 =?us-ascii?Q?d7bk98TnOdGdYv/prG4U2Yd0U4mLSKUvTuU/bJuCCO8/gFowN2WmHzur1dWv?=
 =?us-ascii?Q?ltvNGhdfApjkUr9jyWkq457SUUttvzGlTXjsMdE5z22bsHJoqShGfIKcwQuN?=
 =?us-ascii?Q?F+vP9DUsTBTkUWFvZq8nzJ6KkxsrqpoDF8tWXbHuQ/5ZrDtGoTJhjRxUwZ41?=
 =?us-ascii?Q?keQ074TGoF0+3QHPvVjc1ziiXfy6whBzZID6SfbWKlNy0vIvVAU/HF1tRZyh?=
 =?us-ascii?Q?f7C0CN6Q9GiPAAbTCWYf8lxFnjtb08ZqgRtRha74fdwuqQB8a9QnoiYaO2aG?=
 =?us-ascii?Q?KLBnC7CX1Jpr6cCPq7CkRI5z3Ep2qBNfJdcmGQ3SJb9DgmKG1vq/pXKdi9Pd?=
 =?us-ascii?Q?8xOeaj/y5pmiKaz6P+1cFQUO0lOCPmNFwsEdtoWW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zJGgf9GwP9VFdqdPhGPe/yNhZy2D2d2EW/P47cL8jDtDqxoQs0pFFAIDPVvvppz0AC9GBOv/x09Zg1NdWuMSc/ADJsILcyd8eJXt4+2wvc78trltGnQL4LSlIB4phbs0I+SW55NS6I8MzCwiDtraEaCrkin2ewEi+9lZAmCPWs7zVIQ6KY/8kbkYjaRdoCrQYXa8TnPE508c87tGnZ3/M/GxFCWA+t0WkW+yNeH0XGqSUE+wX0HAgU7DYmhW1LCCu9cRtHCAmUWgF7r8Gg5sgEAss6T5MZEAverN18yC7k8HKyUMq5UBoqOMW9447/fTsHIZXnid14NfaDrRwyeXNkITSL0l1cMgkMJorMcR1+Gc/tCmjNl3a0i4UZ7MnWdyZHSAESOqocqWCiuPRYTJ9628VPTWvh+u4bMu2ZvUOtgTzWSCWWAlLjfgshY4j8daTMrbuL3QXceLw7pp19cdFPpOv4RWYu/AgYxVrlDJRCGqn3uKKIXovEbYObmzKEtLj0ogbAJg5qt+V/SQR4fY05Pl8Ef6xoP5OZkS0/g2YVW1sCnAPLED5t4CQjNNs8sOoQYm8huS2LW1HL4awOzcp7VaUyy35tqGioF/sc+keS4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6930ea4a-37e9-45be-30aa-08dd763dcf21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:36:39.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOJv4S3SXLcwnFL6wNBzn6m+vnONAQUYoiYVyoAEX+RvJX5sSA77YSoB/2VS+y+e3ewB9P6nqKZtlJ7Kc36aSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=772 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504080009
X-Proofpoint-ORIG-GUID: OlJkGc6ygLygCq6oIpdmaB3KWCOS9cwr
X-Proofpoint-GUID: OlJkGc6ygLygCq6oIpdmaB3KWCOS9cwr

* Andrew Ballance <andrewjballance@gmail.com> [250407 16:03]:
> On Mon, Apr 07, 2025 at 09:59:21AM -0400, Liam R. Howlett wrote:
> > * Andrew Ballance <andrewjballance@gmail.com> [250405 02:03]:
> > > maple trees are sparse array like data structure that maps
> > > non-overlapping ranges to pointers.
> > 
> > Why do you think the maple tree is a spare array like data structure?
> > 
> 
> I called the maple tree "sparse array like" because indexes that have
> no entry map to null and there can be gaps between ranges. I did not
> mean to imply that a maple tree was literally a sparse array. 

Yes, I understood what you said to mean it was "like a sparse array", I
just don't see how it is like a sparse array.

My understanding is that a sparse array is sparse because not every
value is represented in the underlying storage, where as the maple tree
defines every range to an entry (including single entries, and NULL
entries).  It does combine multiple NULL entries into a single range.

There is a non-node store of a single entry of range [0,0] when [1,
ULONG_MAX] is NULL, or the entire empty set - but that's an
optimisation.

I haven't implemented a sparse array, so perhaps I'm missing how they
are alike.

> 
> Would you like me to reword this?
> 

No, I don't think it is worth having a rust implementation right now as
there are no users and I could cause issues on the rust side without
knowing.

I was wondering if you read that it was like a sparse array somewhere
and the reason behind it.  There is a plan for a sparse node type, but
there are a number of things that need to happen before I get there.

I've always said it was a b-tree variant (probably b+) for storing
ranges with a branching factor of 10 or 16 (for now, anyways).

Thanks,
Liam
