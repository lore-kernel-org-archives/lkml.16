Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AD71D514E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751441791; cv=fail; b=b+kyriKpVzNulXOJndmm/aMjwNdYZLfbGumGuiNFyeMSvivg5cJTEmUF0GseGvWcO766KY2BQspC7XgE/2NJaB17U3WJCXU1MoMh51tfG7xyp4CinFHij7sJAf2GgeFKjCYp6KRU4+ZC4ndXlVJYGL6afPMphoOtQvE/nm0Fr/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751441791; c=relaxed/simple;
	bh=tI3ISqLZYLT6JvJPSOb7p2K1vDkp7NTausuzwepoy38=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJpdnMZF6b9RaxzeYlxhwWCbgC6Ny+28KHAXQn66pNQ67tRzb/4Tht44Yu8uhRvA0MEQhs7GFaHa77d147gDCpamcVQEKWw6J9vgdgi0RHpZCDVCDS1FVYEtPOMrgBxBrhkLsFfncJ2/jStsU68HOmvHpBySSYp2V2/8UONXU5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W7PEsXeJ; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W7PEsXeJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6zfPsv8ZqabTTh7jKdphqiK6yTfZCSZO5AGJatoWjKBYqnxA77h2wKfFsoZfTTzF6Nwc/DDUTr/ZdIyNfu1Lbyj1hBlXyKLV1hD7fguljG0djFQ1bl68QdbH5cs+5DhreW0E87d1nNM1oeEf5w5QCErQc82foVcVOKq1LIc8R+fQk850rhTy10ym0/WZQ3l1VtoV7MaQpL8ccv14Zr6Ff9trftAha/3MWuy3XTTcgqCrIhVLgZdAS/GUsmI3vrNgylKNVwmhoQLocyh4KrLQjJyJh3RLYz5dhqVewfaHWst5KWtpKZ5Af5oFSjnLtmyWl6S91zvkIBUhe9AGtXa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4S/Bzho+f8Bv6T31GSNcg1lQqIMdnHOgLUOl8h1zyw=;
 b=PwHc8w7khsyIipJEQPkf97pbLSOf/x/vG8QyuU+tWBQwp0YFhq3xqgoDsB5AutVB2SeZrxkvIZOE9MUOl4nQcGgrO3gXc6uvPqvD5IsdNEuQtsw+x4Wp40ygqi39176jDoCD7ajYbNHwAEZYB4OSKrbGECY3FOERLVMt5car3aP7qw+PC/CpEQ9DsRvE8BhYQRx5NBG/Oa2XX0YZiDFU69Evgjc/sELC2jPZKJWUPg1lAbn4I/PxfC6euLbiJDiDx72GL85to/PTN67DN7+KJXL7HXEnZ5hWPDkfIakGXIJO/Nnn5ydsg1m7CINubSg0bUN879ftc+2TMFoEudPyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4S/Bzho+f8Bv6T31GSNcg1lQqIMdnHOgLUOl8h1zyw=;
 b=W7PEsXeJcXw6HD5bGLLc065ysCrQx5KebLgCYlEQWzHUfHuvZfDVRsDNTt+/G0vVpu6YfaHwOt8gtnEOL2lxlSL/aPU5WW3AdlTAMhm0mAM2KZ+SVqXbHeM9Li+clSwPqPBYJEo6cg+GXRR+2IIbJzkC05w/r7Gsnj6dd0gBk8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 07:36:27 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:36:26 +0000
Message-ID: <8a919ef6-4105-44e0-a17c-e41c1c0abbe9@amd.com>
Date: Wed, 2 Jul 2025 13:06:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
From: "Aithal, Srikanth" <sraithal@amd.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>, Jirka Hladky <jhladky@redhat.com>,
 Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org, Suneeth D <Suneeth.D@amd.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
 <e9666935-f7af-4419-bb85-e1f041c64ea9@amd.com>
