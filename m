Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2134.outbound.protection.outlook.com [40.107.247.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE61EB1AE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433142; cv=fail; b=d/lmfMcmgRzb8nMYq04CWacC+7vbdVZEHHjyaL+CAWbDK9sOVZWdlm305dY7yGJHPYGlTlcNY7o/CDHBr0qJj15XtijklWFCOkz0QaqT2FiaDyFFUXrWlRbtk7pAS56SC0VvSWzv508g9E0vQLnZpUP7sPaINLG6vy2hb+9t1gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433142; c=relaxed/simple;
	bh=FVcflraQjJLk6JBa9L7MwOkY6iQRlqZATvRbuIqPVKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vp9NsldBtIic52sXbwUXc5aw1jmxSTBNkvC+Abc/OpugUgwVxtLtsV+v63ZAGN23RaJPaIkcDs0dYbRJYs0HQGMjVpymeZi1AMRqK3Zi8Dmt6slKfMHk2cQEnXJJx4a7edOAASsnzTliQhsFDb2zYQqvqKyjj0wSSW1cQPXNj1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=e8Nvk66j; arc=fail smtp.client-ip=40.107.247.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="e8Nvk66j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIr3ORFlhEHzA41bh/ACX46La2ksKisobsLrbajrySmGA1Ktwr+wI9vWeZaKqKGizIdrMBq+7DRv47YrvhGbZ0nTo8Edx/5k1MkcWXqGEv/WAbZSIC/YjdMpei3lAGjMzEZpzpIlpnA166WcS2Gop1S+kpuUoGxz8+aC/iDrgEbQMaG+6+salXFuer7mjk8c7oBjqnqdrkKmlMk0OXEjWI3Zh82gPLaZNLhSb7RissidvYwAVC+lJWkCMkwVpvApDQyFc6NQvjHoQyGZSLBltCeAw/hOS8ocUzpEK/XRiynaKPqp3GAjm5eeJlUKyhmzZG5/Dg5pNkjMX8JOCwRzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqA5t5rYp/r/ZJwSGHOVkzCLqSwezjn3z6RQslketsQ=;
 b=WC9+WSLS+CIhqmyAc183+mvZf067T8HjRJkiMINWn+cB9EwK9R3LTxZrJwqaVgF8oUo3qq2AGUPm6YXqmRZgOaPjZgNZgvRR1RR9gleAuwqZogv+XP/jgHFzUGgMpfOKUz2G/5+CGfQsf8wJb7HtffEbIsqDfmPmXL+Gb6hduX/owWJxCTIRZQBGvkBGP1nBJjwndJgJx+5DRpoFUjJQzxhAAn+uUILruXsuhgDfICKAZT7Mcqu0h8RgPcXp1+s0F6CyHTwWp9IknJq+6K2I+qQP9OAwwcIhFR9Hq8X8KHEryWFA9D/QTRVM5QPoPe/DUaOvrnExGd99Enx7xbR7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqA5t5rYp/r/ZJwSGHOVkzCLqSwezjn3z6RQslketsQ=;
 b=e8Nvk66j87hi6axJdyUq/UuxyCWXrhCkjgDDXaaaJo0882EGF8cge3qly0DRjiU/FhpI82YOW7/a7EWDGSkRvj8eRXLkd5mUTW1uT3p+iMAxrYjV8D+JjHUjf5O+1sPQDf7uxW5OPHzcpEJvMJwPwoA3kIi0JJ571cFHiIDKB3y/99dLp1v2AXt0tj4A/qxSVxSvcxQArTeAviE5XIAmK9a7nKLKMLguw8GXX2DTyTHhnfCAQC6NontiPI+XawpCT3oF2m421gbH01XOFu2JqyWITorrVBa54w/sXs3OUpDJx95srK9TFXajAfey5EK/ltW4NCUXCtTFC7y6a6sWZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by AS2P195MB2248.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:59f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 08:18:56 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 08:18:56 +0000
Message-ID: <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
Date: Mon, 5 May 2025 10:18:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH] arm64: defconfig: Enable BANG BANG Thermal
 Governor
To: Garrett Giordano <ggiordano@phytec.com>, catalin.marinas@arm.com,
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski@linaro.org,
 shawnguo@kernel.org, neil.armstrong@linaro.org,
 alexander.stein@ew.tq-group.com, biju.das.jz@bp.renesas.com,
 javier.carrasco@wolfvision.net, elinor.montmasson@savoirfairelinux.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250113185607.2210352-1-ggiordano@phytec.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250113185607.2210352-1-ggiordano@phytec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|AS2P195MB2248:EE_
