Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA51D253B40;
	Thu, 17 Apr 2025 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900070; cv=fail; b=M0P641yinEwOrfR6ELxgjksOqIjWPL1MXa5C3bL9PwOx+fAIuSdp+pLKBa4mh9bs7cOBgQczU6L4tywBIwNmCkbH/rEHUqNSeu7mAvW4W/geJLhDs/0YokgfJQVNYcmAm+H7ckcM9ldZYQw1vkuxry21fqWI15D7SviG5M5reio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900070; c=relaxed/simple;
	bh=fkPTPTgZXFuNQ3Vi79C5pQKJLgZ9Ydh0RY8NftnCYLY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d46sBTZhFznizCphxZFlwyEXKqSlUTS8v3oeOe12INBT8Q/p+47GxMswiT9qmrdGpHgbuHPU2txQMaTmhv44bd8CsGVPf2rxxi4MWnMFfjdZp00fbTjA/EzTYizVhugP+JOy1B2UPy9rJhFcoR0KRx5IL8jTVK+pljvgljGEiGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pf3iiDme; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pf3iiDme"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cimWRU0rjTR8TIy5I22wUmeYU4700pRjNY0nCoA3SrbcOymXIamzQAdYKAtTh1lAdU3jfcHiG8izOdwakYjXHY1UakJdDeSlqOPQ7h3izznKw0W9SzKi4D9dpmmcP9nopkevaiC8DxXSmQjH9eDBoJBlOOIa40vJUQ48g66IVXtuzjPf178HGUoiuQk564diakQhQ/shedRgiUnDemqz2gVLfkujrY+8yO+6KC3jEfaWWDnJh12PiwICZIxLovdJVj/nEuNRAOU/hU5ff7rcitCt4Kl23A2QwhgrjEOe67BzR0JNABpC5j0rnSC5KyXyj9HbybFzBMgrMNwCvH6dJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAz8ccc4Fy5Fychg4Bn/18wlQ2xjPvwDlgZdqyWKXmI=;
 b=xlBuQMILsR4G17vCQ/63ICbOHqBH244gKxzUAnbI6c55Y+GYniF6OMmgITW2LP4AnLXzvL+8gQAh3kLoP5BThuudQBsHLLNUn7hsflrHFmrnbQtxFWHrdBUQzQTkD7J9uQE3FZ8LNkFK50pc0i1xEQDEDEQYZ3ZXKkphItcODb2s0yaj1KnBe3OtxYv4ptHsxEhyHtw2WS6FzBTcd4gTT2UTpUVpeOCAzf+fBAAHOS8zqGIY6XukTSAyknt2qROgXxvTxzeVC6X5TyG4lEjA6hIwaXqk1K//NZ04n0ioTgadUB+M6JaPT3plHoM6HLf0KYFg/LHsZbIE/FO7ea3L4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAz8ccc4Fy5Fychg4Bn/18wlQ2xjPvwDlgZdqyWKXmI=;
 b=Pf3iiDme2t+ogwJYhJwg/Z1nduLGjby829wWVieNhkiGjzYyoEcMVaL7H0AgHV+RJ++0lWP5dRukav5jh7DxKzEGAMguNV/SLkGOdgEDxhwPiNRVlPyZdMEFf/dACR8TRueLo8cQYw0yJu4xdS6Mlf8POo9L7n/ixTitW1gUMg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 14:27:46 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 14:27:46 +0000
