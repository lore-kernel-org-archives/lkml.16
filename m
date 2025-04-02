Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7E2356DF;
	Wed,  2 Apr 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593225; cv=fail; b=N3kkCP+8wvqL4qr2WCgJK4Me1B/O701zRx24me2sL+HF+VHI2B8HcRtD2z2wTfhaBwWkAu5kGXSGZXB+Bk8MGllEuIbp1XjLNCsa1Cr0ZwugG/a12ANtMzqXz29t7lRjLHBk8ruHTYJDkxURA4U4JsPWs5iDKOey4Ft6gxzZRGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593225; c=relaxed/simple;
	bh=YQ7FflcPI+MnyW/aS8Ij4oi2qnCQNtRg/E1PwnEoy5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TlFwJGn72QqIB757XSqJyuFXTDw4CA0l4s5QhJ14bJFkRJxT7IPHn69S73n5162FNGro8SPwveLIYAcvTYT3yQsc/z1rfva2n5P9oe5hom8AL9vikwjNRWeomtZXTJfr68PP3+Os4q8w/sUTml4tSMXkIaoa252F1PnUzf2+HDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hRNIjBLg; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hRNIjBLg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7xLOqzzlykWcOGGaJ8VzS8ya1MveP095rckagOC1ONkCu2ehgbLxXyORueR0ILt/AJDeEC7m0AEoDdt7yPfmPGvnZ2TuZ1LbBOa7JqRpVe5h0MudSadwcXNCA33UkKVsa5VL2M56LBzawC6cUBdYfJauCBCO5oYRxgXh78GGgZPgYUEs3Bfs2szrLTj6KsGJOQ6PWCUbV5Mq/GZZOtEwzYABZZPyIqHMb25r6/kxkLgsAMfiBSOhWT4wKDDOY+4Ho5PD/8QPW5lM/yqF0UQcOqklNu+e/Vo9H0OEr8m4RCwnAB9n0a4xnAGPp+whA5P266QzWORryTwWnYTbLwKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aVpdlW6kf2GwtvZuZRzEKJ8gogNujZF2ZW6ZIdB8g4=;
 b=DfqvO9l5deF97CUQxc1A4GtvB36gdx4UaOQMgGlerNp3C8s9CZtPQ+zi89sWQXXVdbQ+92UEi8dLW5CAzp8xpc2gojzE0QF3yjODfqop+sWtqWgemGSh1HM3L4W5ZY3MxP4xtdkG9cjUqNQcW9xS7+8yObEaz9SbzFXiiTksQq9hUp7B1HoEFdnj8Xpx9bL0pNMmeNyIvStG2JyARcP63AgCRsPdr1xAQGKPnom5m3yyoG9xoCjX4+L7SwnNfX5jAn7ZerDyDaKMe2neaSd1teB0GD6JYhYCM60pfYvFonrBFitjwH9EQgG0U3UX27q879syoRN4l8Mx4c3rO+nI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aVpdlW6kf2GwtvZuZRzEKJ8gogNujZF2ZW6ZIdB8g4=;
 b=hRNIjBLg0XJeG9cOYDEB+4Rm9fqDMHclOM4raTv2vjU7K1uKnBIDwPcp6T7nBT+AGE4UHXGl8GSQPwWGA9m7PDCAjmMpId+r+JgEe9ODqVCZLm1wq0toBgFTXxDWFy7EJzXiUX9cJbAY5sWtCq15+qGYNaUXYozrXa5oUos86paEfRHZcDrJTVL8kWWcY8dzE0FLnpMv14skmzsbWzTgG5QFqZUdsdzJgSULdjzK3pW7G4nfG7VqlvuYwVXXGX6j0o9ap5Y0MjGNLQUJvNueP9W9fvV+hAx7/a4qLpH/BiWQPC7fOmKTZlRNXg0pYDW27r8zvhRYXKV8iqh9Q1U2Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 11:26:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 11:26:57 +0000
