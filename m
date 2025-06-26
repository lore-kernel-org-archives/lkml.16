Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627A19F12A;
	Thu, 26 Jun 2025 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952811; cv=fail; b=naSXpkRa3B7OXzBxlPagOBxlQ6g7bHFgBOKM7oRkDVl3o7dWR5CFR8Kn756Iy4TKdQicXD3h5OXSZNRO+mnN+q64NmnP8HVegUXZHjBeZ51OsJhItcA+RafWQ8uX39pgnl1EAA70UUYtyFj3wIF8ZNoJjZPLbnasMTgALBLrFrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952811; c=relaxed/simple;
	bh=u9+chvf7xavlAvXKqvv7MddqNYRGeIy4S6hb7M7ou60=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MA2JlrExTY1j3AeRvnl+BqceQDAQ/Kn0ELmhUj+s1BoudNqayzHlCJ5fNbbje4huVJVC1RxGxI51OrL07tTmEzknodXxHlWC8px+LVJn/YnfQeyAWxChf7a/xUljrjce5pN+k5fayQR3AQUeIuKcOr+F8/zUgkyA7D5Ws+vdhDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KY8R+ob+; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KY8R+ob+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPN7azr36RwD5AyNUnSQUTG2X3aXQDPJOC3fFv62ZUzvDvYu7mhnwhhMCf+XWaqnkW53JS5h1SmazS2IFnt9XPUqnT78ZZ9eeNP86F48vmBf4dt8/rI9TMn3PTeqhlK5ELpPM6o4DLGtBi/M3IeG4qmfBAWzi/6FrfT7q2gND2mzkaL4egsqDjp6KKgu9UTm+dmaejs+aLcire82P+2p9Gm/Sy/OWOworvAgWVQoCr9F8VuPZ7dHdaK2tNbsCLYTloSsYwKk1eig+nBzmmnaip0pLvJy7k54TdLJuAHUHi6uNAHs+khZcdR55HLrcQ/Chppf9J/ooZ6jU4TU0KG6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYIFMF7oEvbPJVOFVX76tZn/SfGz/Xy652cdc74Hunk=;
 b=nI3R+b9NOwGnMj39xuOUKmz6TusqxRS4FyaGQPZH1zPhYl/Att0rGkajegTPmaS9T7hVJm5ZkHH9JKWyTgFP7yVNWxonZNXYQ9LWrrwsI89g3NeP6ww9GHoV6MbENlQP1AG4MOVM7bar7EWktUTOFrm7ge1TDpUCc/3k9gPnmVriRVOepuwv7EsryYJtLoJZhpVv09xfu/GWYzogyePvn8U3emRj6DinUOrr2JC01goZsDEfiSVMqgk7DPQu49NSCYR2PDPyZ7gqSyUkDZ74N7GmcSlbrfDRQbwZuecM2jsfRUuHFED6gNq+S2njJeYgMG2TumX9CN9v6iQrBTGlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYIFMF7oEvbPJVOFVX76tZn/SfGz/Xy652cdc74Hunk=;
 b=KY8R+ob+CcHmHC76Gy97CPB1cE1r1siGXzes0TKoDcn+WJPttb1YvTa47MKL/rzK1V0icPAHWa5oHt9KoxfSbvNLm1N68hkNcc6WgzpBlcou5MgCwVMKpN7O4cJx9zA1ZsBajQdJ0pfHae0LBLHk2yxiZDs7kz7x6R7nQDleLJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Thu, 26 Jun
 2025 15:46:40 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 15:46:40 +0000