Content-Language: en-US
In-Reply-To: <e9666935-f7af-4419-bb85-e1f041c64ea9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::8) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3038a4ab-b48b-4360-cf8e-08ddb93b26fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGNKUTF3RWFRaExLMGdOL3JrMWQxNUpsOFY2YVFDM28wMWhNODEyaXNaZWRx?=
 =?utf-8?B?T1cvYXdMVVVnNUgzUXpFRzFnUEs0a1NwUFdjdU9LMmxPOHV0U0FsVWNWY0g0?=
 =?utf-8?B?dXhvNSs0azM0MmEycDdkUGZOQzBUZ1JLOGE4Z0p4RnpENnBEekJTN0YwQjZV?=
 =?utf-8?B?em1PYkJRNnJVRmt1S3B5Z0xEUUhQdVM3LzlrWDlqSjRBSDBpMS9RK3hocjdz?=
 =?utf-8?B?MjNycjhrVHE0U3A1NFBkU2hxZWtEUm5XdVVST2haMTFaZjFXREdoNHBHS0sr?=
 =?utf-8?B?RXZ1NVplc2lnaVJyeFVvcjh4cWdTVndSOHlrK3VJOW9Lc25JSndJd3pLSjRa?=
 =?utf-8?B?a3V5UXhWWE0xTG9iRVF6MythRnNBR3FGTEV6MnFSVDE1eVdLUGRPRHBaSXdT?=
 =?utf-8?B?SDVqUU5MbTNiOXJ0R3RXb29PTmR2TTBGMDJKdzdrbXBtT2pjeFRIU3czU0J3?=
 =?utf-8?B?TmF6S1ZsMzdySUdsLzVpdXVjY0MvMUk3MlBtWVlGWFBuMTlXNTQ4Qk53MkNJ?=
 =?utf-8?B?S1ptbEFuRXlJcVJRYjNtbkVxSFNqai9wcDNuM1QzK3l5amtZVk1LMU1hYW9M?=
 =?utf-8?B?Y29KWVROR3Y1dU5CRHFKUFRYek8xaE0ydjBVRlVwVFNSLzdhN1BMZUU4SmZm?=
 =?utf-8?B?RGNYTFV5QTByY3FqR3VZNFdqejkwUFB3eEpjeW9WRkhwZkEvbVowa292a3Zo?=
 =?utf-8?B?Y2ljQXdpdm5QT1E1Q0lUaCtvZWVyTElXRTZxbGRISFZjdFpwakloeHR5YldG?=
 =?utf-8?B?L2llajJBU1FXSERzakpQSXBYUmZQV004Tkw2bzgzM3drOGMvem83dHN0dHFD?=
 =?utf-8?B?SFRudFlVTmh5dm56MW1NYWliUGkvVmw5S3NGNmhENnowL0duMGVnMUdpVURh?=
 =?utf-8?B?d09oT3BSUWJaYmdHVjNIdDdwQUZHdURsS05Oa1RIK1FlSStiSkg4UWRnN25I?=
 =?utf-8?B?ZXU5a2pLTG1ZTGhYd3Z4T1BIeG1YVXI3aHlrQXY2cG5laVBFUU5jMlJCTjJI?=
 =?utf-8?B?TFR4UWRybWN2VnB3dHhybXBBSCs3cXRiUTJwQW50K2ZobWJVM2lGQVpQM1Fv?=
 =?utf-8?B?Y3kyOXBqQmk5cS84VXpiTWxBd1dldHlNQ2tWREd6TlhUNDVMa2daVXBtYTRG?=
 =?utf-8?B?WU90SFBQUEJGUzA0SzNuMXdWV1ppb0NjT3pqWEFVYUtkU2QrYkx4REFjb1Bq?=
 =?utf-8?B?aVVwTWJ3QUtTVFBXdXYwZ2JRbVpNd1BKdDFRLzJWMWp4a1dRUTNaRVpYM25v?=
 =?utf-8?B?cG9IKzlkNHNGTnBRUmJoQlZmQXQrTVc0a0I4MFgxcFd4a0F4Q3Y1M0lqZ1pW?=
 =?utf-8?B?Rk5Yc3FCNUJSdUFoSk5JUVQwOGFYNUZlZDFWZmNZbUJXb25DZWpOZTJkblNH?=
 =?utf-8?B?ekNJZnlUbjNkUTB6QVViTlNGYytBRU9URlQvdUN5L1lXRktEQkpQWmM1UzFI?=
 =?utf-8?B?cXIzRDc2ZXJGLzNxUHE3Qi9adStQK2tqeVFwV2FFWldtOEJ6SHlCZkdXQk1O?=
 =?utf-8?B?cGd5MEt0dXZVelMwVUJmQno3ZDdaTkJVSTJyUlIyMEVBamE4QUdnMVdZbEVw?=
 =?utf-8?B?NG9BL1ZuNnYwZ2hpUXFLQzY0K0Flak1CamFqcEpUUDg1R2hqeCswRk5qaDYx?=
 =?utf-8?B?dWNqSzlSeFJ2ODFLWjZ4VXdvWFZFZ1lBTWFXWXIwRjdIcjNONEZPWldRbkh4?=
 =?utf-8?B?RjVmelYzR2l3YXl1d0ZWSlQrQjlibWhpTkZnQVJqbjNKdkJxUGxCTkpwcms1?=
 =?utf-8?B?Q01sNEF0dVY3S0hJa1llNS9Jd2FmekN1MU5SMXNzdGpzRmh1WFIwaDZjN0hp?=
 =?utf-8?B?MVVTUmJLK1FPWlFORGRDRHlkRFVDckhvL3dRY3IwTFZ0aVhjc3d1L1F0eWZI?=
 =?utf-8?B?Q29oZnZybUNjeTlHMkR1Zk8wUzEydGpGVnFucmlkQUJ2V3pMMTZpRHgvdDZr?=
 =?utf-8?Q?/MKq0NEtOhSrs0Cc9X3kvig668XzHgTP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEtEZnBoTVFLaXdUQlBhdFJTMTllcTUybzVPYjZ3cWh5dGtYWDliTnhjQnp6?=
 =?utf-8?B?U1crd0RZZUxFWFdQN09iUGVnTm0wenFjbEJJMDk5bGdjdXlPdnI5UmJ3WDl0?=
 =?utf-8?B?b21zNFRyUFhvVloyNHNnL0tkVDdyNDVCV1JTTUh3WnVsYThDR0QyM1FZamNa?=
 =?utf-8?B?cWlvNUhiTE5iS1M4Q3NCUkdLZXoybFd6Y2h4SlhqaEdLc1BHM2tscWo5SFZZ?=
 =?utf-8?B?V3E4dWpjRzVJcDBFcS9mQkhEb0xEcGx6UkJ0bTJhZS9XamJCVkZlS1AyTXhy?=
 =?utf-8?B?OWxkeTNTNW84NEhiWGFzUVlvUldlMHNiYkdzQnZ5YWUrTjRkYk9WTEExWUo0?=
 =?utf-8?B?R0s3YlJIMXRQckJzbXVWa0NRK0psSTZIK2VoM2F4WHhmMzE2Zmg3bEJGN2s4?=
 =?utf-8?B?endQOUNFTk1QZURyb0pjU0NWSEVRaVRXQ2xZMUk1U3IxOUo1QklEb3h6dE8y?=
 =?utf-8?B?eHlYNjdqc0h1MWF5ZTFlMVFOR3JjYitta0RsSFZlcUpWaUhkT1kvWExFZkJ3?=
 =?utf-8?B?cGVpUTM3Q25YN1RLR3Y4MXdxQVBTVWkzaDhlSWNxVDdSVFNmRXEyYTlKdnZy?=
 =?utf-8?B?SjJQWUMrVEFEWkN1cGd4dU5EdVhsVDJ2bEZkRUhvNVlIY0xvMTRDaWxwUzQ1?=
 =?utf-8?B?RC9abW83QUNUZnZnL0hGZUdjeWNNWUJwUWpsenk4dzJJYkpGOHBEMHpLcVBX?=
 =?utf-8?B?Sk92ckdCV1h3VU5mNHhYa1k2bjhtY1ZLTVhwemtjSDcwS1ZPS0UzczFxUkxL?=
 =?utf-8?B?Ni90RkZTYXU2Vis4QmNQK2VlWUIwb1ZSRWFUdDRNaU1hd1BGNVBOYjdua1g0?=
 =?utf-8?B?VDFmVHdjOXkzQ3pDQlY1a2NuREtraEJKMGhkVXN2Z3B2ZFp0eFlpODk4VmM1?=
 =?utf-8?B?cFA1MnhxMFp6dmwrT3BFNmFub29NNVRDemFvSWswQXF1S2VBNUFiZXdVLzFi?=
 =?utf-8?B?L1ZDSi9kbVlCQ05DUjdtRk1ESGNaN0NFRnBDSW1MRys2bnRySkZyZ0Z4UXhF?=
 =?utf-8?B?bGFYaEIrNjE0d2h6Q04xcDZGSm5MeWp3Mmdwam1DN01FUEZ0aysxYVpXYitn?=
 =?utf-8?B?U1ZqOCtkK1NVeml2SnNhRE5mb1dqZFF4aUQyNkdsUmFZOEdCVndxblN1eExN?=
 =?utf-8?B?b3ZaNXhPdWl4Z2phcEJEdWJndjNlbzNRQTFKSFFPWWZBbHQ3QkVOQ3RuWmU5?=
 =?utf-8?B?d0ZDekZEc2dVQmZqTmtuNWdIM0M2V1k5SEhSVkZERkJEWjk4R2l3OUJ5Q3FS?=
 =?utf-8?B?NkVqNXcyaDBDN1FvblRFOWpjQjhhMXRzVk15VW5KNVNLZXozZjlVeTVvQ1dN?=
 =?utf-8?B?RThSa0xvZVlrdVBhcWxEa3hveC96YlVFRVRiMnQzY1U5bzZyWkxmdFB4NlRS?=
 =?utf-8?B?eE1zMm5mZjN3TkpyL3FwbFBHaFI4dDROZWFmNnY5VDhVelE4NGRyWkk2Y3NO?=
 =?utf-8?B?NGo2eU1uN2VQNng1S3dUVWFQSHVWL0UyazNjT3FxMVFSQnZnaUJtVFBzZUxo?=
 =?utf-8?B?UC83Tjg3NExwcDhLMzNBMy9qK0MxcEJxckNpMDArdGJ2MHB0ajZlWVAwNkh2?=
 =?utf-8?B?TG81UU5vSTNRY1kyR2lZR2kwUktkdjBLNDIzczVaRnNsdURxeGRndjFFVlJi?=
 =?utf-8?B?dzQ4UjlWeU9HbS9wREUySjIvVUtwSkQzVVdxdThjZWJyc1ZOdG5XSFhlYWFP?=
 =?utf-8?B?eUVKNWlWVndiTWdDRXd6WWtUOWl6VmhKMTFCWTdvb0NNa2dBWEFGZkxtaVpP?=
 =?utf-8?B?UCs1YVFDaHpXS0tWZkUxWkZKczNMYnlrbVRSV1pSelhuWnZOOWtGanZ6RDQ0?=
 =?utf-8?B?REVWaVpwSmV1UVZnR0RSSC9TTFhBMS9PdjhMZVB3OVRnVndRVjdhWXJ2S242?=
 =?utf-8?B?SW50ZG9wUFE4d1EwYldzQ1N0U3pHY0dPQmdBNStKc21TUktNdHdzZTlRRFNp?=
 =?utf-8?B?N0ZZVUFPUFNjcWZkWUQ0MC93TSswbDd2T0RGR3NsYlFMaExhUEdHVWpOcnVH?=
 =?utf-8?B?ZVp2L1pqMXgwaVVhQ2plaHNLd3Q5V0djR21FR0k0NUxlMVUrcGsyNGdkVkNp?=
 =?utf-8?B?WUJKeHZ1NkZkSE9xY3lzQ3dmRGxQNTRCdk4vQ2s4ZzlBMEttOFZTSHR5SVJz?=
 =?utf-8?Q?zIsoldLaoOE59TsciG76b2hwD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3038a4ab-b48b-4360-cf8e-08ddb93b26fb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:36:26.8283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deIzGbUIkaNGtkh9qb7tcm/GEREwujb70lBwcipqdXBR3PPSalZuzphhHWxPsoQoEGkP8wTDlwHMDY9SB30yTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278