Date: Wed, 2 Apr 2025 20:35:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402123503.GA23033@nxa18884-linux>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 5277a971-376d-43ab-4220-08dd71d944ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QktEb1ZWcytIRXVpY0VhVVd2OWNEUG4wSytYQ1dxbFpudHZLbTFXV2tOSHZZ?=
 =?utf-8?B?VnVNYlFlL0RWcW8rWS9QYVRId3JTMWljc0o3YlRHZlhiTlRPR2ZqaGNWanNp?=
 =?utf-8?B?N3daOE81UGozY0loOEFjby9KM2dlVWorQk1Ha0FuQndTbDVTbE1RT2l3VjVT?=
 =?utf-8?B?QUFrOCtRaUtKZWpuWC9mNk55Z0lhSTJNcEhpTTdlV25mNnlka2pIS2c0Z3g4?=
 =?utf-8?B?OEJZazFpOXJZMkk5L0xDNWN0VHAxU3ROejlMNjBHQWRSalJ2eW51dXRKanJ3?=
 =?utf-8?B?OGxNZVVHcWRuUUR5Qis0UUN1amFxaHhEMWNVMXFhV0djdXRubWh1b1U4VVUx?=
 =?utf-8?B?NUlpZHpEWEZtOWxxYm93d0lwYlZaTkhHTmc4SCtSZSs5cm0yY1F4eGRXZHl6?=
 =?utf-8?B?aDhWNDFZTStTTkF6SHVQd3p6UG5MVVJuWEJaSjAxa2MzaGxIUGlRYVhEQnp4?=
 =?utf-8?B?MEl6ajRoSitFWTFuSVUvZ2Jzb2wyMjY4d0JOa00rZEJzOUZmTzNFMU8zbG9Y?=
 =?utf-8?B?bFhMb2FicUZ3SVdIbFZydml1bG90WG02eDFrb3MvZUNHZ1h4U2tzWjhkUjA5?=
 =?utf-8?B?RG5ZcGd5RjQvMnpubVRldmprdlRBUFlENTZNNC9oVFRNSVJYMUZKaTkxU09x?=
 =?utf-8?B?ZWRIUTR2WVVqK3NMUVlmVk1XVzRTb3VtMmpHcDdaUktJMkluWE5tV053U1JG?=
 =?utf-8?B?V1BuT25USVZFdG1ySC9yZE9EYU0zSVc5WnFXL05QU0hGU29rNVh4WGtiOXdz?=
 =?utf-8?B?K3R1eFNLdHhIdWhwZTc1YXRpTTJlYWMvb3Q5V29UV0VoL2lIMVh6OUo4VER1?=
 =?utf-8?B?MDdURnlxM2RFYUpERmtKbnlRZWpBaGZIUjBnZ3d5dDdPeU9NV0pVdFhQbHox?=
 =?utf-8?B?V2Y3N1M3VGhQTGpEc3E2bzBNZU5KRnZDYUIzWTYzaHRrN3RwL3Fkdjc2QlNj?=
 =?utf-8?B?NTVJbzdxZHlzTUVkcE1yZ1FWeUxwSGs4UXhSbzNXVkNXWk9JSEl1T2dYMEdT?=
 =?utf-8?B?UTNwcEZLVE5rVVQxazNhUllPUi9tRmkwN254SjN2SDh5ZXFQTHFNVFoyc3BC?=
 =?utf-8?B?LzgzMUYrak01U3dzRlJrRzNlNGUzU2FnRmR6SDRWRUpKSjNqMTJCTFpzUDk4?=
 =?utf-8?B?TXVRankzZzJzdVZEd0UwdFBGZUFjZG85SEpDd2c2NkFLUGtZT1puMmIvRTNQ?=
 =?utf-8?B?eDJHMGhBaG85TzdtYk12ZUVsWTg4U1MxMjN5WjlIODN0UzlFS09SSkRpR2lv?=
 =?utf-8?B?N1FuZGhJYkJ6NjV1TXFuWkhHRkxQT1FyRDJRYnJKL3RRbkJyeWhCajZiTUE4?=
 =?utf-8?B?ZFdLbWhwNk5NL0RLbWYwaHkyMHZCemE1STVVVnJsWVFaTkdVZjBPTEVnZklS?=
 =?utf-8?B?d0JvUWhFMjI4TFY4RTJRRDZubHcvdXZVSkZmYmhNSHVrd3ZQUlFjQjZDeW9R?=
 =?utf-8?B?V0VIdUFlbjJFanV4dEFRTkZDM1doaXcyaTdwVWFrMm5SRWFCSkVkbERTNUxt?=
 =?utf-8?B?azNkR0I2S3lyOHZ1NGlnajVKcmpLMVo3QXNTOHBMME85MnBUbHRlV1FPM2l0?=
 =?utf-8?B?UFJ0VU1SeG9OM2FwNkp3M2NZNURiNDZjNjByRHdPTkpSSVg3ZE93NmpYUTg3?=
 =?utf-8?B?a0FISWJHWVhSbElqR1FJRU9OeFJuWVpyeWp5OWl1eFBIb2VYaVdjOTZBZlZs?=
 =?utf-8?B?RERuelpuNG54cWNXNzJnMVBBZUJvdUFoVWc3SHJoRHl5QWdhYjdQZVIyN0NT?=
 =?utf-8?B?KzhKcmx4UjN5SGhsbXJQNk9rSmVRdllzUnBNZFlsQlcvdTB3WGp5bFJGN3pN?=
 =?utf-8?B?blE4NWFHK21GaFdIM2NyMmd0M2pFc29hZEN4SWhubFUrRDkwNHp6cjlEbXhi?=
 =?utf-8?B?bDZZemdiSnl2RU1xcUxQQnlEa0M2dzAyeHdKS2lTNUdJSWNhanNhNVBZcXkr?=
 =?utf-8?Q?oQ/v8XT4rbbx9YwT/YluUlfW2Uf/L304?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME5GSjlhVWFZaXVBZk5ubHUwbzhVUklTa3NXVEgzSUttRGFETmVmeEx2NVJW?=
 =?utf-8?B?UmIvMmwwREdkLzdHbTJuQTk0dlh0SHg2bjhBbllhZzlQRUh1Yktuc0ZpaHlm?=
 =?utf-8?B?a1VkOEZHNjBiUHBjWmVMM0ZFOGdXVCtkWTM1UG9uWXlrOVVKZ2o1b0luZmVl?=
 =?utf-8?B?N21XOGxyMXpuR3M5WnpIRUYrQXR5YVQrNmFhUEh4TzhwUmNpRUJlV0RpSEVx?=
 =?utf-8?B?SStRdlMxTjBQelVnL3NRbCsrZEowdThoQytneDdMTHM2LzNmbjBzc2ZNKzJJ?=
 =?utf-8?B?UGx1aUFRMkRKdlhhZHVDR2NKYk1OVmY1cjN2QlF3bk9DK0tkc0o4MnBkUG5Q?=
 =?utf-8?B?ZEpaTGhuNVdYb1pvVkFudnNrY3loOWpQWUY0ZjFGU1BiWDVLSHRqRFRkRkpE?=
 =?utf-8?B?R3E2Z2FuVjlrNitOYVJhTGsvSG1ScVRodm5nNlpXUHJJOUtlTzVvcXJjMWY4?=
 =?utf-8?B?aVJkcXptV3V5Vk5mQjgyNGhZWWVpRDFkTk5Rc1FIWGRiQzlXSXY2VUp5WXhO?=
 =?utf-8?B?T09YZE5QUVVhcVN2MkpPSVExcGVXZkVSS0xXUDVVbmY0bEw0eVdTc2c0dTRJ?=
 =?utf-8?B?MHFNV1RVcVVzRjJCeHR2eFRDTTNkR1BzeXpxa2Z5eFpKNVVISitqM1JOdXYw?=
 =?utf-8?B?ZzBsM0pDRjdCSlp6MEtNNm9SbzBvQ2JiaERzTGZweUVDRDFSc2p3TGtTUmls?=
 =?utf-8?B?bjJaQ2RWeE5lR2hTYzVOeFAzOUlzZlNRMXNKMDhscjJ1cnExbW85REdoa3FT?=
 =?utf-8?B?cmpmTERCWjRpT2VWZEFKUkF2SXhOZ2xYSDNNUnJHQjNMQWJLRk40QWxWa1ZZ?=
 =?utf-8?B?bDlqSkJTZzdEcldIRGZ2SFBJYnFBQjlXd0VWRnQ4aWpGNUNWZmQrQ1Vxclgz?=
 =?utf-8?B?cEpCVzRCM3NWNGl1Y1FHZlo0QXB0MnM1Y1dHVFhaUGZpZWRzMUNDdEtpbk4v?=
 =?utf-8?B?V1gyY3lGeVh1RU5oSE5SdTdnTjZDZ0Z2cDJCYzFjM2IvUmdsejBqdlYyUENv?=
 =?utf-8?B?aVFLN3d6cDVEK0Mvb21aUHd2bGVsVkJwVFNicWpHaXpFdEpOMTBSK2taeWZq?=
 =?utf-8?B?c2Jib2pzNndxSjdoU1JTeGRyWk9Ra2tnNGY3SFM2R0RQQnk4bjc0ZEtoZzkw?=
 =?utf-8?B?Ykpnb2dBRFFYNU1EbGVlV1dubjlycGlTZ3h0MkNUU3RrdDRLa0RHaU15dmo5?=
 =?utf-8?B?dTYya1VkWGVPZTd1V3dhUjQ0enFWTW4rTnNKMjVzZ1ZaaUluY2hQY3VlSDUw?=
 =?utf-8?B?VG9OYnVveWwvMGdrM2EvNWJGSVZ1d0NVWWtvSDRIcjVUT1B2ckQrT1dqQTMw?=
 =?utf-8?B?OHFlSXVZcHJSMWd5dTBaZTlleTNHbmZOeWdHYXV2eE5JQlUxbnRXSUJ3TW44?=
 =?utf-8?B?MnhSVXZaVVZ6SmxsbTlkSGdtVWpUTGxXTy8xVlp4cS9xUnlWNWRHL2htTlU2?=
 =?utf-8?B?S2gzOHlBay9RdWxBVFdTL1VzZEJ5MDFOK0NNU2IrYisrdlg0WXdYUnVjSjVD?=
 =?utf-8?B?M2IyL3gwRTNEbEgyUFhFcmhBYXRSUlVKUzFxWlRGdVVwZzZlYmpTbDhuSnJC?=
 =?utf-8?B?VCsvL1hRQ2ZGaVp5WnhNS0piSG1XdTJWQlVBVmRWRnJxc3hwR2FCTTM4MVVZ?=
 =?utf-8?B?SzJHUXJML0Q0WWZEaXIyeTJJZHRnKzhTUEExRStmck5vSFhkVmN4MXNYTFYw?=
 =?utf-8?B?YmlsaDhEZkNKbUJrV09YakE5eHdRakFXME9QZW9TdlVMWC9lRjlkcjdEVFJl?=
 =?utf-8?B?YlduY3dlUFlvZ0lUaGJqMFRUbzk4VXNwOWVHZ2NISktING5ubVFZK3ZxYk5y?=
 =?utf-8?B?VjNyMUVKWU94ck9CMUhyM2lZYUU2L2EyWjdJblFSMUpTb2ZZV1FrdVYwZkcz?=
 =?utf-8?B?VElMbWIzRzVNMGpjc0ZOMEd3SEdwdUV1TDJWTkMrOGExNzduVlJvb2YxekZU?=
 =?utf-8?B?OGhPKzkra1UwUFk4TThyZ1NMNnIwT0F1aVNYdHhUTGVZQUNFZ3FzaHdDUDlX?=
 =?utf-8?B?a3FhVGlRVzVtcDlQRGxUTHFyQmduQ1M5SFRSSVVyOWxyY2xaSEZWMTRPblNn?=
 =?utf-8?B?ZjBUYm45c2hlRVZzVzZVQThoc0lIbm9yMUZyV0gvajBMQ0RrRVpuVHRpdGFH?=
 =?utf-8?Q?jXrEiGBBFKj5BqB7mK/pKHwuR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5277a971-376d-43ab-4220-08dd71d944ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:26:57.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: by+m8h297Mn+h5Ufw5Kq9J3wlj1mfVJenNt//bdcYCGsJ9JT+8UzkjWGEtexhGbuJQm317Zov4DzuSV46NGTbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7511