Message-ID: <d748a754-6c46-45b4-8e62-8a0775565c10@amd.com>
Date: Thu, 17 Apr 2025 09:27:41 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 03/26] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
 <74255838-47dd-4e18-b458-f9488b38b9e2@intel.com>
 <44c82df0-30e7-44d1-8759-c8f3df68e538@amd.com>
 <dc736f74-ea47-455c-b27e-254277aa4022@intel.com>
 <600224e2-2c0a-410f-9812-80dd1da9d7c1@amd.com>
 <d2966a26-4483-4808-a538-bb20973dd2a1@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d2966a26-4483-4808-a538-bb20973dd2a1@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:806:120::31) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 5321f893-9be5-4c0b-8915-08dd7dbc058a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkZIMnphdzFtZTJFTkNnbkIyNEUzd29rRGFVQ2Iya25tbXNpYjFTSnBZeVJW?=
 =?utf-8?B?eEY0YW9xM3h3US9Oc2M5UEJkSTdLRms2WHZSUlhrdDlHdjJCMVN2VkhsOHIz?=
 =?utf-8?B?NkxHY0tEWDJEczVGR2VSbC85cWFTbHJVdm9LRGx2WjRzN205K0hQVFpTUm9F?=
 =?utf-8?B?VVcrM3BSbU1XeWZTWTQwZFY3N1hvUVVJQ2ZDeUUxRnQwQW1FOHBFd3RSd3B6?=
 =?utf-8?B?THVqVEkza00xcSs0Smh2aU9yUmJRRENIQjdCVkVaTkNLeWFLSDRXa2VXb0ZU?=
 =?utf-8?B?MU1VWXFDaGpwN1BiM2RSSUtHNzFQUlJBYlFsM2ZxS0pZdDZxTkZiTlJMSlY1?=
 =?utf-8?B?MU5mS01Zbkt4T0RPVmFQQ1lNZnhGeWpCeVIvNVFweC8wL2FLK1h4ZEIzcmdN?=
 =?utf-8?B?bmtLNnR4Mm1kbDRpUFZnUC9RR1dvVG1MRFhvb1pYclppQ3NpMk12akxhN0JY?=
 =?utf-8?B?RGFUSFhWN3hrZ0lZWkhjTWsyU0RGVm1DdGtpNzFEajBpbEs3VTA3ZnJLcnp5?=
 =?utf-8?B?YXFSOFF0NzQ3SlVvSCtSa3haejRlMG1SMHE3NGE3Nm55aTgwR3J6VzVjaEZ3?=
 =?utf-8?B?cklpRHhKRnlEam1FSU1jNkdKYVAxdFRLb2tTaTlLamcwbmJFZU8yUHlUWWUz?=
 =?utf-8?B?SHFYZTBXb3RqZVZXNGFjV3VjcEVVTEkxa0pQak9rNmc3YTJaNGVzbGxwQktv?=
 =?utf-8?B?R2ZwRG1ScGQ0T2NwZ1RtN1FpcDhDekR2WktSdTcyZVVOWkNPaCsrLzVNdnU4?=
 =?utf-8?B?ZTByU0FLT0FRcGZyRFpzQUFLdnRGSXhCblYwZXVSaDFiL3N2S0ZGY1UwbmQz?=
 =?utf-8?B?ZzVsczRrTUJJSU9aV1Z3SG1oSzVXOXVXM2k3U3dlYmRpdytJREMvMS9aZG43?=
 =?utf-8?B?MGxxTWFLR1c4a045RTMyZUUrNUxuMWFsak9lVGMvQWt3UkVNMTM0OWFGTCsr?=
 =?utf-8?B?QzdZSU1hbW9mSFJFMmJYUkhzVEFtNHkxZDVDRW8zd0hPUnRianE1S1RvTktJ?=
 =?utf-8?B?MkVBRWRCZFFXMmxQbUN6MURUcDlBYTZwZkg4cEo5QjFUVmpVckdjNXhFbGtn?=
 =?utf-8?B?MFg4Y0hIKzFIb0xYaHRQQUdPc1pFOEMxQ25GcUVFVG1meE5IS3I4ckxRaEo3?=
 =?utf-8?B?KzltZWY5OVN0bVQyejdhR0wydkpielJ5bVpBenh5OXVleCtXOUI2eG5uMy8x?=
 =?utf-8?B?c1dLdFRWNlVTamJIUUxheEUrdEN5c2hnUTBhS2pYaDZIQ1Nob3N0WUtEVHZZ?=
 =?utf-8?B?eFBUQVVoVW1DejhjOEhoMnE2QUxFL2tBSjY4RXJkSDlWUnlQK2E5OCtndGd3?=
 =?utf-8?B?bm44NlpwZkVJTU9idlFDNkQxeHIwakV5RTVxK3JDS0Zmbm5laUNtdFhwbTZw?=
 =?utf-8?B?UEdDVEFFb0dEY2xrVVNGV2F5VXZqTkNOa0hHNnNaeEQwWC9oQXdaTWZKVkVu?=
 =?utf-8?B?MHR1aGtaMndMS3FPeUxvL0c5cEZ0akJ1cDZJL3piNUFzcVQyV2NQK1RCV1dV?=
 =?utf-8?B?M0l6UXZCWTVzaWVzbHd1dFhvTWtOTTlYVEJta3pHRS9JTGdYUEc1c2FWcjJv?=
 =?utf-8?B?YXk5WEx1M1NpS3NnY1NPTWZlRFRPMFAzd2dkWmorbjVCSVUzcmRrQmFMVVRa?=
 =?utf-8?B?d0R6MHdGTG5KTk5tWWhiVXA4RkwzL2lSOVdOUlFMZG5lMXc2c0h4YnJjb0V1?=
 =?utf-8?B?SWlSSjRURkxTL2g1QjQ2NisvZnRxRDg5TU1YOCtxVnptTjBtNjVDT2cwMWpz?=
 =?utf-8?B?MnpCRlByZkd4QlptZWVZZm5SWjF0d2YzcjFWU0FaYS9uZnBzanJ5UnVwK0FW?=
 =?utf-8?B?NTM5VHg5U1VxbjZ1SHVWSGdVOFNxaG11dUFVd0swdEJ1R3R5R3FUcXk2R2hy?=
 =?utf-8?B?MHdmcjYzcUdSeG5qWU9EdXJqTktYSk9IejlxczltcnJDb0lRMWI5SFppejgz?=
 =?utf-8?Q?g+ilW7PUPN4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS8rdzFaemp1cnJZQTN4cmRzLy9SckVzaDI5NW81WVdoRFgzbmEvOG9FNTZw?=
 =?utf-8?B?VG1jNGxwdDVWREQ4bXVIYXE1eUFFa2VQSUx0dExoU2NSV0JUQlJNdjhzZlRy?=
 =?utf-8?B?T3FwVjhjbnYvRzA3VEovSXlaM05nQmpnVEZxMHRCc0NHcnZSUHFZMjM5Unda?=
 =?utf-8?B?bnpRclVQRDI1U21OR3VMZ213ajBNVVphdUVlcTBqTDlITFFVOHdtNjZ5c2xt?=
 =?utf-8?B?SnlZMTRKbE1KU1BWdnQwdS9ReHZwb0UrdUN2bW8zOWJmTTZmQkVUTitnR3M1?=
 =?utf-8?B?MVYzUzA1OVYvWlVKYWhVd2NNRGkvcDRKbHZHNGdrUlc3bjBlR0I1clFEUXJJ?=
 =?utf-8?B?cWdDc3RCdGlnbzRkOVdMMU1QaW5OV1czbUNLRERabTlVbENadElRb3JZYVpS?=
 =?utf-8?B?aTZCQ25yWHNCak10YzZKZHk0K1JCSThMcW9ONC9xcVptd1AyTUZ0OXpQYWht?=
 =?utf-8?B?TFF4RTRDTGFpUmh6MlVna1FCajhFQ3gyTzdXWFAwNkVSMDlWV1ZLcExYTWtk?=
 =?utf-8?B?Mlo1UWNvd3h1cFRsNXZqR1pWRWY4VUxSeTM5OUpwT0x4QklMRi9aV0NiUUwy?=
 =?utf-8?B?VU81S0x3U3pUYmZIUHE4bmZRQWRoOXpoQ2RVbE9mMzdGSUxKdHdBYnZGOGRs?=
 =?utf-8?B?NGk4amdqRWhqWlIvUEY1ZTh2a1hFV1BkN1NNOWRMQytLbVg5eHludm9KUkFi?=
 =?utf-8?B?emJPMWVkZzVFcFMyYVh1NnYwOG1ya01HNWxZcjNROHYvblNUanlrNzhQSkRt?=
 =?utf-8?B?VnRxZFoyc2FIcjV4azdUN3hHY1hnNXVJd1hqcGV0NWUvRUZMdE9mTHdESEpR?=
 =?utf-8?B?cGROeXk2S0pBL0puam9kMk4zOXBEMmVHYlFmVmVndkJ6SzFXTFNZcnhiM1lK?=
 =?utf-8?B?V25CUzNtZDQyREtQUXA0UzdLWk5sRFJKVWVTdDYxWm5XcDN6VHVDTDdFTjFK?=
 =?utf-8?B?YVJKOWFaYUczUVZWd3d4V0dKQWFmTEZiRnFFY0F6NytyMWJhSE0zMVNoUEFX?=
 =?utf-8?B?NEtiWVdFV3JlbWwvUm5MSlppWjlnR3plTk9hMFVFN2FxeUMzdm5qRzlPeStR?=
 =?utf-8?B?T3JSOHU4ZG5nOXV0RitHcXhaRTFpUG9XQ0pRZ0ZSbmJZVUdFTGxvY0hwMWZ2?=
 =?utf-8?B?b3IydkdZQTNKck9TcmgzTHQ3SDZOQlMzNXNnLzFUQWJTdU1ya1VJV054VU9F?=
 =?utf-8?B?TW53cHVpZ0hHelZxYi80Ujc1RXNhN0ZZUGlrSU1Penc3eVBibGZpWGVOQWlY?=
 =?utf-8?B?WFNUTkcvOHFBU1BxVDJrUlp4SzhxNW4zTk95Y2NCNWIxcGpJREdjbnhnaGEz?=
 =?utf-8?B?UzdKais3T1BQZytIMk90SmdKK3Iya091cXRrMkQ4S21NaG5hUEorekxrRFR5?=
 =?utf-8?B?OXE0dVpiVjdJVnlid2p1RnNnczZYV25oRHdNU1ltdEVsWThLMGlXaE5hUnJJ?=
 =?utf-8?B?R2JVZjMweTdQcTNZb2FieUVnd1MzYWkyanVKN2RPbFE1Q0xrdUl6UE1aOGNL?=
 =?utf-8?B?RGJsR2VXVXlyVjdrbjhlYU1iNnI4cnpPajFQaUpZOHVjODZXa2kyK3ZaZjZm?=
 =?utf-8?B?QllUVnNiWkkyQzBXbSt4cExlUm1QTVJuQnZWdG51S3R6NS9jMWZKYTJHQktJ?=
 =?utf-8?B?UktYcTNzdzJ1NzdJcjh4djNVeFRlM1ExZ0FzdTJWbWVTcWtRK1ZtaExvcTc5?=
 =?utf-8?B?UFVpdnRQMVNJQko4NndEcms4S0VYejBTNkJsN1czZEtVeUdJTjNLOStDZ21o?=
 =?utf-8?B?bEZNTmo2cEtMNXJqOFM5QzNVSTVvZmE2TjdmMGFzMHpBUEt5dmhYSmtpZU9B?=
 =?utf-8?B?anAzVWpJMzNaUERkTGF3Sk03YUhiVVdhblg3TmVXMDlpSEtLR2pxVk1EZ3gy?=
 =?utf-8?B?NXhZYkMzamJiSXhndXN3amdDTFVZc1JLTWdKQjlhK3NXeUFDNlJud29NMjZT?=
 =?utf-8?B?VzZjODZzMTdUSHZNbGxtK1BLcGY4dnFCY3dDNHk1WmREZVRhYS9JcHRQK3hO?=
 =?utf-8?B?NmtMekFvb0QydW1VRFVnY2QybmpFMUV2b0RqRDRZMXVFNm1kTE1xenNzRjZK?=
 =?utf-8?B?aUt0S29yM09NaTgxSlZzL05MVERFenMwWHBNRW5pSjhoQVF5NGtJaWlGb04v?=
 =?utf-8?Q?c5JaHc4wABfyXJlZieUm76agz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5321f893-9be5-4c0b-8915-08dd7dbc058a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:27:45.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MW8i9HWUpAWV63IXxHFJfsidozo38cWCpZkqe6eG7rfSF6EF0uJVtaYfg1/n4Kt3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966

