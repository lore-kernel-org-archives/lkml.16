Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A720F079
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833171; cv=fail; b=HDQC/KsPm1FHUkB7h7lsoFGIT77l9lcexMFd7on65mxnPljvWRZ3P07YYfpuswA8Gy3VoGNncNbYfn3cVsEWhlKPx7lgZ2CDWFIfKCOACcRYGWhQF3vpEgTaLweffZLoCk6zODbge36PrDOcYxKYdSmejhSrHyM20Vzn2bGHaPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833171; c=relaxed/simple;
	bh=mojzJlabojmz28lJi/iRatxYKTqVz1Cj+UwX4QCI3zE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hPGZwHl/7eMB1//Hpy0iP4wpYPM9CNZqeoAl5bKXZqydJmEy7G1kI8/7T14BHkvceOaAq6rySqOGJ7ydqT4XcLgA+KiowL3WF5dd+I8JW2I/EcE5Ef8nDtxwKf4aDjENpH+k05dWSSv1dnj16RaAvtF8ryaMtPq8yJGJpEHGqCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grLuWnwU; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grLuWnwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750833169; x=1782369169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mojzJlabojmz28lJi/iRatxYKTqVz1Cj+UwX4QCI3zE=;
  b=grLuWnwUPZ9I2aRcjFVNhgOokWNc89B1t6mlIqRZ/fMUWPpNFMYUnWdj
   yDAnM60Dg2shAVuf5FOfBTvzICvDzmXkxgbuaNiz7CjVBHAYvEaLMxUSM
   Zc2rlE/2XU2ZQ6Vrmde0FyjAGrJwYyE80ZiAvh3dldo8B+xRfizAll4yU
   wPb/7iLwkYLZR3WSHQyde/U8lk1BUOtQSZ1cGyPWHhgvxhx1QfjqoxguE
   O/WtLw/vtJIRCuxR8fs/uZp5PLvYzB0U5huFVbaM34ik9rDRTdTYgeQlf
   QR7ejhXsmz5wHKezhBxjOXjNPPxN5XkOWvvGwLZES+0fVHWIAsAcXna63
   A==;
X-CSE-ConnectionGUID: tBSFgTDUSDKQBcSqAGxHuw==
X-CSE-MsgGUID: YRsCrBe+RlO7Nqa8+jHZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52959721"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52959721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:32:48 -0700
X-CSE-ConnectionGUID: qWQ3luFdQliz8e5Lsr7z+g==
X-CSE-MsgGUID: CAs4B/XDR+ayPGnl6BJbyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="183162851"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:32:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 23:32:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 23:32:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 23:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkRd20b1UiziH5IwJeYibdK0jKTYaUHnkVh75NASszYA7St24VODfmF1AeyuijdUw9gZHIiiqZtL3RFFpIUEpRemxP4jOW70WQAkEYVe8H51YCLngzwckgN7JA3ZeK/0DEe5seqeUd74cmytosntNCoDRWnL3g640+sYog9LCoFL5yjd+VzkVhMaebzKndgtwPxSQ4p210l1vU5wlpU/yMuDjnDVckyeXPaC0zUwvCFTA0Q8tou4OwrS24ZLQQFbuSCvvucb+tmXL/nyscQaL37kAPGw8c+gKEsqhGYxWL2LCc4ELDnjG8FpGWvT+3PcuQfkslnnqPF2foi5jzfNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ/b4ireyLgT/etw2ll14gh7cQ4/XU2m8dm6pUVxXb0=;
 b=xIxm1Z7MXjutf0QdaHGPik9hKtykjDMCyPFu83nzCgW/GSCqa6AZlAv4veuTD3mGtyUAjXZl7xvqBRgVY6UqALW+yuZu/lnM1O7qZDPEFD3SIvM4Ve7/6qjVIosQqXf4UQtNfB/lCiAbmUcJWb90feKmTKHCZGOY+VN9pLIMTIHD0yim2FO3F82nLG4qBPGmkaZvJBMpdUbbRS/w+9dVNkkocDSEelfk5dJqRwQE9bAerztMGDCmwkPtYDVOHX9om9fQpniE66vnPufbtkIjb1N+iHKVIwGUcKPE6WTwCxvSkCkAzoGA9XpGgX7abfpSQ5wYjgCpvOM3fLzgtMb6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 06:32:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 06:32:18 +0000