Hi Sudeep,

Thanks for reviewing the patch.

For comments that I am not very clear, I marked with [TODO] for easily
jump to.

On Tue, Apr 01, 2025 at 03:15:46PM +0100, Sudeep Holla wrote:
>On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
>>  1 file changed, 801 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> @@ -32,6 +32,501 @@ port, and deploy the SM on supported processors.
>>  The SM implements an interface compliant with the Arm SCMI Specification
>>  with additional vendor specific extensions.
>>  
>> +SCMI_LMM: System Control and Management Logical Machine Management Vendor Protocol
>> +==================================================================================
>> +
>> +This protocol is intended for boot, shutdown, and reset of other logical
>
>s/for/to support/ ?

Fix in v4.

>
>> +machines (LM). It is usually used to allow one LM(e.g. OSPM) to manage
>
>Does it make sense to describe what is LM first before the first statement
>here ?

Add below in V4
"The SM adds the concept of logical machines (LMs). These are analogous to
VMs and each has its own instance of SCMI. All normal SCMI calls only apply
the LM running the calling agent. That includes boot, shutdown, reset,
suspend, wake, etc. If a caller makes the SCMI base call to get a list
of agents it will only get those on that LM. Each LM is completely isolated
from the others. This is mandatory for these to operate independently."

>
>> +another LM which is usually an offload or accelerator engine.. Notifications
>
>Spirious "." above ?

