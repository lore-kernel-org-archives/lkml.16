Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020128.outbound.protection.outlook.com [52.101.191.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D0D1991B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200388; cv=fail; b=mrsbAiJGqbxSFqqMH6cwgBp0rejnawE4ieNvcZsWrBjv3LS+B5fCb+/+zJFGk3iVN36tXi7d+OcMyiV9irTuWbTjz2alUd6qh5e3yqDHg+Vo7chYX1KhaqeUSXJbM2A/57VZ4GG4y+m2N/2HwHcFocJ/Soggs7bHMDhSn3LYkrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200388; c=relaxed/simple;
	bh=etrQMV60aqRn2Mj4wKNGG+OUClte/zB2jV4NAWurqWU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mau9dCjUfMxj+MiKxzxErhdGPkRRgxty2ifAUtz/SuX7KHhbDjMV41FI4iTBoG8pEffUZizNQWt6qkOuJENBVO8EimFwBc2xVBA4wgo/NI4FpHVKMDmqn9wCIWgUotep87gNnUu1lGvvrtDXg6GfarKadcExm9HXN+Ufq/vjH8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=hzXssHK0; arc=fail smtp.client-ip=52.101.191.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="hzXssHK0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0/EtQvQUgOXE+vrMIu6vYRctni1Qn2aQdm8Fp6rtkbKUFVrwWxrf8kDhS59mnyBgnPiVzp6ry75Gwv6PUVWpv6LJTavMvANpcekKDzM/IeMA+i2Iu75Ie3gIGK+3V5ed8gJsdUusqCwFZuSW7WQ3ceYa0WQBHNgI51EIfNoGdD1hneC/zpv4MXnzTC73jzIskycG1yUn0pAb08rYeNF8Ual0IxCGlOeSHkaGueslcm7pZStoPinkPxmgwLZP+iHU7hz40YBeFoev20++GBVHNViCtpNtPmVK+83ers5LQv7S30YTgV//3hcwZ9AsVftrZog1aueENGgATo+PDhWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPIAqtZUxPqDRoI9SHF+uKnCjKiRRP0Tmnm/bh53VIc=;
 b=bj/K0Z4FGw6kBDFlBRCgsgGWMm/lpl4O8qtqbo2A/LhzfFdbj7Ise5uX/qJ5c5cfUTOYvkejMGnNT/FKt8tzmTbSuIGADI91Ciatp5m+WvdjrkRrMQXKj2VtInOe27VtaLs/0JmeEcpxxth/gsfR/2J2CSP0q5ip40SR6abDAOiRSGXV2FvwzIb3TGuTsvReyhmBZ06wmaot7GQ2V8hR4qXp/B0fG6YkBK93GxqgHaDw37gZmppW7ON864n0sUczpH+yiQnYIxWmIa/ChME2ywG86zVUu+8oOgJ+KlrP52sxn8DCvgKz615YFkuXxZO6JnS8mUQOJPCaWUP9eWAiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPIAqtZUxPqDRoI9SHF+uKnCjKiRRP0Tmnm/bh53VIc=;
 b=hzXssHK0NJ2UURyw726qZsiAPTHv6uYsDce4H5kqnf3e/MfSStSNClQ8kZV8esaU4s1pWkAmB0BB7dv849pWEphOCcJxaqq7prDh/QrAvWoZzzebek8ZjIa4qVbTHc3fVFq7r+mQOX4Xg8NR5N6BJfixVLbV78nu7Oulv96I+EWoszRx99sN4HVTFZ3OddixBdxxmbepwkpVSs/OgQ34hE1H/wB2sEDoquDFyqobKaQtO6kkoPN+xA9CSyoelrgT1eHfvXIAki7Z+z410WvU+LdWGuRlp0dHCUmacPYt7s/Ez0m+lCq166CBxKiv0LDhe2mX7nGAdAf4IsHwtpH8Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB5472.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 15:39:39 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 15:39:39 +0000
Message-ID: <54b59ec9-5a6c-40c1-94f9-43311d2c5b6b@efficios.com>
Date: Fri, 2 May 2025 11:39:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
To: Peter Zijlstra <peterz@infradead.org>,
 Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
 bigeasy@linutronix.de, kprateek.nayak@amd.com
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502090529.GU4198@noisy.programming.kicks-ass.net>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250502090529.GU4198@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::41) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB5472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa15af5-a122-4389-a9cc-08dd898f8cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnhpTjdadTNCZ2tyTUxOWFZtYVk0ajl6azU4MVBkbTJCZEhvZnE4a1dRQmNU?=
 =?utf-8?B?cGlxV05odU41Vm5KSzZNRjA0UlkzWnUxbEZDZWVkcFhNQ2hZc1I2cjQ2Mmlp?=
 =?utf-8?B?UnBadEkrWDI1SXVsWFBkZE9BT21GcWQyUERDcWpWUk9tWVZkY0ZURnh6ZmpN?=
 =?utf-8?B?SXJhSXlzRVZ2NWY0dkNSeDhVOTB6RVk3OCt4aW5DY09TWm51Q3lGQUIzMW5t?=
 =?utf-8?B?SHVSbG5EanFEekZlMU5JcGEvSkpUSHIyY3hhdXJFRTFIQ1hiQWhKaGp4VVpl?=
 =?utf-8?B?eHphTGsvMmpvMWp6Z1FWQVVIYVk0WnJVeW9Xb2R3a3g4R1ZIZ1YvUGNRMEtw?=
 =?utf-8?B?elB5VjV6YlZnMUxkaTBvUTlPVG5WSGJCNUlKdUZvTmRhR0l5Y1QvcUJ0R2Ew?=
 =?utf-8?B?azc3NTVyUXJYSUEyYm4wUHoxTFgyRXpMZEx5b3Bab3NQMEk5czMxVnRLVHJo?=
 =?utf-8?B?UzNUT0locmU1RUVDZkJiWUhzeEtIZ05KdDVUV01TUE92bllDRnhkcUozKzhI?=
 =?utf-8?B?ZlNNZC9ocXRyeElGT3lNMmZzTWlyZEEwOFZTVEhmV2ZVT2dNTDdGTkJkaFpz?=
 =?utf-8?B?SWJzVWJvZ2ZMdkt1TDZVaW9BNHBwKzJ0bmljcmZYMGNxRUg4ZEtQMHR4K2Nu?=
 =?utf-8?B?RXhQeGkrUXdFZjNmdW9TdG9aNjlHd2szRE50V2tCUmt5SHBvencxNmtMeFg1?=
 =?utf-8?B?bGI5eGtQanpoV3pRNW9Ydlp4ak9OKzFVR1ZyUnN2dUlXdEdYaHpDU0xXNEE0?=
 =?utf-8?B?SU43Z1FJT0FXYlQvWFFndU1jeXp2dnNHYklTeFJta0pJajZZRWlGa1JFV3hh?=
 =?utf-8?B?QUd3Z0IxeVAxMUl0c2hmd3hiS2FCTk9vamV5eTNRZW95N1J5U28yYUFYckhP?=
 =?utf-8?B?ZTk0eWY2d2ZsUTVRY1djaDlyNWZWU2hiR0tIL3lqQStFYlRRTlJPWER5OGN2?=
 =?utf-8?B?RW9oUk5NZEJQYzN0K3lmNE8ySzBRN3NFdDFtMnBwM0cwUk00L0RxL1NtVGhH?=
 =?utf-8?B?Qjh1K3MwdlNIczVKU2RSQUdXNVYwM3N4ODFmNWFmbHlRbzdWQzd0NE9lWnFn?=
 =?utf-8?B?akthbU9Vby9LSkFTQXNkSmlXMUZxSzZLT3lvMS9Rbng3cWhQcW9XaTNhaDZl?=
 =?utf-8?B?eGYwN3ZGdUJ4SWt1TlVscEx5QUg5Sm5IUi9MQTJncm9ES2t5V3RBeUx3M2Uz?=
 =?utf-8?B?aHEzaEFKZG9ZdHhXZmQ0RkxjTnAwYUx0aStncG9jZTAveWkzQ09sQXp5QXU3?=
 =?utf-8?B?OTdCRGZTYXpoUUprdGY0Y2JpZVNMQUVZbG1lY2NQVkJ0NklBdVM0amQ0bDNS?=
 =?utf-8?B?dzZsd2pjRW5oVGZmRkJ0UWJQM3dWbXFEc0VTUnZmOWlwaDJTYlphZitkcHRv?=
 =?utf-8?B?dFZacmR4L3c0QkF0RVdteDVhY1FTYjYrTUxiRzdmdGRsWkVYRDh2NGNUK2Ny?=
 =?utf-8?B?M3JLU2djYkR5aHROQzM1UGFVa2gvQXNTSXJsRVk2Nys1RE1wa0JjVXNsOG1t?=
 =?utf-8?B?MVJhR3F3ZU5xZDhBckQxZ1E4QWphNzFUd0dkaXd2VVo0YmF5dzBNT1ZNSjBp?=
 =?utf-8?B?andqRlJ4ZjRnLzJ4MFQ1bmdJT1hiQTN1d0Y5SWtyV2FNdHBHRDJvYllvczdE?=
 =?utf-8?B?RXBWNEh5UTRVTXZmSzJBMHRjcDRUVFFqQUthYkhFcVhQMFlUem1KY1liczlN?=
 =?utf-8?B?cklLaDE3bk16V3pQcEhDdlNnUDZwd0grZHpFVm9iODR5ckR2ZHdWQ0RiVjVm?=
 =?utf-8?B?N3RJamx5SFY4UTAyemE0d3UyK0tQK0dLalRGQVRKWVdHTnJCaGlFY28vMlFE?=
 =?utf-8?Q?2lXDCHURKus54yB1s1rdGKTnx0L0b49kY1TdU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXQvTG1PWnJLWG5WaGp5Y01NaDc4R3d1UTdCa21zenNJbnJMQUN5S3E3OS80?=
 =?utf-8?B?ei9XdnA5Y0xFdUpvaHFpMXNhTCtKN0ZWV0N6QkF0c1VDdSthTWxqSVYrVm4r?=
 =?utf-8?B?UlRDSE5DWXVLNHEzRzNHMEdyQXF1WGZ6U2NyckNVRVlWQWJvWlZOYmsvVVVv?=
 =?utf-8?B?dWFuT1NKOWhKaklWMitYRFhEZDV6WDNCczdudWp5UFNrKzBxK1Z4N0ZqU0sr?=
 =?utf-8?B?TjBZOGdrN2xKQmx5eDd4bUt6bG5ablN2Qm1EZUI2aVdzaGJjOFozMC94Wk4z?=
 =?utf-8?B?bUp5NXowMXF5dStCYmxMR3h6MWhLeWxyc0dBc0FSY0ZLRlZtb1lIckNUWk5w?=
 =?utf-8?B?a0R4YSs1QzdmK1gvRDhQLzFrK3VqM1YrN1pYdm5SNXFZQXdQNUpnWW15L2g1?=
 =?utf-8?B?WnlsMWFjZFdIYzZVeCtRTTBZZ3pyMjUvTG9tTWtmZTYvZVlicEpybk1pd2Nt?=
 =?utf-8?B?VDdwMGhocGtHYVRSZkoya3BsOXo0SlBaU1BzR285V2hkQk1WWXM0YkxDTmtU?=
 =?utf-8?B?QzJQenFzVmxSbkdtODQ3dDB4L1huMFRTRWtkNnIxOERKUXhPeERIMC9CQU9i?=
 =?utf-8?B?SWZEamsvWjIwMWpaZDFxTUVWT2xNQW5KM0hpSWkvanJObUR4SDdrZDFHazVZ?=
 =?utf-8?B?ZFJBRVhxaVJOVHpnRG9zdDlUaU9FYk9Ga0NrTFgrTzUxdDI4Zmh3ZXVTZHl6?=
 =?utf-8?B?S0FmbThFT3hwdURxcktibmZaN0NRcnlxRk1XNVhwUVBjeC9wK2FsZ0RJSStt?=
 =?utf-8?B?STQvWGkrazFpVjdqSFFSV3BNMWk0djVBNTZBbFNmK2lkdXNPSVpPYkZ5WjRF?=
 =?utf-8?B?QUU4VStOczZTMkVlWk1YS3I1b1pJQjVFVjdpMWwrM1pCMHFtTkFMTWNrYzBS?=
 =?utf-8?B?SWtJTzYwcUhobC9ZcW1pYkJjdUR4ZjdtM1o4WDVyWHArR0h5Nm5icHNmZjgr?=
 =?utf-8?B?UGhaNU9aK0FwV2ZrVzlQNkhkTjBua0RYZ1ByTWtHTnp3bjFtQXJYUWRKTkFC?=
 =?utf-8?B?NWllSUJTekxYdVhLK3hWcWlGQm1BTW9YUS9NNkxWTXF1Qk9xdFkxNzk3bi9C?=
 =?utf-8?B?S0RMWFV2RTVZTWJ6ajAxdmE1aXZnRURONGZ1akNYaDZtdEsxNXlwblRpSFly?=
 =?utf-8?B?Z1FvK3lMVGVTS3dZd2t4N3FBK1FpaGRZcjZHSksyZmNmT3l5VHhKYzRDYmVn?=
 =?utf-8?B?WHIzWXhheUhiQUlJT2E2NFFNY3BNUVI5NXJaOE9IdkNKLytyS2w5ZGY5MkJJ?=
 =?utf-8?B?MTU1dnFkSVZBMlZjaEU4aElBR1NuTjV1cGxxa2xldWdRdzVXWDZuTytLdWJx?=
 =?utf-8?B?Vzd3aXdBYk5xWWJoZ1k5Q0dKUVpVVnNsb05GbUVWTVlDWitmOHEyQmcrNmd2?=
 =?utf-8?B?UXA1Vy8vbDhSN3AxQWQ4N0U2S3psVS83bDFmYXVLUFk2WUh3eUJ1WE00aFYz?=
 =?utf-8?B?cjVEbzNmcWU5cDlXQ3YyTnVvQXNXKzN2bFVmYm9XSytDRjB0YU0zbVpjbTRB?=
 =?utf-8?B?T0tNcVNUSkJCeEhsMWx1L2gydXpqSlNNbzF1R2t3Q2J6c3dPZG05bVhxdjZR?=
 =?utf-8?B?NGM3TVpxT05MMm1qS2dXTWc1Y2x2akxLUFFBbGN0SjNPbWZSTjZLWHdFcHVS?=
 =?utf-8?B?bDhjRk1FL3MwOXVkTWcwWFd0cVhoSGJiVnNNcHlxZG4wNFRib21KOWZ1SFhu?=
 =?utf-8?B?YjM4OGsrdGxYMCtVSzNOR0d3dG1tQ1piaHhwNkhFUHJUUmNNUXl6ckx4ZUpy?=
 =?utf-8?B?SFJSeTI0MzEzeVIwbEpTTlEvTHREQldiVmJlR0xLRDhMZWNKN0FUYllSWi9o?=
 =?utf-8?B?Z0FxQ3o4L3hlNlB3V2hUTWdFcm5PeGFlaWFERFNINE1ZRDk4ZS9MWXNIcjBh?=
 =?utf-8?B?eVFkclNLTm5jZVFKQktlWXlaR2o4YWxVRzJXbzdVNlNPajlBK0hNTldMaE5T?=
 =?utf-8?B?eFZNYkx3YjdBN3B6YXJmcjhqbmh1MC9EOEZvdXVqbFJRKzhVVGJJTHNaTS9D?=
 =?utf-8?B?L0lLTE9GMlc4eXZyenRzWGZ2dmVkNElNbUk4L0VoWXExY0ZXbEtTbnhtcHlB?=
 =?utf-8?B?ZjJpajkrR1RYWHI5czRRVWExSGxlZ2tud2Q2bnhMajNWSXNCT29NWjZwVnZj?=
 =?utf-8?B?LzFlY2dCSHNHa08rNHcyd2FxT2ZJRWswbTRlalNqTVBHRVZLdnN0eHNFeWtk?=
 =?utf-8?Q?S6GLH0/By3ymop7S4yP43Ak=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa15af5-a122-4389-a9cc-08dd898f8cbb
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:39:39.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7VImjxTxd7LZvjhjTXbpCm5yxDEfC9iX1NppW9/GBxHAa5JSxKu69u17LMEXkuIkiZdlLmRn0gwAua8FX09iyRmxmB3FzR6PKlnLdWVx/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB5472