X-MS-Office365-Filtering-Correlation-Id: 1603a1e9-02fe-4884-7cdd-08dd8bad7ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkZTQndKZnc3aDZUN0wxbWhZOTZaS2xhL0hNUUJBWmRncFRieU1LMXRTaXJR?=
 =?utf-8?B?M2s2TE03Q3RRMUVGejdidWw4WjJ6YXpGVUh4cWdFalB0ZThoVUpac29wUGQz?=
 =?utf-8?B?VDBkSXUxdnoybk1mTHdRSFNvNTJTMExZS0JYTkxVaS9Za3F1MTROSnJoQVB4?=
 =?utf-8?B?UWhKRUxPSXNzZm9QdCtjbmMvVWhnV1liTG1oL2hjdStuMVRveHd5UkovRHVk?=
 =?utf-8?B?ZFRVU0lKeTlsYzY3U3N6OUlUb0pldzA3YVJ1WEtWcTVCbzkrVk82cGU5OUZX?=
 =?utf-8?B?VllDWUhTN1RHbXJ0WTlQbDMxNDZZb1c2MW9vMFU1clNKb2taTHErem5PMnRw?=
 =?utf-8?B?MndtbXlkVzZZZnhZa2N2M0JBZVBraHgxbjYzeTZxSjdiYVhwVWVEay9RRHl3?=
 =?utf-8?B?NXFjZmhLWVFKOUw1THBIYWVOL3VmcytrOVlsbm9BOVh5MmduZmZ5WFg5eHU5?=
 =?utf-8?B?ejVINjhkRTc0NVJBci9MdXhtcmpJc3EyYW9TNVVkNGhReEZmR0U3YTBTdmxk?=
 =?utf-8?B?VWpTN0pwVXRUZ0dDa01NTjhVZlVCd25GdkxkM2NubVNSa2NlSWlBYVFIVDla?=
 =?utf-8?B?N0VXdGtLUEJGNWtLaVlpK2Zrbys4OHp3TzJrV3NmMFgxaDNIeFIyajlmWUI1?=
 =?utf-8?B?M0RnR25HSnBJVWxEZ0JLYjJLNHZiU2ZubnozUHBXcWRqZDBVeGpEYUViZWpH?=
 =?utf-8?B?SC9GUXJ3amdKNDIvQjhWWGNBMkt6YTNYZFFEclpLMkFmRm1panQ1b0habmtK?=
 =?utf-8?B?VkhDSkdOQ2J4MjBpU05MSW0xeVJCWTZsTHdLWC93cUt2bDBML1RaRHh2MVdj?=
 =?utf-8?B?eURpSVVvdXJBUFdOY2xsM0lNWkNYeUZBZ2V2ZkhoMXl2MG1iSGJqOE0yWjNj?=
 =?utf-8?B?VGsvM0NiclhOdlNmVXozaU9RVFF5ci9YR2tPWEFVaU1icG5mbmdrOGlhZXJZ?=
 =?utf-8?B?Y3hLbE42Zlorb1FSL3M4bmVkenJ2S25tL3BVMkhoaTIyUFNBYTVWWWV2d2xN?=
 =?utf-8?B?YWpUMG1lTkRyeWtoWU96YW5MTkRBS1MrMTBqTGhrVURKWGpGYkVhTEQwVVkz?=
 =?utf-8?B?OFVFY3BLUTJZK1ZoOEVyaVdDNURFakZDelhhU1h2ZURxSHVHVUhWVGRlWVkr?=
 =?utf-8?B?dExuc0xMbTBVNEd5MU5MRG9EeHcrNE10NFRXZTgrK0hud2NXZ2psZFJHN2gw?=
 =?utf-8?B?KzJJR2tUdGJISzBQckFnMmdCSENsYnVzYXZwVC84WVJKVi9iVmtiTHpSc1NB?=
 =?utf-8?B?RU1rd3hGbUFtSGpTMWl3S251WHhWY3k1WksyeDFtS3NwRlgyWGd1YmVyTHJL?=
 =?utf-8?B?UGdCV1JoaFJBUkJaejFKYjBGcWtFekt1WnFaRkMxdnZubzhvY0FPNzVQMEhI?=
 =?utf-8?B?OVlhNEhIWk9nc3l0WHNjNE4xWHd4a2Z6eGZlQ1ZrcXNZYlJYYWIxSUhTOXF3?=
 =?utf-8?B?TmtjQ0Yva0ZRdkdGOCt2RTA1cWt2U1l1OWZyZUNuVG1aK2pIRlR6MWNtZDJl?=
 =?utf-8?B?VUlxZy9XWWpUOStGRENHUTZzZVRpdjVjL3hMR0RHQXJRM3NiZllhNS96QzB5?=
 =?utf-8?B?aXpXNFlSVHVQN1djL1FCWDY2QyttV2JYMDA0YVorVTdnY2tCblpjYmV3WW91?=
 =?utf-8?B?bWNpWHFhTS9TbE5jeXZBWFB0aklmQlJCN0NpcjdSZlRCSlJIUWlLY1YrdlMv?=
 =?utf-8?B?eUJzSnovQWc5emNoTmI2cDZtMnQ5MmJXYW1acU5OaGVYMFEyUTY2S3dnbTNu?=
 =?utf-8?B?RUpyWDRBR1ZSbE4yVGxHbFFBM1RuWDZ6Sisvb2ptcGozaW10TW5uRWJZRFN1?=
 =?utf-8?B?dFVFb0U1SkRZdjVUbmNZMnZuMHFKVXVDcFBVTGpLK2F5QlNpQ2dGckpNRDUy?=
 =?utf-8?B?NnU5aDgwc3BPTkxuSTVrNWRua3ZDaWwvNUZiY3lQYzQ1eUFJVDVHaXFYZDlZ?=
 =?utf-8?B?VmNwTFRLRVJXTjEzZDlNL0FOTS8zWGplVGVrdHUyMXpPTnFnQUdnRnpsa0ox?=
 =?utf-8?B?cHZKb1NFeU5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3BPbjFuWXRzVWNFUHJvZkNqQTVFdFNkNU5ZQnhWQUFXTzhvNXF0L3hlcW0w?=
 =?utf-8?B?V0l5YjhiQjZmMWFNRnIvbTJLS2ZWREFQVjc1OHArVlB0N0J6Q2taUUJ2M1Qv?=
 =?utf-8?B?Uk9qVU5xWFhNY3RSay9RK1lrWDhDeEVQdWRwQmFEY0dWV2lMQ0I1Zko5bkxE?=
 =?utf-8?B?eVVXRURZbDJBaWhxMzFvUGFYN2tjRS9rN1I4Vjl2NHArQkZpbm5lT3k0TFVp?=
 =?utf-8?B?Z2p3SUU2dFdUbnJldVlad2srVk0yMzZmQ25Takxmc2R5eElQUjBTSmhIS0Vl?=
 =?utf-8?B?c3lVZ0hONk0zSG0zeHBGYVp2ZHRkRThJd2RWUW5wU2NmdnBDd2szTzE2aEJR?=
 =?utf-8?B?Y0xrUGxkY3ZsWHJPZUNrbEd4YzQzUDlLcWpGaGdWczhNejRPWm9ZZ0xUTndN?=
 =?utf-8?B?NEdneUtQSHlxMHN0eWcxaWhlSDFQMjJwTWhkQi90d2xOSHRvSWNnQkw4ZTAv?=
 =?utf-8?B?eHlHUGRWL0wzN0xoUnBOU0NwU2hZUGpvTXFabnUzQU45bTc3aDd2WlZLc3JO?=
 =?utf-8?B?NkU1Yi9oczdzYTNhN3R1YUdQSU5POHVwbE9OY1FaMGZzWjBYcjRxUE1DdFU5?=
 =?utf-8?B?Q0h4ek5sYTlZRnBoT3NRRGlCRjZHUDVDcWxVZy9VeGorUjd6NWp4eG9LYnls?=
 =?utf-8?B?VWkzZ3MzUFNCVU5vbHNubUwzdm9MZ0pmSGtHQUVaVDcxenJrNnZLNUVlRnBH?=
 =?utf-8?B?YUo4T2JtWERsRU04U1pReWJRaVhEeFRCOE9Xcjc3V2tzRkdRbi9ZMjVxSmJJ?=
 =?utf-8?B?cUtuVWNUWDFVSEwxSlBqL2hGNUhJZ25MZ1pWYVkvWVZkMi82TStpTUhhZXBJ?=
 =?utf-8?B?WDl0d0R1QVpoVkpFZ01UbzZjRXpaeVFLT2FSYk5KdGN5UUQ4WkVmQ2Uydmt4?=
 =?utf-8?B?bVI3Q05VOG92c01MYjdJbVozb25HTk00YWFEN3Z0OXVDMVRkdUFIUVJnSFh5?=
 =?utf-8?B?MUVobUltdHBLRGlxVFNHODBvcGdld0MwMCtzcU8rZ0ZzM1FWK0g2K1RwL0VB?=
 =?utf-8?B?M0ZUL1c4SHVJc1J0em1ubjRQNFBjZldlNzFQMmZjQzBUSUJ5NncyQmlJQUZL?=
 =?utf-8?B?eWtjSm0waUV4V2VnemIydGlQRlpPZGJWK2JBSUlJajdHM2dWaUZnSk11cGtL?=
 =?utf-8?B?Q1NDUHFyYzIxd2p5U0tucWxnVTBQN2pqcHVVNjFjTlRkUFJGKzArNUEwUUpB?=
 =?utf-8?B?ZXlxWnRucEVmWlY3OHFyL0thY1VhNmxoSzdUY3F2TDN2RFVPZlBXZXNrUEJl?=
 =?utf-8?B?Rys4c2lPQm50ZS9KR294UEJaamVUclZhZjhJQ1lteEo3MlFXUW4vU3FPSk1K?=
 =?utf-8?B?NWtrTDZ0dmtFeGhJbnA3WEF0aXhmYklKOXNKM3dmYzFHeHhUVDY4MnZEL0xa?=
 =?utf-8?B?clFHRXd6ZkxLcUNMRFZmc1d5QWFlWW1kMW5QTWRxYjZGTk53MEc2c0hCTjhO?=
 =?utf-8?B?SFNRdHUyVERMWW9FR2ZhTzBqSmRyamhMU2ZmdGora1ZsbFlmR3NhYWhLWlFx?=
 =?utf-8?B?QUN5M1c2cktjdGdGTWdTa050ODhYUU9nV1FZcHlROERzQ2VtM3ZhcUNIempz?=
 =?utf-8?B?MDlqYjc3OHJLQkhwQ2VIaHpGenlCM3dOUWM2SW9jaG5tL3I0WTVNUEt0cGdQ?=
 =?utf-8?B?anE4dHFwVUFOZlNKME1NNDRQek5BRjFCWlZtdkNUU0lqRDc4ZUJ2akkzTnhO?=
 =?utf-8?B?UmhZTjE5ajBJU25qMk5NU0t6UWtqUWhxOXJMRGExTng4R2lDNHYwOEF5NFZI?=
 =?utf-8?B?K3hmc1YvNWFMcHJTUTJNUmlQaTJ2TDlXK04weHhjd0NMWFUzV0sybHgreksx?=
 =?utf-8?B?WVZMYml1VkNGTzdjMEllQ1pMVlFQRkV5S283QlBNbHcvZWxQT2U2MUJGZ1dF?=
 =?utf-8?B?Tk5heFJ0WUJLQnhxZnFFSVpPSXl1cHdqQWJqVnVicTE1Wm5SaEwzRWJNaDR4?=
 =?utf-8?B?b1BDYWdpdzZTU3BsTGYyd2hLbHNSK25IODRSZCs3dnRFaWFCdkdRK08yMkt0?=
 =?utf-8?B?SlNNSGZKUnJaSERoRDJ5SUpFUXhxV2ZHYWVqTm1ReENUNDVDSnkwZ1VSVWkx?=
 =?utf-8?B?Q3VyMldZSDVNY0hwWjFkY1J3RTczR2FTb1dwQnZkQjBTRGlzRnJSNnRsd240?=
 =?utf-8?B?SzVJK2Z0M05CNGppdnNHdzdWS1VZak9HWCtHVUhqTS9FMlArSkdVd2EvY0hK?=
 =?utf-8?Q?OTWIw2XmgCmezuu76dWTtHummeGhGfRFbxWe/3DZ16jD?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1603a1e9-02fe-4884-7cdd-08dd8bad7ac1
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:18:56.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/A/xaeNbbf/GcE6INIfri76aTG0hqu+jJsaBNBqI6wyB0Rjptgn7WpajyjqyUv1NjdEhGiZ3XftSts3shmdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2248

Hey,

can someone please take a look at this patch? I can also re-send in case 
it doesn't apply anymore. Thanks!

- Daniel

On 1/13/25 19:56, Garrett Giordano wrote:
> Enable the BANG BANG Thermal Governor to manage the GPIO Fan using
> hysteresis on the PHYTEC phyBOARD-Lyra AM625.
>
> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..3fd04c689269 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -690,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>   CONFIG_SENSORS_SL28CPLD=m
>   CONFIG_SENSORS_INA2XX=m
>   CONFIG_SENSORS_INA3221=m
> +CONFIG_THERMAL_GOV_BANG_BANG=y
>   CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
>   CONFIG_CPU_THERMAL=y
>   CONFIG_DEVFREQ_THERMAL=y