Drop extra '.' in V4.

>
>> +from this protocol can also be used to manage a communication link to another
>> +LM. The LMM protocol provides functions to:
>
>Either redefine LMM here or add acronym LMM in the title above and drop SCMI_LMM
>
>"System Control and Management Logical Machine Management(LMM) Vendor Protocol"

As write above, will add LM concept in the beginning and drop SCMI_LMM
from title.

>
>> +
>> +- Describe the protocol version.
>> +- Discover implementation attributes.
>> +- Discover the LMs defined in the system.
>
>all the LMs

Fix all in v4.

>
>> +- Boot an LM.
>
>s/an LM/ a target LM/
>
>Applies for the list below.

Ditto.

>
>> +- Shutdown an LM (gracefully or forcibly).
>> +- Reset an LM (gracefully or forcibly).
>> +- Wake an LM from suspend.
>> +- Suspend an LM (gracefully).
>> +- Read boot/shutdown/reset information for an LM.
>
>
>> +- Get notifications when an LM boots or shuts down (e.g. LM[X] requested
>> +  notification of LM[Y] boots or shuts down, when LM[Y] boots or shuts down,
>> +  SCMI firmware will send notification to LM[X]).
>> +
>
>s/[X]/ 'X' / and similarly s/[Y]/ 'Y'/

Fix in v4.

>
>> +'Graceful' means asking LM itself to shutdown/reset/etc (e.g. sending
>> +notification to Linux, Then Linux reboots or powers down itself). It is async
>> +command that the SUCCESS of the command just means the command successfully
>> +return, not means reboot/reset successfully finished.
>
>Extra blank line here would be good.

Fix in v4.

>
>> +'Forceful' means the SM will force shutdown/reset/etc the LM. It is sync
>> +command that the SUCCESS of the command means the LM has been successfully
>> +shutdown/reset/etc.
>
>> +If the commands not have Graceful/Forceful flag settings, such as WAKE, SUSEND,
>> +it is async command.
>
>I would rather put it as Graceful above instead of async as the relation
>is established above. I assume you are referring to the interface that doesn't
>have this flag and not flag being 0.

Right. Not have this flag. Will use below in V4,
"
If the commands not have Graceful/Forceful flag settings, such as WAKE, SUSPEND,
it is Graceful command.
"

>
>> +
>> +Commands:
>> +_________
>> +
>> +PROTOCOL_VERSION
>> +~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x0
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++---------------+--------------------------------------------------------------+
>> +|Name           |Description                                                   |
>> ++---------------+--------------------------------------------------------------+
>> +|int32 status   | See ARM SCMI Specification for status code definitions.      |
>> ++---------------+--------------------------------------------------------------+
>> +|uint32 version | For this revision of the specification, this value must be   |
>> +|               | 0x10000.                                                     |
>> ++---------------+--------------------------------------------------------------+
>> +
>> +PROTOCOL_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x1
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      | See ARM SCMI Specification for status code definitions.   |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Protocol attributes:                                       |
>> +|                  |Bits[31:8] Reserved, must be zero.                         |
>> +|                  |Bits[7:0] Number of Logical Machines                       |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +PROTOCOL_MESSAGE_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x2
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>
>For completeness add parameters here for message_id as in the spec as it is
>referred in the returned value and seems incomplete without it.

[TODO]
Sorry, I may not get your point here. You mean below format?