Message-ID: <33dc609c-53f0-4f18-967d-b5554928cca8@amd.com>
Date: Thu, 26 Jun 2025 10:46:36 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters per domain
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
 <887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com>
 <58d214b6-9bd0-42dc-a00d-cc80bccc8fdd@amd.com>
 <e21ad30b-b6d0-476b-8090-f58a20264fe6@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <e21ad30b-b6d0-476b-8090-f58a20264fe6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:806:6f::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b8629d-2a53-4d54-ac17-08ddb4c8a478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHRuZjJ0cSszMDZ1eU1KMjkvTk5rb0lKNllJZlVaT3JjbzBsK3FaRjl3TE9Z?=
 =?utf-8?B?Vzg4TTlvQmlVTUNnc1BSQVFkamE0MzlpdDMwdGE4amxYelpWaHdSNXBCYzl1?=
 =?utf-8?B?RWkzYlJJRms0Qk9qMmYyR1FHZnkvdDIwZnExRitMbkpFR0xhcXVXTGFlQVFj?=
 =?utf-8?B?bXh4SW5jWkMrRmYyVndiVUFGa0RkNnAzZWt6QXZKdWJCWG93ZGUrOUxQOTM4?=
 =?utf-8?B?UVo3d0hNMDBDWmV5VFoxcjZOQ3lSdW1DWE55U01ON0JLbzY3R1kvdG9sZjVR?=
 =?utf-8?B?cmxONXFuZnBGR2Y2ckRXWUYzYnlyTkYxUVNqczJ5UU5JTmxFaGVZQW02OFhl?=
 =?utf-8?B?L1l1ckUvVWRYa1p5SmR5QXd5aERxN1gvQWZDeVFBSnZZbFFFT1ErUWpPMXUw?=
 =?utf-8?B?c0VReVhqRnFTeVB2amF3NXNBei9SbXhqSE1BN05iYVJQUkhpUnRDMWppK2Rz?=
 =?utf-8?B?cGEvM3FXeTNJa28vWHdIVzlBTCs2V3JHVFd4eGc4QkhrYUZPUWxiTXdqQzI0?=
 =?utf-8?B?N3JyM21nWWR2c3JtY0s0OHdiZWJCaWVuVkZSa2RxYThUZTRRQW1Gc1pvdzUx?=
 =?utf-8?B?ZmlmT3hqWVAycFVJWWVxN2tlVFB4Kzl6UXBURHN4cGlRRHh0UzZsMG1CSVpk?=
 =?utf-8?B?c0llc0FaTTFSQkY2WHhXUVpSMXRjV1pkaEdROVc0bEwwWkZ4dTlhV2plTzd5?=
 =?utf-8?B?VitDeHJodjhDRGRYWlk1UXFOcXZSNzRieGlTRVZzQ1llQ1B5ckROTVZoczhW?=
 =?utf-8?B?WFN0TlJxR1UvaDNOczhKcDlHLzRGYVBZUTJNVDE1THZPKzQ0L0wrRzcvWXhm?=
 =?utf-8?B?VlZ3RjUwU3FIa2drMENFUUVtZFZYUDhWNWYvemxYaXJaUjFUd1NEUkJvdUFR?=
 =?utf-8?B?bUwzN0puelVqU3U2SDk5bFBTYkFNcUFTZFBzZTF1UnpjSG5PZ2NzaEtzN3lK?=
 =?utf-8?B?eFZxSGp6MDJMcXlvTjZ5WTl5d3dtV2FkNlh5ekVTcVRFRncvNkhnMloxZ1FT?=
 =?utf-8?B?aWt1OXdDelpzYitwN1k1bmdyY25pbDhzSjNqSFBiSnZoQklLdEVHOUE1Ykp0?=
 =?utf-8?B?ZEpkQzNFa2VENG1ZRVZ4Y0p3OHlhOGh5MHA1SmVOaHV6d05yQTBVSUplUDk2?=
 =?utf-8?B?VWVPRFJDYUZKNFRYMjBBbytmRkVUK0dFTER6UzBVSCtZeFNGNHRFVFJjUlRX?=
 =?utf-8?B?Wm5mSlJoUGpyekw3L3MzMThnVHROUEgrZzhxNTg0K01ZZVhIbXlHTHhrT01t?=
 =?utf-8?B?L0hYMjJoSHRmSm9vVUtHRnZRczFERGp3RGIySEtyZG1FODFkZEtvZFhrNFVk?=
 =?utf-8?B?Mm83QndBUDFqR2xXVWpwY0d3V3hDcHk2ZkZ6b29ickFUdVBsRWx1SWJVMTB1?=
 =?utf-8?B?N2lLRVpaUFdqc1pVcXdKSEJaNDREc3d5RUd6Zk5YdnNadDV0N05RUzA3ek1u?=
 =?utf-8?B?K05FdHd2MWgxRWxzWEJYanhleUwvVHpnMXYwSS9qVHJtVW90OHltSGZvSUhQ?=
 =?utf-8?B?eGNwSloyWU9iYkJlTytnSldNOUU0b01DbnlycUE0emFMZjJpNFZoYVdRWlE0?=
 =?utf-8?B?NytKdHY0djB3NldHQVFSaFlnM1g4SHZtd1pqU2dnMithVlhkcW0ya2NZWUJv?=
 =?utf-8?B?N0VxUFhyVkhyMzk3ZENoZ1IvMzBGZDk4TFhOTEJjR0RwMCtqbzdiWWRiWktl?=
 =?utf-8?B?bWRoZ2t2Si8zM1RJek5UK0FqN1dQWkpBZmFoL1dLWThaOFdsUG13aVRRdnZk?=
 =?utf-8?B?NEVQVjAyMTVvNDlxcGpzTkxqWE5CcGxyODFsSzhOYkVVRG9kSlBlTnVlaUxE?=
 =?utf-8?B?K0YwSGc4UEo0QmRBb3ppaGhQR2tPNTNFSXJsaWhPTmF2VS9Pa3FOR3VXNWhx?=
 =?utf-8?B?OVUvMmNsZ0JLRVozdDFLVUpLMk5tY0hPamRNUlhrZHA4dTdRVzJ0ZnlUbStU?=
 =?utf-8?B?djFvOTIreVUwbjd5R08rbzM1RVhzc05EdXpFbGdMOE5OVVJqWXhnWW5UN0Ja?=
 =?utf-8?B?SEZaZTJEN0hBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0hyd1lHN1U5UVdvK3hOcGlocFBXQlBvSmdxL0VVcTVFUk5LaXZQd0NCaUpY?=
 =?utf-8?B?Q1NEaDZRYi9JVW14WTBQTDk4aWlPMG1PV3ovK0oxdFFjV2FvK2wzSkJEU0N0?=
 =?utf-8?B?b2t6RVcvUlRKWEVUdWkreEdXQlNobXNIRHhrd2UrTHZaQXp2WmxWWUE4UmFj?=
 =?utf-8?B?TTFjQ0NOVis1WlBaOGZzZjB3TzR5MjBxQ2l1WVpEMjF5akwxU21EMG1ZN2tY?=
 =?utf-8?B?dXhlOGZ0TktKMjVtQm9BY09NbDBSUGpsdjhFWkFjdjB3VUNkM0FQT21lQWI0?=
 =?utf-8?B?OEkvaEVqamhJSEkyWjFuN0d4V0phWXZ3K0FMNUJObDN2NFlwcUMwbmtTckY3?=
 =?utf-8?B?bG9vQ0t4Uk9lUiticXJvT3J6ZTM4Y1l4SitYdkhML0FZbGZjOEQ0a1R3OXla?=
 =?utf-8?B?b2tJQ0wwMFNhR0R0a1pCQUhVSjFWU3ZKMllyUEtpakJIbk1RMUN6d1JjOGxm?=
 =?utf-8?B?Wkd1YS9peklOMTdmbUQ0RThrOEQwL1RxVzk0SHVHaHduZ3NabDBRdEZkQ2JI?=
 =?utf-8?B?d2hNY0xEUEdROThiUjVLTDNSRVJGZi9ibmptemYrMkF0OW56bmJnTXR1eFZM?=
 =?utf-8?B?ZWtrei9JeHFNeG91cFY2UkU5V01GckM0cExzWmtGemUyc3JFdFZMQ3RvTVh6?=
 =?utf-8?B?ZXVyOWVPNmZqcVpZdGxVdHNwc2Y1eXFNQWtxT09zVG1QamFwVnhQSklYTUw3?=
 =?utf-8?B?dmpVc3ZVZTJ0UDJFNlJRY1psZlQ5R1JsTVV4QWZsVzlMWll4Y2x1dm1MeFJh?=
 =?utf-8?B?bG1FQzUwdDA2TWdzdFJSOHUrN3pIa1NiNno2QWFFS2poeFhEbVBKRi9KNTAw?=
 =?utf-8?B?VE1yQ1FKTFJwY2ZtbmR5bXJiakhUWmk0MWF2bzdmRlJzQjJsNnBGUW1YbE95?=
 =?utf-8?B?dFZkQjhlYXR4akh6MDVYNWdxVTVUWm5POG1URWc3a0lsVnMwaEd0YnZTRXNk?=
 =?utf-8?B?Q0ppQklhZ0FoayswYmp1Q2Zzd3BVTTBWRU9uOUo4RGhKVkRSTVlNNE8vYzBl?=
 =?utf-8?B?TjVWWWxlSGVWSDQ0SXJSaG5ZL3ZEL05jNW9NZjBFRXVOMGJVN3Y1L1JqSmNi?=
 =?utf-8?B?bW5zSlhSMHJ1RFQ4eXlzQ3NrcjQ4UGFBS0dQbXQzdEUva0hKY1d3ZWZFWUYw?=
 =?utf-8?B?NE8xdTZVU2J1a2hrbGNRNmUvK1pVMHlEZzRQSnFldnU0WlhtSEhTR0VIUlVO?=
 =?utf-8?B?aDYxdmhCTVdqeXc3RVJjekg5RU9WUjJlVlpKSzJYektERHRMS1M4YUZMQWNI?=
 =?utf-8?B?VlR3SWZoc213WXBiRXA4SWR3WEhlSXhUOWFsaC9VL3IxYkVONUhzclN4REx4?=
 =?utf-8?B?N28xRWJzdVFKT0ZUQXUyOWZsbGg0aktuM2JKVGlsNUd1bGppOFhJTC84YU9P?=
 =?utf-8?B?RjJuZ2FBYVh4N2dKblRQQisxVkJrVjMxQ2RCRGJzaFVyQ214MDQ2Z3ViR1E0?=
 =?utf-8?B?MjhzWkVGbmU3SHo5SmMxM0RzY2k0a3FFZFpPcHJjaEZ3bGpCOW1NcjVJeFRj?=
 =?utf-8?B?Q2tiVmtwcHFNRHFnSkpDV21UaVlaSkFQcFpUWHBnRkdZNVNEMzdPcC9JUTUv?=
 =?utf-8?B?NU94TkJ6T293eGxxQTd1LzB3ZlZabjkrYS9QbXA1YUM2RXMySVRCdytCYkI3?=
 =?utf-8?B?OERIKzhXYWhDU2hiZzBYUVNoREdaSEZIZXdGTUpmUkI0STNNWmZ5bjNyKzdR?=
 =?utf-8?B?dTU4akFNeEJmUkxVN0lPNTVQRlNpYWEzV1B5UzgyY1pMWTBxZnZyRGJPZ0hL?=
 =?utf-8?B?cVlZdjZTU093Q0NyK1RhMDhUcVJQeWlKM2JBQVIzdFVEYjVWSUZnamxQMEJ2?=
 =?utf-8?B?Mys0cFNmb1ZZTlZCbEJTRlhwdnB2UW9LQWc2WHJqb0xHb0lDT1NNbWJYYkVE?=
 =?utf-8?B?dnp3ZVRnNjh4YWpPYVdCN3diUWFESTQ5Q0x1cGUrVG5xQjEzK0E5bzVPc1hH?=
 =?utf-8?B?K0ExM0h4VTBaalFGQ0RBeWlsS1ZrdU01VnlxaXVWYlZ0cUpVUHRRQURqQklC?=
 =?utf-8?B?K0xGWEJYMkpZL2pxWVQyUFM2SURhTXVPcGloeHF4d1plR2hrMXhGdHVtcGhH?=
 =?utf-8?B?eTlnQXZmYXc0bjYycnpIN0M5Wk5qRzRORDVDc2ViUEkyQkpRQTI4UFpoZHZT?=
 =?utf-8?Q?Wca9fqrvIKnodvF9a/sVXHfHz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b8629d-2a53-4d54-ac17-08ddb4c8a478
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:46:40.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HHdb36dsp4AvJqu1MzUbM+XxG0A+Qi+JXvh4gNQIJTcoz+5W2CTftsxvVzhQkmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483