Date: Wed, 25 Jun 2025 14:32:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jakub Kicinski
	<kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [ref_tracker]  65b584f536:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <202506251406.c28f2adb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e0dbe0-6c78-4b1e-2e05-08ddb3b2082e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wfyLkttOEtJrDIZyrinHsbcARP96TR4GYvv9Moe5BgjpXD9cuQv2p177Qe3J?=
 =?us-ascii?Q?17ApacNg5qx6I2R41M/cnI2c8izvA/vuK88dFzoLzMIr3epN2Z0G6teeVMFP?=
 =?us-ascii?Q?YmMbYLfAadPxpv4s5RX8IGZ3wbouxYF/GeYYwjb4SYRAjJRCeeAvvRjb4utK?=
 =?us-ascii?Q?b+dCI14PGMGhSCaSrcAar4xVZc0JAClrXpAIOjo4fO78pzNQ06uKlEx4ea5Q?=
 =?us-ascii?Q?ERXDCSFxWb37+WzvsGii7M6gDqZFisqbjKfe1vrtGVN6noP+TqUkKvCEzMY9?=
 =?us-ascii?Q?E6OYxRf5jXtwsJk5BUXFCUwqe3l/WUyGiAsIGQN68rqWqnwCF7R9ivnOvyVd?=
 =?us-ascii?Q?T+UwiFGpPcYMnZiVZ4RxAnqh3VQyX3cWzClUBMfAGoYyM96SifGi8kqxSs/E?=
 =?us-ascii?Q?gbjdjcvhu2AYpa9z04Q0dhtw+r9ifkhRI1ZOxtUGPDCboufjw3jw85dEvToL?=
 =?us-ascii?Q?XAQ4whBN0VFB76v/efnbfd2EUbVNWTZuih4oMUXR6FNA3vhTcxgZslQLG5pu?=
 =?us-ascii?Q?/DwxZbKKQWTY9Elt4DKIbU9YXd5dGEX1lhET7ThJXzdo+3y8JKB2bUFExY9W?=
 =?us-ascii?Q?xhN5pn4kf7LRDc0rKt6nmmmVZPqkMXxl1a4LE92YtoEWwt46e1W03mpG+Yas?=
 =?us-ascii?Q?9ujNJsd8FQKLF9f+9SisKrnUubDmv6yttrngLHiW8qDE2S3f4a9OsM2fyIuY?=
 =?us-ascii?Q?WVI4rkbFYJX3n9IQv6ST1HvYmSRmLAXzjhTAcUK5bNnesnyu+q95w40ikMHS?=
 =?us-ascii?Q?sKTiOLYan1qjimp2q0wdsX+WXigu2PhSWwiSMZoSXe9fuWvtU4A8hnUf4Hya?=
 =?us-ascii?Q?4SRzYMyBmjEX/NzGZZpHzpfCwtnse16LiLBED4Utjhlpz2tGujFNZdHqVM2p?=
 =?us-ascii?Q?Hg1rB2w7UePogWMDbk/UH91cRk2R5EiZw66sM4guEcnYDXTCg4vJCDk0cA1X?=
 =?us-ascii?Q?zSZE0GFODqz8eJmrNqE/i6IxZ+VVMMmMaAXBJRocIOJhl5y3b4y6IJviqf3N?=
 =?us-ascii?Q?9iMwSeGv30cgxHeTRKKZrR1JpSUTw483QwvdBWk4IzjKsb0si5r+OGWt+uUM?=
 =?us-ascii?Q?FXPjXvs6dcvvF3lY4REYKHS91ItXcqeoxQWh4DzvbZVaYARKPxkF95T5YDL7?=
 =?us-ascii?Q?MLU0jY/PM/tkQyjIWU70TkO/GGGFDcu8uGG9Cj73gXlQybqP6K7qeMuXBvek?=
 =?us-ascii?Q?R7Gf7yOjYueZxZBqAeNIZjV9LbZq4ikn22/bs/UFRV3nhFWSRwAnyokp3dkB?=
 =?us-ascii?Q?1Vj6i9X4aN7pWPHdnbo2HkAwhjOyP7T3lgkULKgrSl0jAjcIW0AtfzfO7OvN?=
 =?us-ascii?Q?PdWbtsODksm9CufZJBrm9hwQ8uTY1LtEr52efkRCpg6Av/c6/EuPp7dlh9ld?=
 =?us-ascii?Q?yaSAhKCfyktNqTpwzX1ygX/4Fn10?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7QbK18u9TGVZwPNGjIyJKqobx5rqNB3iADfoYtdS59D0JAGhsHdd+zSosLwS?=
 =?us-ascii?Q?WUkXx+0afYNVLJs+BD3fBpdPNwX1wdDaHbH64at4nPYBaFBNJFbiHluiftJP?=
 =?us-ascii?Q?cydM9DR9cy/avXaf26MS8ibq0V+x0UmYxMJg4FN2VaQYtinx4GhFrDjsHv6/?=
 =?us-ascii?Q?gFGf3s8j1vhBub0oQLI4/LOBiae/3K0Yt+1QsZpmTZtIgC5m4TTbdy8saj2s?=
 =?us-ascii?Q?KBnY5H3wja7w7L6RSHqpAndPlvXvv5fe1dmzLpk4SfCVJvx+eXdeo0Aa8Nk/?=
 =?us-ascii?Q?+O9UVcT5GQq9O+tFhv0hi/TzVRzFyP7A9gDVp36huocl4mTDrj/bxj9Lhw/g?=
 =?us-ascii?Q?1FqfrkDZzf+ddIxyLmoe7PHxXtRqPUtye65dQkJ9O/Ne8b9zNnXzyMgtTdUK?=
 =?us-ascii?Q?+Ue1uW1RefaUTX+IY1jA8C7lIFpCbyRW4oO8RpIU2pIButicnqcz6Wks5xko?=
 =?us-ascii?Q?ANyUKGAffm4HW01V9vY67u1oGZ6YBnSsmV9gbWEpEj14wbU+DR5N/z/vmUrO?=
 =?us-ascii?Q?cSOeFzxavIONfUu/Iyl1C1hUhWlnobCoX4i65gE2Vt/Kf0l5jiYus7+LFS4j?=
 =?us-ascii?Q?C0MydjH5Dfg7YtwE9Wd3hJzhp1/Tfd4jQAk7U/z6XVTgH35HY48uOIXBgNOn?=
 =?us-ascii?Q?AGPa3o5dakgE5lu45vow03UR1HiO1VQohnAadsfqOIjrlODeLdo8R9GnNAOW?=
 =?us-ascii?Q?Ep4/55zHvcjPjMS/Z6ta2bImehXI6wKU8F1ADwUcRMxFd1Ig7he6/KFXVBUw?=
 =?us-ascii?Q?aHu1b9e/iC3uSkZZScsdka/lmbMd7R9grGHpPfE4bPmaADAOhBask7NXqjV3?=
 =?us-ascii?Q?jf2RWhupjho+AI7l67befCf0+akBAz+VNxSD7ZHQg+4EchUHkceh5q4pJYbv?=
 =?us-ascii?Q?+3fJUYdG1LM2lxxqCyJfSJjEADsU2VcF41DB6RXnGWogYvyGEn694giqdxlj?=
 =?us-ascii?Q?y4vsGQVBF5QC7X62ekHmOdkfgzdES8V+azTF+zTkFJNC5pw8lClf6kjlSh99?=
 =?us-ascii?Q?ijAr1M9Zwnwy9K6pQuYVBQE5zS54NeIZWrvKTvtFIlrWqQav1X77SyGJHcpY?=
 =?us-ascii?Q?ZrvUYtjc8P0v2CXVptgnZZMBulPoRf5W5CD+Zn+piRbC4bJqCV64+oAThnBN?=
 =?us-ascii?Q?k7mGZLvwhcSQpEE8jYKtJVsLFz9LH7ne7zhJOhbmReBd1tOW9ZQYgP3NPGcF?=
 =?us-ascii?Q?cLhKw7I6RFzEjwBLk8k0ABa1UOVysegKajePV3k2jFgn/BV8l5erv76HrfrT?=
 =?us-ascii?Q?utJNTVQuYYCUrTLTrn2RIkyAM6jPdYAQdlOf1T0NrnRTXuQtinqx57RJ25Tu?=
 =?us-ascii?Q?4qABOPYOwgyk3ahILnU+ADf61iD2hS3MdgBsA6NxNW5G5pYAIi6495pMIAuE?=
 =?us-ascii?Q?pQ59QKiWMdR+uoRzBSSuSV+7uf/Kn1XueudnlRo81+pin6L/mpDNbOMUTzwX?=
 =?us-ascii?Q?iJPKft2DQvMf8UnEQ2SuHjy8CoFDw2iBiiiVF64u+RV+0h0Yo0Sjxim7Ua1X?=
 =?us-ascii?Q?Mc8Sus3IPKZ/yz2JI48lFU+udifkbM49MRKSZ7unc1eTfbOWQCFFze0l2Sg6?=
 =?us-ascii?Q?HVQd9MooR82pe5DVJ9X019TL4tt627Cju1qwvaGYyFsTIJz8iw34zrOi8O1/?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e0dbe0-6c78-4b1e-2e05-08ddb3b2082e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:32:18.1664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iJPGuIJdTP6P1mxfwSbtejKhS86VsN1xy8Qpfi8BwrKl0ZhYN0eFg1egWoSX96YrRP3QvOTXvpQZjxuz8vSVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:

commit: 65b584f5361163ba539d2c7122ca792c3cc87997 ("ref_tracker: automatically register a file in debugfs for a ref_tracker_dir")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f817b6dd2b62d921a6cdc0a3ac599cd1851f343c]

in testcase: boot

config: i386-randconfig-141-20250623
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | f6dbe294a1 | 65b584f536 |
+------------------------------------------------+------------+------------+
| BUG:spinlock_trylock_failure_on_UP_on_CPU      | 0          | 12         |
| WARNING:at_kernel/workqueue.c:#__queue_work    | 0          | 12         |
| EIP:__queue_work                               | 0          | 12         |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506251406.c28f2adb-lkp@intel.com


[   51.542685][    T1] BUG: spinlock trylock failure on UP on CPU#0, swapper/1
[ 51.543194][ T1] lock: debugfs_dentries+0x0/0x34, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0 
[   51.543194][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.16.0-rc2-00006-g65b584f53611 #1 PREEMPTLAZY  672570e0a87e353b344c305ea64104c56bf67f95
[   51.543194][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   51.543194][    T1] Call Trace:
[ 51.543194][ T1] dump_stack_lvl (arch/x86/include/asm/irqflags.h:26 (discriminator 3) arch/x86/include/asm/irqflags.h:109 (discriminator 3) arch/x86/include/asm/irqflags.h:151 (discriminator 3) lib/dump_stack.c:123 (discriminator 3)) 
[ 51.543194][ T1] dump_stack (lib/dump_stack.c:130) 
[ 51.543194][ T1] spin_bug (kernel/locking/spinlock_debug.c:71 kernel/locking/spinlock_debug.c:78) 
[ 51.543194][ T1] do_raw_spin_trylock (kernel/locking/spinlock_debug.c:133) 
[ 51.543194][ T1] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
[ 51.543194][ T1] ? ref_tracker_dir_exit (lib/ref_tracker.c:54 lib/ref_tracker.c:226) 
[ 51.543194][ T1] ref_tracker_dir_exit (lib/ref_tracker.c:54 lib/ref_tracker.c:226) 
[ 51.543194][ T1] free_netdev (net/core/dev.c:11880) 
[ 51.543194][ T1] smc_init (drivers/net/ethernet/smsc/smc9194.c:729) 
[ 51.543194][ T1] net_olddevs_init (drivers/net/Space.c:191 drivers/net/Space.c:239 drivers/net/Space.c:248) 
[ 51.543194][ T1] ? ether_boot_setup (drivers/net/Space.c:244) 
[ 51.543194][ T1] do_one_initcall (init/main.c:1274) 
[ 51.543194][ T1] ? ether_boot_setup (drivers/net/Space.c:244) 
[ 51.543194][ T1] ? do_one_initcall (init/main.c:1291) 
[ 51.543194][ T1] do_initcalls (init/main.c:1335 init/main.c:1352) 
[ 51.543194][ T1] kernel_init_freeable (init/main.c:1588) 
[ 51.543194][ T1] ? rest_init (init/main.c:1466) 
[ 51.543194][ T1] kernel_init (init/main.c:1476) 
[ 51.543194][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 51.543194][ T1] ? rest_init (init/main.c:1466) 
[ 51.543194][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 51.543194][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   51.578771][    T1] ------------[ cut here ]------------
[ 51.579764][ T1] WARNING: CPU: 0 PID: 1 at kernel/workqueue.c:2325 __queue_work (kernel/workqueue.c:2325) 
[   51.581319][    T1] Modules linked in:
[   51.582069][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.16.0-rc2-00006-g65b584f53611 #1 PREEMPTLAZY  672570e0a87e353b344c305ea64104c56bf67f95
[   51.584508][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 51.586299][ T1] EIP: __queue_work (kernel/workqueue.c:2325) 
[ 51.587177][ T1] Code: ff e8 ca 85 f7 ff e9 e5 fa ff ff 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 90 e8 a5 85 f7 ff e9 1c fc ff ff 8d b6 00 00 00 00 <0f> 0b 6a 00 31 c9 ba 01 00 00 00 b8 70 b3 dd 8a e8 1b 52 11 00 58
All code
========
   0:	ff                   	(bad)
   1:	e8 ca 85 f7 ff       	call   0xfffffffffff785d0
   6:	e9 e5 fa ff ff       	jmp    0xfffffffffffffaf0
   b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  12:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  19:	90                   	nop
  1a:	e8 a5 85 f7 ff       	call   0xfffffffffff785c4
  1f:	e9 1c fc ff ff       	jmp    0xfffffffffffffc40
  24:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	6a 00                	push   $0x0
  2e:	31 c9                	xor    %ecx,%ecx
  30:	ba 01 00 00 00       	mov    $0x1,%edx
  35:	b8 70 b3 dd 8a       	mov    $0x8addb370,%eax
  3a:	e8 1b 52 11 00       	call   0x11525a
  3f:	58                   	pop    %rax

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	6a 00                	push   $0x0
   4:	31 c9                	xor    %ecx,%ecx
   6:	ba 01 00 00 00       	mov    $0x1,%edx
   b:	b8 70 b3 dd 8a       	mov    $0x8addb370,%eax
  10:	e8 1b 52 11 00       	call   0x115230
  15:	58                   	pop    %rax
[   51.588586][    T1] EAX: 8addb388 EBX: 00000000 ECX: 00000000 EDX: 00000001
[   51.588586][    T1] ESI: 8b872e60 EDI: 8125cd00 EBP: 813bbe34 ESP: 813bbe10
[   51.588586][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010082
[   51.588586][    T1] CR0: 80050033 CR2: ffdd9000 CR3: 0b057000 CR4: 00040690
[   51.588586][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   51.588586][    T1] DR6: fffe0ff0 DR7: 00000400
[   51.588586][    T1] Call Trace:
[ 51.588586][ T1] queue_work_on (kernel/workqueue.c:2393) 
[ 51.588586][ T1] ref_tracker_dir_exit (lib/ref_tracker.c:227) 
[ 51.588586][ T1] free_netdev (net/core/dev.c:11880) 
[ 51.588586][ T1] smc_init (drivers/net/ethernet/smsc/smc9194.c:729) 
[ 51.588586][ T1] net_olddevs_init (drivers/net/Space.c:191 drivers/net/Space.c:239 drivers/net/Space.c:248) 
[ 51.588586][ T1] ? ether_boot_setup (drivers/net/Space.c:244) 
[ 51.588586][ T1] do_one_initcall (init/main.c:1274) 
[ 51.588586][ T1] ? ether_boot_setup (drivers/net/Space.c:244) 
[ 51.588586][ T1] ? do_one_initcall (init/main.c:1291) 
[ 51.588586][ T1] do_initcalls (init/main.c:1335 init/main.c:1352) 
[ 51.588586][ T1] kernel_init_freeable (init/main.c:1588) 
[ 51.588586][ T1] ? rest_init (init/main.c:1466) 
[ 51.588586][ T1] kernel_init (init/main.c:1476) 
[ 51.588586][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 51.588586][ T1] ? rest_init (init/main.c:1466) 
[ 51.588586][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 51.588586][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   51.588586][    T1] irq event stamp: 225562
[ 51.588586][ T1] hardirqs last enabled at (225561): _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 51.588586][ T1] hardirqs last disabled at (225562): _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108 kernel/locking/spinlock.c:162) 
[ 51.588586][ T1] softirqs last enabled at (225310): neigh_parms_alloc (include/linux/bitmap.h:236 include/net/neighbour.h:113 net/core/neighbour.c:1687) 
[ 51.588586][ T1] softirqs last disabled at (225308): neigh_parms_alloc (include/linux/list.h:169 net/core/neighbour.c:1684) 
[   51.588586][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250625/202506251406.c28f2adb-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