On 2025-05-02 05:05, Peter Zijlstra wrote:
> On Fri, May 02, 2025 at 01:59:52AM +0000, Prakash Sangappa wrote:
>> Add support for a thread to request extending its execution time slice on
>> the cpu. The extra cpu time granted would help in allowing the thread to
>> complete executing the critical section and drop any locks without getting
>> preempted. The thread would request this cpu time extension, by setting a
>> bit in the restartable sequences(rseq) structure registered with the kernel.
>>
>> Kernel will grant a 50us extension on the cpu, when it sees the bit set.
>> With the help of a timer, kernel force preempts the thread if it is still
>> running on the cpu when the 50us timer expires. The thread should yield
>> the cpu by making a system call after completing the critical section.
>>
>> Suggested-by: Peter Ziljstra <peterz@infradead.org>
>> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
>> ---
> 
>> diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
>> index c233aae5eac9..900cb75f6a88 100644
>> --- a/include/uapi/linux/rseq.h
>> +++ b/include/uapi/linux/rseq.h
>> @@ -26,6 +26,7 @@ enum rseq_cs_flags_bit {
>>   	RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT_BIT	= 0,
>>   	RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT	= 1,
>>   	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT	= 2,
>> +	RSEQ_CS_FLAG_DELAY_RESCHED_BIT		= 3,
>>   };
>>   
>>   enum rseq_cs_flags {
>> @@ -35,6 +36,8 @@ enum rseq_cs_flags {
>>   		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT),
>>   	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE	=
>>   		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT),
>> +	RSEQ_CS_FLAG_DELAY_RESCHED		=
>> +		(1U << RSEQ_CS_FLAG_DELAY_RESCHED_BIT),
>>   };
>>   
>>   /*
>> @@ -128,6 +131,10 @@ struct rseq {
>>   	 * - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
>>   	 *     Inhibit instruction sequence block restart on migration for
>>   	 *     this thread.
>> +	 * - RSEQ_CS_DELAY_RESCHED
>> +	 *     Request by user task to try delaying preemption. With
>> +	 *     use of a timer, extra cpu time upto 50us is granted for this
>> +	 *     thread before being rescheduled.
>>   	 */
>>   	__u32 flags;
> 
> So while it works for testing, this really is a rather crap interface
> for real because userspace cannot up front tell if its going to work or
> not.

I'm also concerned about this. Using so far unused bits within those
flags is all nice in terms of compactness, but it does not allow
userspace to query availability of the feature. It will set the flag
and trigger warnings on older kernels.

There are a few approaches we can take to make this discoverable:

A) Expose the supported flags through getauxval(3), e.g. a new
    AT_RSEQ_CS_FLAGS which would contain a bitmask of the supported
    rseq_cs flags, or

B) Add a new "RSEQ_QUERY_CS_FLAGS" flag to sys_rseq @flags parameter. It
    would return the supported rseq_cs flags.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