+------------------+-----------------------------------------------------------+
|message_id: 0x2
|protocol_id: 0x80
|This command is mandatory.
+------------------+-----------------------------------------------------------+
|Return values                                                                 |
+------------------+-----------------------------------------------------------+
|Name              |Description                                                |
+------------------+-----------------------------------------------------------+
|int32 status      |SUCCESS: in case the message is implemented and available  |
|                  |to use.                                                    |
|                  |NOT_FOUND: if the message identified by message_id is      |
|                  |invalid or not implemented                                 |
+------------------+-----------------------------------------------------------+
|uint32 attributes |Flags that are associated with a specific function in the  |
|                  |protocol. For all functions in this protocol, this         |

message_id is not put in the table, but it is list above just below
the protocol name. I would prefer to keep current layout and align with
the MISC and BBM protocol.

>
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: in case the message is implemented and available  |
>> +|                  |to use.                                                    |
>> +|                  |NOT_FOUND: if the message identified by message_id is      |
>> +|                  |invalid or not implemented                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Flags that are associated with a specific function in the  |
>> +|                  |protocol. For all functions in this protocol, this         |
>
>s/functions/commands/ just to be in sync with the spec.

Fix in V4.

>
>> +|                  |parameter has a value of 0                                 |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_ATTRIBUTES
>> +~~~~~~~~~~~~~~
>> +
>> +message_id: 0x3
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if valid attributes are returned.                 |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>
>s/lmId/lmid/ (everywhere applicable for consistency, the parameter name is
>lmid while the description refers lmId)

Fix in V4.

>
>> +|                  |DENIED: if the agent does not have permission to get info  |
>> +|                  |for the LM specified by lmid.                              |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |Identifier of the LM whose identification is requested.    |
>> +|                  |This field is: Populated with the lmId of the calling      |
>> +|                  |agent, when the lmId parameter passed via the function is  |
>> +|                  |0xFFFFFFFF. Identical to the lmId field passed via the     |
>> +|                  |calling parameters, in all other cases                     |
>
>Is this to avoid another interface to get the LM ID of the caller ?

Yes, one LM could only get its own lmid with value 0xFFFFFFFF, it is not able
to get other agent's lmid.

>
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes | Bits[31:0] reserved. must be zero                         |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 state      | Current state of the LM                                   |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 errStatus  | Last error status recorded                                |
>> ++------------------+-----------------------------------------------------------+
>> +|char name[16]     | A NULL terminated ASCII string with the LM name, of up    |
>> +|                  | to 16 bytes                                               |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_BOOT
>> +~~~~~~~~
>> +
>> +message_id: 0x4
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if LM boots successfully started.                 |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
>> +|                  |DENIED: if the agent does not have permission to manage the|
>> +|                  |the LM specified by lmid.                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_RESET
>> +~~~~~~~~~
>> +
>> +message_id: 0x5
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 flags      |Reset flags:                                               |
>> +|                  |Bits[31:1] Reserved, must be zero.                         |
>> +|                  |Bit[0] Graceful request:                                   |
>> +|                  |Set to 1 if the request is a graceful request.             |
>> +|                  |Set to 0 if the request is a forceful request.             |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: The LMM RESET command finished successfully in    |
>> +|                  |graceful reset or LM successfully resets in forceful reset.|
>
>If graceful reset is async, will the return value indicate success ?

Yes. As write 'command finished successfully'
the return value just indicates the command finish successfully,
not indicate LM reset done gracefully.

>
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
>> +|                  |DENIED: if the agent does not have permission to manage the|
>> +|                  |the LM specified by lmid.                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_SHUTDOWN
>> +~~~~~~~~~~~~
>> +
>> +message_id: 0x6
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 flags      |Reset flags:                                               |
>> +|                  |Bits[31:1] Reserved, must be zero.                         |
>> +|                  |Bit[0] Graceful request:                                   |
>> +|                  |Set to 1 if the request is a graceful request.             |
>> +|                  |Set to 0 if the request is a forceful request.             |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: The LMM shutdown command finished successfully in |
>> +|                  |graceful request or LM successfully shutdown in forceful   |
>> +|                  |request.                                                   |
>
>
>Ditto as above ?

Same reply as above.