Hi Reinette,

On 4/16/25 11:08, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/15/25 12:43 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/15/25 11:09, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/14/25 10:48 AM, Moger, Babu wrote:
>>>
>>>> Here is my proposal to handle this case. This can be separate patch.
>>>>
>>>>
>>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> index d10cf1e5b914..772f2f77faee 100644
>>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> @@ -1370,7 +1370,7 @@ static int rdt_mon_features_show(struct
>>>> kernfs_open_file *of,
>>>>
>>>>         list_for_each_entry(mevt, &r->mon.evt_list, list) {
>>>>                 seq_printf(seq, "%s\n", mevt->name);
>>>> -               if (mevt->configurable)
>>>> +               if (mevt->configurable &&
>>>> !resctrl_arch_mbm_cntr_assign_enabled(r))
>>>>                         seq_printf(seq, "%s_config\n", mevt->name);
>>>>         }
>>>>
>>>> @@ -1846,6 +1846,11 @@ static int mbm_config_show(struct seq_file *s,
>>>> struct rdt_resource *r, u32 evtid
>>>>         cpus_read_lock();
>>>>         mutex_lock(&rdtgroup_mutex);
>>>>
>>>> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>>>> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
>>>> with mbm_cntr_assign mode\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>>         list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>>>>                 if (sep)
>>>>                         seq_puts(s, ";");
>>>> @@ -1865,21 +1870,24 @@ static int mbm_config_show(struct seq_file *s,
>>>> struct rdt_resource *r, u32 evtid
>>>>  static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
>>>>                                        struct seq_file *seq, void *v)
>>>>  {
>>>> +       int ret;
>>>>         struct rdt_resource *r = of->kn->parent->priv;
>>>>
>>>> -       mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
>>>> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
>>>>
>>>> -       return 0;
>>>> +       return ret;
>>>>  }
>>>>
>>>>  static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>>>                                        struct seq_file *seq, void *v)
>>>>  {
>>>> +       int ret;
>>>> +
>>>>         struct rdt_resource *r = of->kn->parent->priv;
>>>>
>>>> -       mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
>>>> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
>>>>
>>>> -       return 0;
>>>> +       return ret;
>>>>  }
>>>>
>>>>  static void mbm_config_write_domain(struct rdt_resource *r,
>>>> @@ -1932,6 +1940,11 @@ static int mon_config_write(struct rdt_resource *r,
>>>> char *tok, u32 evtid)
>>>>         /* Walking r->domains, ensure it can't race with cpuhp */
>>>>         lockdep_assert_cpus_held();
>>>>
>>>> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>>>> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
>>>> with mbm_cntr_assign mode\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>>  next:
>>>>         if (!tok || tok[0] == '\0')
>>>>                 return 0;
>>>>
>>>
>>> Instead of chasing every call that may involve BMEC I think it will be simpler to
>>> disable BMEC support during initialization when ABMC is detected. Specifically,
>>> on systems that support both BMEC and ABMC rdt_cpu_has(X86_FEATURE_BMEC) returns
>>> false. 
>>
>> There is one problem with this approach. Users have the option to switch
>> between the assignment modes. System will boot with ABMC by default if
>> supported. But, users can switch to 'default' mode after the boot. By
>> disabling the BMEC completely, it will not be possible to do that.
> 
> Good point. Thank you. Another option is to hide (see kernfs_show()) mbm_total_bytes_config
> and mbm_local_bytes_config when ABMC is enabled. To me this seems like a clear
> interface to user space, when user interface changes the mode the interface changes
> to reflect new mode.

Sure. Will try this. Thanks for the pointer.

-- 
Thanks
Babu Moger