Hi Reinette,

On 6/26/25 10:05, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/25/25 6:31 PM, Moger, Babu wrote:
>> On 6/24/2025 6:31 PM, Reinette Chatre wrote:
>>> On 6/13/25 2:04 PM, Babu Moger wrote:
> 
>>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>>> index f078ef24a8ad..468a4ebabc64 100644
>>>> --- a/include/linux/resctrl.h
>>>> +++ b/include/linux/resctrl.h
>>>> @@ -156,6 +156,22 @@ struct rdt_ctrl_domain {
>>>>       u32                *mbps_val;
>>>>   };
>>>>   +/**
>>>> + * struct mbm_cntr_cfg - Assignable counter configuration.
>>>> + * @evtid:        MBM event to which the counter is assigned. Only valid
>>>> + *            if @rdtgroup is not NULL.
>>>> + * @evt_cfg:        Event configuration created using the READS_TO_LOCAL_MEM,
>>>> + *            READS_TO_REMOTE_MEM, etc. bits that represent the memory
>>>> + *            transactions being counted.
>>>> + * @rdtgrp:        resctrl group assigned to the counter. NULL if the
>>>> + *            counter is free.
>>>> + */
>>>> +struct mbm_cntr_cfg {
>>>> +    enum resctrl_event_id    evtid;
>>>> +    u32            evt_cfg;
>>>
>>> It is not clear to me why the event configuration needs to be duplicated
>>> between mbm_cntr_cfg::evt_cfg and mon_evt::evt_cfg (done in patch #16).
>>> I think there should be only one "source of truth" and mon_evt::evt_cfg
>>> seems most appropriate since then it can be shared with BMEC.
>>>
>>> It also seems unnecessary to make so many copies of the event configuration
>>> if it can just be determined from the event ID.
>>>
>>> Looking ahead at how this is used, for example in event_filter_write()
>>> introduced in patch #25:
>>>     ret = resctrl_process_configs(buf, &evt_cfg);
>>>     if (!ret && mevt->evt_cfg != evt_cfg) {
>>>         mevt->evt_cfg = evt_cfg;
>>>         resctrl_assign_cntr_allrdtgrp(r, mevt);
>>>     }
>>>
>>> After user provides new event configuration the mon_evt::evt_cfg is
>>> updated. Since there is this initial check to determine if counters need
>>> to be updated I think it is unnecessary to have a second copy of mbm_cntr_cfg::evt_cfg
>>> that needs to be checked again. The functions called by resctrl_assign_cntr_allrdtgrp(r, mevt)
>>> should just update the counters without any additional comparison.
>>>
>>> For example, rdtgroup_assign_cntr() can be simplified to:
>>>     rdtgroup_assign_cntr() {
>>>         ...
>>>         list_for_each_entry(d, &r->mon_domains, hdr.list) {
>>>             cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
>>>             if (cntr_id >= 0)
>>>                 resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
>>>                              rdtgrp->closid, cntr_id, true);
>>>         }
>>>     }
>>>
>>>
>>
>> Actually, this interaction works as intended.
>>
>> It serves as an optimization for cases where the user repeatedly tries to assign the same event to a group. Since we have no way of knowing whether the event is up-to-date, this mechanism helps us avoid unnecessary MSR writes.
>>
>> For example:
>> mbm_L3_assignments_write() → resctrl_assign_cntr_event() → resctrl_alloc_config_cntr() → resctrl_config_cntr() → resctrl_arch_config_cntr()
>>
>>
>> resctrl_alloc_config_cntr()
>>
>> {
>> ..
>>
>> /*
>>  * Skip reconfiguration if the event setup is current; otherwise,
>>  * update and apply the new configuration to the domain.
>>  */
>>  if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
>>      d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
>>      resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
>>                                 rdtgrp->closid, cntr_id, true);
>>    }
>> }
> 
> This ties in with the feedback to patch #18 where this snippet is
> introduced. Please see 
> https://lore.kernel.org/lkml/77ce3646-2213-4987-a438-a69f6d7c6cfd@intel.com/
> 
> It is not clear to me that this reconfiguration should be done, if the
> counter is assigned to a group then it should be up to date, no? If there
> was any change in configuration after assignment then event_filter_write()
> will ensure that all resource groups are updated.

Yes. That is the good point. We can do that. I think we started this code
before we introduced event_filter_write().
> 
> If a user repeatedly assigns the same event to a group then mbm_cntr_get()
> will return a valid counter and resctrl_alloc_config_cntr() in above flow
> can just return success without doing a reconfigure.

Sure. We can do that. Will remove evt_cfg from struct mbm_cntr_cfg.

That for pointing this out.
-- 
Thanks
Babu Moger