On 7/2/2025 10:02 AM, Aithal, Srikanth wrote:
> On 6/27/2025 1:03 PM, Chen, Yu C wrote:
>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>>> Hi Jirka,
>>>
>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>>> Hi Chen and all,
>>>>
>>>> we have now verified that the following commit causes a kernel panic
>>>> discussed in this thread:
>>>>
>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>>
>>>> Reverting this commit fixes the issue.
>>>>
>>>> I'm happy to help debug this further or test a proposed fix.
>>>>
>>>
>>> Thanks very much for your report, it seems that there is a
>>> race condition that when the swap task candidate was chosen,
>>> but its mm_struct get released due to task exit, then later
>>> when doing the task swaping, the p->mm is NULL which caused
>>> the problem:
>>>
>>> CPU0                                   CPU1
>>> :
>>> ...
>>> task_numa_migrate
>>>    task_numa_find_cpu
>>>     task_numa_compare
>>>       # a normal task p is chosen
>>>       env->best_task = p
>>>
>>>                                         # p exit:
>>>                                         exit_signals(p);
>>>                                            p->flags |= PF_EXITING
>>>                                         exit_mm
>>>                                            p->mm = NULL;
>>>
>>>     migrate_swap_stop
>>>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>>
>>> Could you please help check if the following debug patch works,
>>
>> Attached the patch:
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..82fc966b390c 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct 
>> task_struct *p, int cpu)
>>   {
>>       __schedstat_inc(p->stats.numa_task_swapped);
>>       count_vm_numa_event(NUMA_TASK_SWAP);
>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +    if (unlikely(!p->mm)) {
>> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
>> +                p->flags);
>> +    } else {
>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +    }
>>
>>       if (task_on_rq_queued(p)) {
>>           struct rq *src_rq, *dst_rq;
> 
> I was encountering the same issue as mentioned earlier in this thread, 
> which has been recurring in our daily linux-next CI builds within our 
> virtualization CI stream where we observed this BUG appearing randomly 
> during the runs.
> 
> Additionally, we were able to reproduce this issue while running the 
> autonuma benchmark. As mentioned earlier, the BUG would occur randomly 
> across iterations, typically between the 5th and 10th iterations.
> 
> We consistently encountered this issue up to the 6.16.0-rc4- 
> next-20250630 build [https://git.kernel.org/pub/scm/linux/kernel/git/ 
> next/linux-next.git].
> 
> After applying the aforementioned patch ontop of next-20250630 build, I 
> tested it in our virtualization CI and with the autonuma benchmark 
> reproducer described below, and the issue no longer occurred. The patch 
> appears to have resolved the reported problem.
> 
> 
> git clone https://github.com/pholasek/autonuma-benchmark.git
> cd autonuma-benchmark
> for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
> Note: The server running the autonuma-benchmark must have at least two 
> nodes.
> 
> If the provided fix is final, please feel free to include the following 
> Tested-by tag:
> 
> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Tested-by: Suneeth D <Suneeth.D@amd.com>
> 


I apologize for overlooking that this was a debug patch. With this debug 
patch applied on top of 6.16.0-rc4-next-20250630, I am unable to 
reproduce the issue. However, when I revert this debug patch, I 
encounter the issue again on 6.16.0-rc4-next-20250630.