>
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
>> +|                  |DENIED: if the agent does not have permission to manage the|
>> +|                  |the LM specified by lmid.                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_WAKE
>> +~~~~~~~~
>> +
>> +message_id: 0x7
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if LM wake command successfully returns.          |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
>> +|                  |DENIED: if the agent does not have permission to manage the|
>> +|                  |the LM specified by lmid.                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_SUSPEND
>> +~~~~~~~~~~~
>> +
>> +message_id: 0x8
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if LM suspend command successfully returns.       |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
>> +|                  |DENIED: if the agent does not have permission to manage the|
>> +|                  |the LM specified by lmid.                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_NOTIFY
>> +~~~~~~~~~~
>> +
>> +message_id: 0x9
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 flags      |Notification flags:                                        |
>> +|                  |Bits[31:3] Reserved, must be zero.                         |
>> +|                  |Bit[3] Wake (resume) notification:                         |
>> +|                  |Set to 1 to send notification.                             |
>> +|                  |Set to 0 if no notification.                               |
>> +|                  |Bit[2] Suspend (sleep) notification:                       |
>> +|                  |Set to 1 to send notification.                             |
>> +|                  |Set to 0 if no notification.                               |
>> +|                  |Bit[1] Shutdown (off) notification:                        |
>> +|                  |Set to 1 to send notification.                             |
>> +|                  |Set to 0 if no notification.                               |
>> +|                  |Bit[0] Boot (on) notification:                             |
>> +|                  |Set to 1 to send notification.                             |
>> +|                  |Set to 0 if no notification                                |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the notification state successfully updated.   |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if input attributes flag specifies     |
>> +|                  |unsupported or invalid configurations.                     |
>> +|                  |DENIED: if the agent does not have permission to request   |
>> +|                  |the notification.                                          |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_RESET_REASON
>> +~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0xA
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> +This command is to return the reset reason that caused the last reset, such as
>> +POR, WDOG, JTAG and etc.
>> +
>> ++---------------------+--------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++---------------------+--------------------------------------------------------+
>> +|Name                 |Description                                             |
>> ++---------------------+--------------------------------------------------------+
>> +|uint32 lmid          |ID of the Logical Machine                               |
>> ++---------------------+--------------------------------------------------------+
>> +|Return values                                                                 |
>> ++---------------------+--------------------------------------------------------+
>> +|Name                 |Description                                             |
>> ++---------------------+--------------------------------------------------------+
>> +|int32 status         |SUCCESS: if the reset reason of the LM successfully     |
>> +|                     |updated.                                                |
>> +|                     |NOT_FOUND: if lmId not points to a valid logical machine|
>> +|                     |DENIED: if the agent does not have permission to request|
>> +|                     |the reset reason.                                       |
>> ++---------------------+--------------------------------------------------------+
>> +|uint32 bootflags     |Boot reason flags. This parameter has the format:       |
>> +|                     |Bits[31] Valid.                                         |
>> +|                     |Set to 1 if the entire reason is valid.                 |
>> +|                     |Set to 0 if the entire reason is not valid.             |
>> +|                     |Bits[30:29] Reserved, must be zero.                     |
>> +|                     |Bit[28] Valid origin:                                   |
>> +|                     |Set to 1 if the origin field is valid.                  |
>> +|                     |Set to 0 if the origin field is not valid.              |
>> +|                     |Bits[27:24] Origin.                                     |
>> +|                     |Logical Machine(LM) ID that causes the BOOT of this LM  |
>
>So you support only 16 LMs on the system ? From the initial command it seemed
>256. So what exactly is it ? Please document the same clearly.

Based on our current SoC, 16 is enough.

Since the doc is from imx-sm repo, I need to check with owner and update
in V4.

>
>> +|                     |Bit[23] Valid err ID:                                   |
>> +|                     |Set to 1 if the error ID field is valid.                |
>> +|                     |Set to 0 if the error ID field is not valid.            |
>> +|                     |Bits[22:8] Error ID(Agent ID of the system).            |
>> +|                     |Bit[7:0] Reason(WDOG, POR, FCCU and etc)                |
>
>Is there a mapping for this ?

I will add a note in V4:
See the SRESR register description in the System Reset Controller (SRC) section
in SoC reference mannual.

>
>> ++---------------------+--------------------------------------------------------+
>> +|uint32 shutdownflags |Shutdown reason flags. This parameter has the format:   |
>> +|                     |Bits[31] Valid.                                         |
>> +|                     |Set to 1 if the entire reason is valid.                 |
>> +|                     |Set to 0 if the entire reason is not valid.             |
>> +|                     |Bits[30:29] Number of valid extended info words.        |
>> +|                     |Bit[28] Valid origin:                                   |
>> +|                     |Set to 1 if the origin field is valid.                  |
>> +|                     |Set to 0 if the origin field is not valid.              |
>> +|                     |Bits[27:24] Origin.                                     |
>> +|                     |Logical Machine(LM) ID that causes the BOOT of this LM  |
>
>
>Ditto as above.

16 should be enough as of now, but for 256, I need check with firmware owner
and update in V4.

>
>> +|                     |Bit[23] Valid err ID:                                   |
>> +|                     |Set to 1 if the error ID field is valid.                |
>> +|                     |Set to 0 if the error ID field is not valid.            |
>> +|                     |Bits[22:8] Error ID(Agent ID of the System).            |
>> +|                     |Bit[7:0] Reason                                         |
>
>
>Mapping again ?

Same as above

>
>> ++---------------------+--------------------------------------------------------+
>> +|uint32 extinfo[3]    |Array of extended info words(e.g. fault pc)             |
>> ++---------------------+--------------------------------------------------------+
>> +
>> +LMM_POWER_ON
>> +~~~~~~~~~~~~
>> +
>> +message_id: 0xB
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if LM successfully powers on.                     |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
>> +|                  |DENIED: if the agent does not have permission to manage the|
>> +|                  |the LM specified by lmid.                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_RESET_VECTOR_SET
>> +~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0xC
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>
>I can't recall if I had asked this before. How is this different from
>CPU_RESET_VECTOR_SET ? Why do you need this ? Why can't you use
>CPU_RESET_VECTOR_SET with an additional LMM_* command.
>
>I am sure there is a valid reason. If so please document the same.

CPU_RESET_VECTOR_SET is for cases that M7 and A55 in the same LM.
LMM_RESET_VECTOR_SET is for cases that M7 and A55 in different LM.
M7 LM is under control of A55 LM

>
>> ++-----------------------+------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++-----------------------+------------------------------------------------------+
>> +|Name                   |Description                                           |
>> ++-----------------------+------------------------------------------------------+
>> +|uint32 lmid            |ID of the Logical Machine                             |
>> ++-----------------------+------------------------------------------------------+
>> +|uint32 cpuid           |ID of the CPU inside the LM                           |
>> ++-----------------------+------------------------------------------------------+
>> +|uint32 flags           |Reset vector flags                                    |
>> +|                       |Bits[31:0] Reserved, must be zero.                    |
>> ++-----------------------+------------------------------------------------------+
>> +|uint32 resetVectorLow  |Lower vector                                          |
>> ++-----------------------+------------------------------------------------------+
>> +|uint32 resetVectorHigh |Higher vector                                         |
>> ++-----------------------+------------------------------------------------------+
>> +|Return values                                                                 |
>> ++-----------------------+------------------------------------------------------+
>> +|Name                   |Description                                           |
>> ++-----------------------+------------------------------------------------------+
>> +|int32 status           |SUCCESS: If reset vector is set successfully.         |
>> +|                       |NOT_FOUND: if lmId not points to a valid logical      |
>> +|                       |machine, or cpuId is not valid.                       |
>> +|                       |INVALID_PARAMETERS: if reset vector is invalid.       |
>> +|                       |DENIED: if the agent does not have permission to set  |
>> +|                       |the reset vector for the CPU in the LM.               |
>> ++-----------------------+------------------------------------------------------+
>> +
>> +NEGOTIATE_PROTOCOL_VERSION
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x10
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++--------------------+---------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++--------------------+---------------------------------------------------------+
>> +|Name                |Description                                              |
>> ++--------------------+---------------------------------------------------------+
>> +|uint32 version      |The negotiated protocol version the agent intends to use |
>> ++--------------------+---------------------------------------------------------+
>> +|Return values                                                                 |
>> ++--------------------+---------------------------------------------------------+
>> +|Name                |Description                                              |
>> ++--------------------+---------------------------------------------------------+
>> +|int32 status        |SUCCESS: if the negotiated protocol version is supported |
>> +|                    |by the platform. All commands, responses, and            |
>> +|                    |notifications post successful return of this command must|
>> +|                    |comply with the negotiated version.                      |
>> +|                    |NOT_SUPPORTED: if the protocol version is not supported. |
>> ++--------------------+---------------------------------------------------------+
>> +
>> +Notifications
>> +_____________
>> +
>> +LMM_EVENT
>> +~~~~~~~~~
>> +
>> +message_id: 0x0
>> +protocol_id: 0x80
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |Identifier for the LM that caused the transition.          |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 eventlm    |Identifier of the LM this event refers to.                 |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 flags      |LM events:                                                 |
>> +|                  |Bits[31:3] Reserved, must be zero.                         |
>> +|                  |Bit[3] Wake (resume) event:                                |
>> +|                  |1 LM has awakened.                                         |
>> +|                  |0 not a wake event.                                        |
>> +|                  |Bit[2] Suspend (sleep) event:                              |
>> +|                  |1 LM has suspended.                                        |
>> +|                  |0 not a suspend event.                                     |
>> +|                  |Bit[1] Shutdown (off) event:                               |
>> +|                  |1 LM has shutdown.                                         |
>> +|                  |0 not a shutdown event.                                    |
>> +|                  |Bit[0] Boot (on) event:                                    |
>> +|                  |1 LM has booted.                                           |
>> +|                  |0 not a boot event.                                        |
>> ++------------------+-----------------------------------------------------------+
>> +
>>  SCMI_BBM: System Control and Management BBM Vendor Protocol
>>  ==============================================================
>>  
>> @@ -436,6 +931,312 @@ protocol_id: 0x81
>>  |                  |0 no button change detected.                               |
>>  +------------------+-----------------------------------------------------------+
>>  
>> +SCMI_CPU: System Control and Management CPU Vendor Protocol
>> +==============================================================
>> +
>> +This protocol allows an agent to start or stop a CPU. It is used to manage
>> +auxiliary CPUs in an LM (e.g. additional cores in an AP cluster or
>> +Cortex-M cores).
>> +Note:
>> + - For cores in AP cluster, PSCI should be used and ATF will use CPU
>
>s/ATF/PSCI firmware/

Fix in V4.

>
>> +   protocol to handle them. For cores in non-AP cluster, Operating System(e.g.
>> +   Linux OS) could use CPU protocols to control Cortex-M7 cores.
>> + - CPU indicates the core and its auxiliary peripherals(e.g. TCM) inside
>> +   i.MX SoC
>> +
>> +The CPU protocol provides functions to:
>> +
>> +- Describe the protocol version.
>> +- Discover implementation attributes.
>> +- Discover the CPUs defined in the system.
>> +- Start a CPU.
>> +- Stop a CPU.
>> +- Set the boot and resume addresses for a CPU.
>> +- Set the sleep mode of a CPU.
>> +- Configure wake-up sources for a CPU.
>> +- Configure power domain reactions (LPM mode and retention mask) for a CPU.
>> +- The CPU IDs can be found in the CPU section of the SoC DEVICE: SM Device
>> +  Interface. They can also be found in the SoC RM. See the CPU Mode Control
>> +  (CMC) list in General Power Controller (GPC) section.
>> +
>> +CPU settings are not aggregated and setting their state is normally exclusive
>> +to one client.
>> +
>> +Commands:
>> +_________
>> +
>> +PROTOCOL_VERSION
>> +~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x0
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++---------------+--------------------------------------------------------------+
>> +|Name           |Description                                                   |
>> ++---------------+--------------------------------------------------------------+
>> +|int32 status   | See ARM SCMI Specification for status code definitions.      |
>> ++---------------+--------------------------------------------------------------+
>> +|uint32 version | For this revision of the specification, this value must be   |
>> +|               | 0x10000.                                                     |
>> ++---------------+--------------------------------------------------------------+
>> +
>> +PROTOCOL_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x1
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      | See ARM SCMI Specification for status code definitions.   |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Protocol attributes:                                       |
>> +|                  |Bits[31:16] Reserved, must be zero.                        |
>> +|                  |Bits[15:0] Number of CPUs                                  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +PROTOCOL_MESSAGE_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x2
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: in case the message is implemented and available  |
>> +|                  |to use.                                                    |
>> +|                  |NOT_FOUND: if the message identified by message_id is      |
>> +|                  |invalid or not implemented                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Flags that are associated with a specific function in the  |
>> +|                  |protocol. For all functions in this protocol, this         |
>> +|                  |parameter has a value of 0                                 |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +CPU_ATTRIBUTES
>> +~~~~~~~~~~~~~~
>> +
>> +message_id: 0x4
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 cpuid      |Identifier for the CPU                                     |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if valid attributes are returned successfully.    |
>> +|                  |NOT_FOUND: if the cpuid is not valid.                      |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Bits[31:0] Reserved, must be zero                          |
>> ++------------------+-----------------------------------------------------------+
>> +|char name[16]     |NULL terminated ASCII string with CPU name up to 16 bytes  |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +CPU_START
>> +~~~~~~~~~
>> +
>> +message_id: 0x4
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 cpuid      |Identifier for the CPU                                     |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the cpu is started successfully.               |
>> +|                  |NOT_FOUND: if cpuid is not valid.                          |
>> +|                  |DENIED: the calling agent is not allowed to start this CPU.|
>> ++------------------+-----------------------------------------------------------+
>> +
>> +CPU_STOP
>> +~~~~~~~~
>> +
>> +message_id: 0x5
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 cpuid      |Identifier for the CPU                                     |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the cpu is started successfully.               |
>> +|                  |NOT_FOUND: if cpuid is not valid.                          |
>> +|                  |DENIED: the calling agent is not allowed to stop this CPU. |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +CPU_RESET_VECTOR_SET
>> +~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x6
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++----------------------+-------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++----------------------+-------------------------------------------------------+
>> +|Name                  |Description                                            |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 cpuid          |Identifier for the CPU                                 |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 flags          |Reset vector flags:                                    |
>> +|                      |Bit[31] Resume flag.                                   |
>> +|                      |Set to 1 to update the reset vector used on resume.    |
>> +|                      |Bit[30] Boot flag.                                     |
>> +|                      |Set to 1 to update the reset vector used for boot.     |
>> +|                      |Bits[29:1] Reserved, must be zero.                     |
>> +|                      |Bit[0] Table flag.                                     |
>> +|                      |Set to 1 if vector is the vector table base address.   |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 resetVectorLow |Lower vector:                                          |
>> +|                      |If bit[0] of flags is 0, the lower 32 bits of the      |
>> +|                      |physical address where the CPU should execute from on  |
>> +|                      |reset. If bit[0] of flags is 1, the lower 32 bits of   |
>> +|                      |the vector table base address                          |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 resetVectorhigh|Upper vector:                                          |
>> +|                      |If bit[0] of flags is 0, the upper 32 bits of the      |
>> +|                      |physical address where the CPU should execute from on  |
>> +|                      |reset. If bit[0] of flags is 1, the upper 32 bits of   |
>> +|                      |the vector table base address                          |
>> ++----------------------+-------------------------------------------------------+
>> +|Return values                                                                 |
>> ++----------------------+-------------------------------------------------------+
>> +|Name                  |Description                                            |
>> ++----------------------+-------------------------------------------------------+
>> +|int32 status          |SUCCESS: if the CPU reset vector is set successfully.  |
>> +|                      |NOT_FOUND: if cpuId does not point to a valid CPU.     |
>> +|                      |INVALID_PARAMETERS: the requested vector type is not   |
>> +|                      |supported by this CPU.                                 |
>> +|                      |DENIED: the calling agent is not allowed to set the    |
>> +|                      |reset vector of this CPU                               |
>> ++----------------------+-------------------------------------------------------+
>> +
>> +CPU_SLEEP_MODE_SET
>> +~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x7
>> +protocol_id: 0x82
>> +This command is mandatory.
>> +
>> ++----------------------+-------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++----------------------+-------------------------------------------------------+
>> +|Name                  |Description                                            |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 cpuid          |Identifier for the CPU                                 |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 flags          |Sleep mode flags:                                      |
>> +|                      |Bits[31:1] Reserved, must be zero.                     |
>> +|                      |Bit[0] IRQ mux:                                        |
>> +|                      |If set to 1 the wakeup mux source is the GIC, else if 0|
>> +|                      |then the GPC                                           |
>> ++----------------------+-------------------------------------------------------+
>> +|uint32 sleepmode      |target sleep mode. When CPU runs into WFI, the GPC mode|
>> +|                      |will be triggered to be in below modes:                |
>> +|                      |RUN(0), WAIT(1), STOP(2), SUSPEND(3)                   |
>
>Split above values into multiple line and mark rest of them as reserved. This
>applies to any similar parameter. Easy to miss when reading 800 lines of text 😄

Fix in V4.

Thanks again for reviewing the large text.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
