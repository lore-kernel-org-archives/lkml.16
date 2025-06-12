Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023083.outbound.protection.outlook.com [52.101.127.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F53C47B;
	Thu, 12 Jun 2025 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733330; cv=fail; b=n3EUPlaVtn9CUIG1B3SffWhTnrdJAAiUt3IgqokeSUmqp/sP2jNK9fPCmJCtgUnd9P+ieKnjDN+8nJAaNKVFnny1j7g4EOkVg5bLffKWTP0D9H7ij03HANlNRg04Qlkxf4ScEdJa3aPOJwDuzIuIlZrSE4cwdXzHS2BkLnR3H5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733330; c=relaxed/simple;
	bh=Zzyb4dDPoS83InLQAINQ8Dy+auPT1MQlFBLRWp4vCSI=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=isDcEqLSasnBELVZQaUjaj2YyzmYB/VEnzjlwZYCykCAsJBWJVIO+SxO+5dME19f+dYRY+ZcmIBr1vtn0ni+6hU7mJSq4Ryy0JCyKOjW9NGlPyic3YXiUixvSozyrYMGzuokMBy/VByDpvHSk1V2BIU02T6Q4lw8sY8B6KxLeWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=XWxr+twh; arc=fail smtp.client-ip=52.101.127.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="XWxr+twh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9C5lrkZgBE8DeW21ybZrowJswu9gpice3gQDgfLIjMQhvdLV05uBs7LREENnsiO2VTXFqTKsmQVNJgHX47BQb22sYMGdrFNUHg2Y/QIrbD6PqpVkEfu2TPvvoBmFtLgJk1e+LOtoCRdnzDrBDpJKyT+Gw8kBHWDAwl6w91UocR6W7NsMoJdH+NKz7DAe+KuWrSXS0XsSFxdBgkibhgr3kluwzreFySv4Z8BivM4JRpHFZG6BxWuSDxvfNZMSqhqvXtDnl0G8bkApvaYxVRGuraCOvLfslBb6avGmw27XDVhQPsNpXWNO4hKv+ikGJU8UzccHVDxhQpNQz+v8s4AXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NEzg9o5ez9RNGXVP3j/Kuv7cC+UqMbc+YV6BdQN1BE=;
 b=oGlAs/NcaZ+lwlPRoFVi3scnxSBKFY/05UQLpg0zuwlSC3mSE4KiItYfcBBeESmRnGg19i/qTPV9YV+/qipyj1PlGqXx3oYzTwtVin0xwryHXEYKEtG9L4WmYwj/hzfyhmZtqEgORKqtSxw9zJXqqBTxBx6AAerNwtlKJ4Y51yh1Uk+dAlOjExbPQ0o9WUMAw+ZEKvFYkZAzKs7oFXBLvO5neV24EjeZf5TF8qgTIwujSU9ZSRi1EFdZUCzQCQ1G2T/qswLIk327q2ZHDQwPN4M81JrWB9Ja06sP1M96mxhe2qTRgt2NtPguz3F8ZGMxmavLACBp9henx0fBcl98sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NEzg9o5ez9RNGXVP3j/Kuv7cC+UqMbc+YV6BdQN1BE=;
 b=XWxr+twh+9lkB68Q19On9X4dsxefFfouXAi5LJcZ/f0EWdHB0v+qN1hMt7R+z0Mi1GSwtCxHBGMF6qP/dQtCvKBPMkTDNItkXHFKk/nmhrueWR8K2JtEQZZ5Lj/ooMpZMA9Mh80Bj/vDc9DKw4ZodVaFNdPCg6HVDEeXwWXtJ/qp0PPJ1IC7PGnMbgf2O2eSy2mQtUMG8Fw4ljxqMY5rz2X4y/3DsoxB9ZxgMkfM8g3egvWoTSsQCslwe8c5QTf73M9NtWyfOmmv0N6uO7AIWxHAMejLVMCshg7nK2Soqk8g3auvxNRCWg3kUSonPXz0xA26QbVm+4U5avI/+lUdBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PS1PPF17CC923A1.apcprd03.prod.outlook.com (2603:1096:308::2c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 13:02:03 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%3]) with mapi id 15.20.8813.020; Thu, 12 Jun 2025
 13:02:03 +0000
Message-ID: <4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
Date: Thu, 12 Jun 2025 21:02:00 +0800
User-Agent: Mozilla Thunderbird
From: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-5-jian.hu@amlogic.com>
 <1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::14)
 To KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PS1PPF17CC923A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4410df7f-7adb-4d7a-c369-08dda9b15324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTJGREdyeUVDQ2JtRjV0cW5pSEw2cUpqaVFPQkVkU1NNWFlPcGsyQ1RuYkto?=
 =?utf-8?B?Mm5JdjJ0akxGTUUzZW1rSk5SR2VpQ0dGZkNDOEZ6dUVjUnZLTGxuTitkRDZ4?=
 =?utf-8?B?d2hMMU04dlhzZ3VyWVhRVVlyTUVReDk5clpEMVRYL01OeWEyRkhSelNYbERO?=
 =?utf-8?B?SEo0WWJjT3VMMGt3a3RxejNwL2ZXTEJrSU5lZ254aE5BVWJPM0JNZXZSOFlk?=
 =?utf-8?B?Sm5QRFBGWGhzV3ZtWCtXL2F1THhScEhJR0NnV1AyMjUybEJ2Q1F3Mkg2Ukps?=
 =?utf-8?B?R0ltcUtJZnlZald1MWFwRzBWT1BFL2ZYbTB3Uk9nZU1VUk0zZjNBVFRBQWdJ?=
 =?utf-8?B?SVZNWG83YXJjYmdiTkU5T0o4L1hsUEo4Qm8rSk45RVVrOFAvd0hoNlpqTWRz?=
 =?utf-8?B?RFJKcmVQWmozQmg0R2NkbCtuMllYSjdLdndEVUZWNEpGOUNSWDJyZjVIMnNI?=
 =?utf-8?B?UHZKQktMa1F3eVBIb2NyZCtOemxHSHpUZ1Y2eEJaTXRlY1Fzek40eFg1eWdJ?=
 =?utf-8?B?TzhPMU9oQjJPdGVHWTlvd3IxaDZZSEhhWUkxQ2dQeDk3V2NacFBOUG5YNGRB?=
 =?utf-8?B?RUdrUGNUai9Tc09PNG1Md1dJQ0JMRXNlM3FYSVgwZVRRZGQ0bXh3TncrSTdw?=
 =?utf-8?B?Und6RXA4U2VmbzEvU2RObllRMngrSUgzMks5UERra2J5TmtZak52aWNKeXRV?=
 =?utf-8?B?OXlLV2dVTytGTXpWUHE0NnBuTVZVR0NPekI5VVEvTVdhTE9mUE9ZSGVBeElL?=
 =?utf-8?B?Nm9tTGJmUEtIQll4WWpaNlB5dXFZOVhJTzkxbFdZQmt6NjBDQ3lHUVJjdUF5?=
 =?utf-8?B?SU1EQmcvTDd4SHBHOVQ0blBrU3Jma0UrbVdScGVTUThhUy9EK1Jlc3VVWGhj?=
 =?utf-8?B?dlhIS1N4WUlMdWRDWE5VUmtoTDlrMXpQT3VMK3A0enlmRUVlcEVQTUVQUENn?=
 =?utf-8?B?WWtWcDJiQk1Scm1aRjMyd0dMaTNkSy9BYjV1Rm9rY2U1OHZsMWp5aHNWMnUy?=
 =?utf-8?B?Z2pHNU5PS2FMZWFSeDBUUFc2cjJDSHY3WDUwMjdtczJ0c3VibUxpTEdYZHBJ?=
 =?utf-8?B?RENPazFoRGlCTEFDQ3RhNHVyNXRJQndYbG1lZTA3bGVDeFQ5NW9hWGxlSVVj?=
 =?utf-8?B?UjhuTk9EdFkxRUY4RzJaeUdwKzg0am91cnJSVTdIZENpS0t1Sk4vWWhOdmF0?=
 =?utf-8?B?Ti9MejU5djVCU2wvTXlHUUxZMTFma3pOdEd1NWw0VkRwMTV0b2Q1YTNtNnBi?=
 =?utf-8?B?Q0JRZ0U2d2Rhc1VteUVhdndUL0FRa3paZkJBMklUMlk1bC9MaDNnNlRrd0NB?=
 =?utf-8?B?S0xQYzJwY3VDR2RxU0VkcHNzUFoyczVkWFcwaGFTd2NVbVBzUk9DSHkxT05u?=
 =?utf-8?B?SUZxN0dDTjJEK0krR3RvaVJELy9vZHIwZjlJVmNSQUlPc0VvSHZ4TnhkYlNy?=
 =?utf-8?B?b1NkN1ZrZ00rc0p3ZmlSYTVuZnl4OTd1Rm1YdnNnVkJnWkNhOVZQSmQvMDB1?=
 =?utf-8?B?akk4YkhNRzBZQXZGN1FWYnoya3Vsbm1XbGZhYlJiN05mOGpPOGVaaS9taWRL?=
 =?utf-8?B?L1d2U2xUUnJqY0s5S0JVdFZGaDR3RklrMWh0QmZidjh3UGNnTDlCL1ZyTW1P?=
 =?utf-8?B?enY0MnRLalUrSGVlSVBsSXk0U2FJL1FFK2JSd2ZYYkFKY3pMMVkvRFMxSngr?=
 =?utf-8?B?c1YrL244RElqTXhTdDFVUnpTS3EwQU04SzhmVDVoZEZhc2d0REdRSmJKOWpn?=
 =?utf-8?B?UHZtTURsRVhqMGR2ZmtJR1ZJZW1BSzNXU1dGOGxCcFZvbnJjS25yZmpPREhY?=
 =?utf-8?B?ZjFtU1RjeUc4cUt5QmVuMU9iOXFXNUUzU2pjOEtsR1FOUkN2N3BCbzBYdVYw?=
 =?utf-8?B?TUFvUW1vaXpvQVkxTnFDKy83NnV6eFZhWWlJc3lnOTEydFk5QU9JeCtod1Bm?=
 =?utf-8?Q?PDi/tuelJ98=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zlo5RjV4VlhFMFZvTU44ZVJiRmdVMjQrdDJReUZEQld2NDFpTDBUOUxHZisy?=
 =?utf-8?B?MTdvNllaa1loWDRMUjk0Rjdic3NWTVNRSE90REhqT3g4WnRFakF5aFhkMmJu?=
 =?utf-8?B?ZVlDNlI1bzJtSTJVVnFTRUkwdDJmY2R5YzFMVzBYM3RVUTh3NE9jdEVoREps?=
 =?utf-8?B?R0l0TGRlRlhuNWJ0Q3pyMUxQYVJIVDhrNmRyTDhxRXJEQk5FVVpmeG5SbERj?=
 =?utf-8?B?YTJiN2VySXRxOHNSaEl3WjI2ZXlLZFNhNEswVFFCMHB1dzFYSEc1U3AxK0Jn?=
 =?utf-8?B?SFhEOXZSTnQzUDhXUy85T0plMVNEWWViYVJxempDTXMwOWd6cVFRcG1DcmtW?=
 =?utf-8?B?QVQ4K1JTTHZqYzV1ZUpQZi9jUldoaC9uYWhNdHFkV01HaDRKSnhrTVo4Qzhu?=
 =?utf-8?B?cjY1VDZHMldOTkRzd0dQaGZiRXRWZFZFRkl6WFFocjgrNzd2R2dwc2pJeTV2?=
 =?utf-8?B?KzlwN0luNk1QYkJzSHVNbW5Sb3I2RmR5aE1xeWtoODM1TWRUZjBMbUNLSzVF?=
 =?utf-8?B?Ti9IV2UxanZDVkQ0bUFRcCtPVVVwamFqN3lXclYwaW5SRW8zUTFpb0lSRlZw?=
 =?utf-8?B?cHdEU3ZPekRHZklOYVZjQ0dNamhpb0lRNk5yMWxlMk9ETGcrYkNGU2pJYXAz?=
 =?utf-8?B?V2kwTWZGd0tkOEVBNW1NNHFibmVzRnQ0VlNJRXFoM3gyYiswSURJR0VqcTJq?=
 =?utf-8?B?RkRham9SZGFCdU5mZUVKWTdDVmhqQUQwcXhEU3JRZlpUZGR6Yy9yM291ckpw?=
 =?utf-8?B?bEFHR2hFZWJHVlMvaHFVdTR5ZkcvUy92c21sRkZRMDFpbHB6M0dQcExiT0sy?=
 =?utf-8?B?ejRMYTgwUDRwNVE3NCszRCtaMTlwSWNkNW82b2hHQ1dGaVpvWTltV2cxdDFO?=
 =?utf-8?B?SGh4bWRVQkZMdFZwMEVPM3J1a2ZjT2J6bWFIR1k2OGorM3ZQMEdtT0pTSkpq?=
 =?utf-8?B?cUVJdVNSbW0rbTlNb2xoQm9LeE9USXhnTUpmbkxwNWpmcnFnbzI4cjhGbUVS?=
 =?utf-8?B?cElQVWNscmlyUVBWU2d0Qnl0UktWMmorS3pUZ3VKM29nYnJGMHd0T3d4eDg3?=
 =?utf-8?B?TXdoTmZSb0ovZklRTkdUYXE2d1FzZ0ZGVHF5a3cvcWlCbk5TZ2lBRWJ1WEdk?=
 =?utf-8?B?cCtJZU1XSFBwYTZNZGJLNlYrcE9nNThmSFRPRzIrMWphdUlDeE9yaDBDRTFK?=
 =?utf-8?B?VUhJakFFdVYyQ2E5UTJZNHV4ZmhIYnZoWnpha2JMZHBUVXpZRHpqVllYWFpD?=
 =?utf-8?B?UWdvdTB6Rk5KbkNDUXB1eVFOUGlDOXNoSXZKdmtCMk5wTHE5MlluUVlCa09I?=
 =?utf-8?B?L3FrczcxZHpWTWpwVDI3NGtTaWVPWFFxRUNVbkZzSnBSTzNyUlIwYjZkSmhp?=
 =?utf-8?B?djFLVWgzT1FsOXc5NXY5MDExU2RUcE54M0E0Y25OVjJSS2hVTnFkVkcwOFhU?=
 =?utf-8?B?M1BrM0h4dlcrdjdRaUJCSlJlMlFqU084RG1DVFlBcnJSdzlyNDQ4dHRLMi81?=
 =?utf-8?B?R1VLR2sySC92WnVnaHJaZVBlWnUrSGgwSVdtUWYvTVFOTUxIMU5qVEJDYnRw?=
 =?utf-8?B?Tk5Sb3lMYTJ2WWJuVGxDR295MEJ6R01PTXJqcmN4UCs3dFJOWUNPY0c0NDVH?=
 =?utf-8?B?Zks4ODNhOW5pMk1YMGlFYVpERHlnV3I2UFlkSzJrY2tmWHV6MmNYZmdrM2or?=
 =?utf-8?B?SGE3azhwcWtROHZLdVAyWGFzaHdyblFGUGllYmFiclY5RHZYS0hXTUJmMHUz?=
 =?utf-8?B?RGRZK1diMEtSTXN0U054UmN5b2I4UFRCK2VXR04yYWgrNlhjQ3B0K0dtSmps?=
 =?utf-8?B?RFJjMVg2ajJpM2d5WHIzYnExRUpRNmV3L1JUWW5ESGtJaTVDT3JYMGUxL25R?=
 =?utf-8?B?OE9SY1BaWHZ2YTZwd3NkRTg0SUFETXozU2wvZG1CUGZJWnZ6Um5pMS9YQzlk?=
 =?utf-8?B?S0FuY0pPVUJia3dtRGZYQWVBVUhBbUFHWG9VaFFQZHVRMTVYSFdZRXZvQ3Ro?=
 =?utf-8?B?VXA3MDNpMEloekszTlBhMTNPV05JbDZCUm9QRlRlSGwzUUNqSWZac3FTZ0gr?=
 =?utf-8?B?c24wTlhCRFNhZDZvQTgvOFVNWFpRVzBBbUF5a1Y0T25QS2FYM1F3RWpIa0FW?=
 =?utf-8?Q?kFz7AUFmKchflG46kBCXbREM8?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4410df7f-7adb-4d7a-c369-08dda9b15324
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:02:02.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBsbtFYPetZrrjGJu9Ikta3JOd/PS5sl2BpWVDs5AAxTCZbVH9I/+ffW5beTF8J0ef6jMtOqZiokDKj7ZQcnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF17CC923A1

Hi, Jerome

Thanks for your review. and sorry for late reply.


On 2025/5/14 15:52, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 09 May 2025 at 07:48, Jian Hu<jian.hu@amlogic.com> wrote:
>
>> Add PLL clock controller driver for the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu<jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig  |   14 +
>>   drivers/clk/meson/Makefile |    1 +
>>   drivers/clk/meson/t7-pll.c | 1193 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1208 insertions(+)
>>   create mode 100644 drivers/clk/meson/t7-pll.c
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index be2e3a5f8336..8bb4f26a86ed 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -202,4 +202,18 @@ config COMMON_CLK_S4_PERIPHERALS
>>        help
>>          Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
>>          devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
>> +
>> +config COMMON_CLK_T7_PLL
>> +     tristate "Amlogic T7 SoC PLL controller support"
>> +     depends on ARM64
>> +     default y
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_PLL
>> +     imply COMMON_CLK_SCMI
>> +     help
>> +       Support for the PLL clock controller on Amlogic A311D2 based
>> +       device, AKA T7. PLLs are required by most peripheral to operate
>> +       Say Y if you are a T7 based device.
>> +
>>   endmenu
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index bc56a47931c1..646257694c34 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -27,3 +27,4 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>>   obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
>>   obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
>> +obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>> new file mode 100644
>> index 000000000000..d2ec45d5e783
>> --- /dev/null
>> +++ b/drivers/clk/meson/t7-pll.c
>> @@ -0,0 +1,1193 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu<jian.hu@amlogic.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-regmap.h"
>> +#include "clk-pll.h"
>> +#include "clk-mpll.h"
>> +#include "meson-clkc-utils.h"
>> +#include "meson-eeclk.h"
>> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>> +
>> +#define ANACTRL_GP0PLL_CTRL0         0x00
>> +#define ANACTRL_GP0PLL_CTRL1         0x04
>> +#define ANACTRL_GP0PLL_CTRL2         0x08
>> +#define ANACTRL_GP0PLL_CTRL3         0x0c
>> +#define ANACTRL_GP0PLL_CTRL4         0x10
>> +#define ANACTRL_GP0PLL_CTRL5         0x14
>> +#define ANACTRL_GP0PLL_CTRL6         0x18
>> +#define ANACTRL_GP0PLL_STS           0x1c
>> +
>> +#define ANACTRL_GP1PLL_CTRL0         0x00
>> +#define ANACTRL_GP1PLL_CTRL1         0x04
>> +#define ANACTRL_GP1PLL_CTRL2         0x08
>> +#define ANACTRL_GP1PLL_CTRL3         0x0c
>> +#define ANACTRL_GP1PLL_STS           0x1c
>> +
>> +#define ANACTRL_HIFIPLL_CTRL0                0x00
>> +#define ANACTRL_HIFIPLL_CTRL1                0x04
>> +#define ANACTRL_HIFIPLL_CTRL2                0x08
>> +#define ANACTRL_HIFIPLL_CTRL3                0x0c
>> +#define ANACTRL_HIFIPLL_CTRL4                0x10
>> +#define ANACTRL_HIFIPLL_CTRL5                0x14
>> +#define ANACTRL_HIFIPLL_CTRL6                0x18
>> +#define ANACTRL_HIFIPLL_STS          0x1c
>> +
>> +#define ANACTRL_PCIEPLL_CTRL0                0x00
>> +#define ANACTRL_PCIEPLL_CTRL1                0x04
>> +#define ANACTRL_PCIEPLL_CTRL2                0x08
>> +#define ANACTRL_PCIEPLL_CTRL3                0x0c
>> +#define ANACTRL_PCIEPLL_CTRL4                0x10
>> +#define ANACTRL_PCIEPLL_CTRL5                0x14
>> +#define ANACTRL_PCIEPLL_STS          0x18
>> +
>> +#define ANACTRL_MPLL_CTRL0           0x00
>> +#define ANACTRL_MPLL_CTRL1           0x04
>> +#define ANACTRL_MPLL_CTRL2           0x08
>> +#define ANACTRL_MPLL_CTRL3           0x0c
>> +#define ANACTRL_MPLL_CTRL4           0x10
>> +#define ANACTRL_MPLL_CTRL5           0x14
>> +#define ANACTRL_MPLL_CTRL6           0x18
>> +#define ANACTRL_MPLL_CTRL7           0x1c
>> +#define ANACTRL_MPLL_CTRL8           0x20
>> +#define ANACTRL_MPLL_STS             0x24
>> +
>> +#define ANACTRL_HDMIPLL_CTRL0                0x00
>> +#define ANACTRL_HDMIPLL_CTRL1                0x04
>> +#define ANACTRL_HDMIPLL_CTRL2                0x08
>> +#define ANACTRL_HDMIPLL_CTRL3                0x0c
>> +#define ANACTRL_HDMIPLL_CTRL4                0x10
>> +#define ANACTRL_HDMIPLL_CTRL5                0x14
>> +#define ANACTRL_HDMIPLL_CTRL6                0x18
>> +#define ANACTRL_HDMIPLL_STS          0x1c
>> +
>> +#define ANACTRL_MCLK_PLL_CNTL0               0x00
>> +#define ANACTRL_MCLK_PLL_CNTL1               0x04
>> +#define ANACTRL_MCLK_PLL_CNTL2               0x08
>> +#define ANACTRL_MCLK_PLL_CNTL3               0x0c
>> +#define ANACTRL_MCLK_PLL_CNTL4               0x10
>> +#define ANACTRL_MCLK_PLL_STS         0x14
>> +
>> +static const struct pll_mult_range t7_media_pll_mult_range = {
>> +     .min = 125,
>> +     .max = 250,
>> +};
>> +
>> +static const struct reg_sequence t7_gp0_init_regs[] = {
>> +     { .reg = ANACTRL_GP0PLL_CTRL1,  .def = 0x00000000 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL2,  .def = 0x00000000 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL3,  .def = 0x48681c00 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL4,  .def = 0x88770290 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL5,  .def = 0x3927200a },
>> +     { .reg = ANACTRL_GP0PLL_CTRL6,  .def = 0x56540000 },
>> +};
>> +
>> +static struct clk_regmap t7_gp0_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 10,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_GP0PLL_STS,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &t7_media_pll_mult_range,
>> +             .init_regs = t7_gp0_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_gp0_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_gp0_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_gp0_pll = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_GP0PLL_CTRL0,
>> +             .shift = 16,
>> +             .width = 3,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_gp0_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_gp0_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +/*
>> + * The gp1 pll IP is different with gp0 pll, the PLL DCO range is
>> + * 1.6GHZ - 3.2GHZ, and the reg_sequence is short
>> + */
>> +static const struct pll_mult_range t7_gp1_pll_mult_range = {
>> +     .min = 67,
>> +     .max = 133,
>> +};
>> +
>> +static const struct reg_sequence t7_gp1_init_regs[] = {
>> +     { .reg = ANACTRL_GP1PLL_CTRL1,  .def = 0x1420500f },
>> +     { .reg = ANACTRL_GP1PLL_CTRL2,  .def = 0x00023001 },
>> +     { .reg = ANACTRL_GP1PLL_CTRL3,  .def = 0x00000000 },
>> +};
>> +
>> +static struct clk_regmap t7_gp1_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_GP1PLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_GP1PLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_GP1PLL_CTRL0,
>> +                     .shift   = 16,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_GP1PLL_STS,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_GP1PLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &t7_gp1_pll_mult_range,
>> +             .init_regs = t7_gp1_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_gp1_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_gp1_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_gp1_pll = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_GP1PLL_CTRL0,
>> +             .shift = 12,
>> +             .width = 3,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_gp1_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_gp1_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence t7_hifi_init_regs[] = {
>> +     { .reg = ANACTRL_HIFIPLL_CTRL1, .def = 0x00000000 },
>> +     { .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00000000 },
>> +     { .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x6a285c00 },
>> +     { .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x65771290 },
>> +     { .reg = ANACTRL_HIFIPLL_CTRL5, .def = 0x3927200a },
>> +     { .reg = ANACTRL_HIFIPLL_CTRL6, .def = 0x56540000 }
>> +};
>> +
>> +static struct clk_regmap t7_hifi_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> +                     .shift   = 10,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_HIFIPLL_STS,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &t7_media_pll_mult_range,
>> +             .init_regs = t7_hifi_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_hifi_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_hifi_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_hifi_pll = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_HIFIPLL_CTRL0,
>> +             .shift = 16,
>> +             .width = 2,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_hifi_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_hifi_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +/*
>> + * The T7 PCIE PLL is fined tuned to deliver a very precise
>> + * 100MHz reference clock for the PCIe Analog PHY, and thus requires
>> + * a strict register sequence to enable the PLL.
>> + */
> It looks to me like something we are dragging from soc to soc that could
> be folded in the regular PLL with some effort ... just saying.
>
>> +static const struct reg_sequence t7_pcie_pll_init_regs[] = {
>> +     { .reg = ANACTRL_PCIEPLL_CTRL0, .def = 0x200c04c8 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL0, .def = 0x300c04c8 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL1, .def = 0x30000000 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL2, .def = 0x00001100 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL3, .def = 0x10058e00 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL4, .def = 0x000100c0 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL5, .def = 0x68000048 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL5, .def = 0x68000068, .delay_us = 20 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL4, .def = 0x008100c0, .delay_us = 20 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL0, .def = 0x340c04c8 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL0, .def = 0x140c04c8, .delay_us = 20 },
>> +     { .reg = ANACTRL_PCIEPLL_CTRL2, .def = 0x00001000 }
>> +};
>> +
>> +static struct clk_regmap t7_pcie_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_PCIEPLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_PCIEPLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_PCIEPLL_CTRL0,
>> +                     .shift   = 10,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_PCIEPLL_CTRL0,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_PCIEPLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .init_regs = t7_pcie_pll_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_pcie_pll_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_pcie_pll_dco",
>> +             .ops = &meson_clk_pcie_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor t7_pcie_pll_dco_div2 = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_pcie_pll_dco_div2",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_pcie_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_pcie_pll_od = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_PCIEPLL_CTRL0,
>> +             .shift = 16,
>> +             .width = 5,
>> +             .flags = CLK_DIVIDER_ONE_BASED |
>> +                      CLK_DIVIDER_ALLOW_ZERO,
> What's the behaviour of the divider on zero then ?


If there is no CLK_DIVDER_ALLOW_ZERO, there is a warning when 
registering t7_pcie_pll_od.

like this:

   ------------[ cut here ]------------
   WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:140 
divider_recalc_rate+0xfc/0x100
   pcie_pll_od: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
   Modules linked in:
  CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
5.4.283-09976-ga803e94eed88-dirty #91
   Hardware name: tm2_t962e2_ab311 (DT)
  Call trace:
   [ffffffc020003750+  64][<ffffffc0100e3e3c>] dump_backtrace+0x0/0x1e4
   [ffffffc020003790+  32][<ffffffc0100e4044>] show_stack+0x24/0x34
   [ffffffc0200037b0+  96][<ffffffc01130a2e8>] dump_stack+0xbc/0x108
  [ffffffc020003810+ 144][<ffffffc01010c484>] __warn+0xf4/0x1b8
   [ffffffc0200038a0+  64][<ffffffc01010c5f4>] warn_slowpath_fmt+0xac/0xc8
  [ffffffc0200038e0+  64][<ffffffc01061d364>] divider_recalc_rate+0xfc/0x100
  [ffffffc020003920+  80][<ffffffc010624e84>] 
clk_regmap_div_recalc_rate+0x74/0x88
   [ffffffc020003970+  96][<ffffffc010616a54>] __clk_register+0x62c/0xb78

so add it to avoid the warning.

>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_pcie_pll_od",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_pcie_pll_dco_div2.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor t7_pcie_pll = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_pcie_pll",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_pcie_pll_od.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor t7_mpll_prediv = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll_prediv",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence t7_mpll0_init_regs[] = {
>> +     { .reg = ANACTRL_MPLL_CTRL2, .def = 0x40000033 }
>> +};
>> +
>> +static struct clk_regmap t7_mpll0_div = {
>> +     .data = &(struct meson_clk_mpll_data){
>> +             .sdm = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL1,
>> +                     .shift   = 0,
>> +                     .width   = 14,
>> +             },
>> +             .sdm_en = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL1,
>> +                     .shift   = 30,
>> +                     .width   = 1,
>> +             },
>> +             .n2 = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL1,
>> +                     .shift   = 20,
>> +                     .width   = 9,
>> +             },
>> +             .ssen = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL1,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .init_regs = t7_mpll0_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_mpll0_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll0_div",
>> +             .ops = &meson_clk_mpll_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mpll_prediv.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mpll0 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MPLL_CTRL1,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll0",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) { &t7_mpll0_div.hw },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence t7_mpll1_init_regs[] = {
>> +     { .reg = ANACTRL_MPLL_CTRL4,    .def = 0x40000033 }
>> +};
>> +
>> +static struct clk_regmap t7_mpll1_div = {
>> +     .data = &(struct meson_clk_mpll_data){
>> +             .sdm = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL3,
>> +                     .shift   = 0,
>> +                     .width   = 14,
>> +             },
>> +             .sdm_en = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL3,
>> +                     .shift   = 30,
>> +                     .width   = 1,
>> +             },
>> +             .n2 = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL3,
>> +                     .shift   = 20,
>> +                     .width   = 9,
>> +             },
>> +             .ssen = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL3,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .init_regs = t7_mpll1_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_mpll1_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll1_div",
>> +             .ops = &meson_clk_mpll_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mpll_prediv.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mpll1 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MPLL_CTRL3,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll1",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) { &t7_mpll1_div.hw },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence t7_mpll2_init_regs[] = {
>> +     { .reg = ANACTRL_MPLL_CTRL6, .def = 0x40000033 }
>> +};
>> +
>> +static struct clk_regmap t7_mpll2_div = {
>> +     .data = &(struct meson_clk_mpll_data){
>> +             .sdm = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL5,
>> +                     .shift   = 0,
>> +                     .width   = 14,
>> +             },
>> +             .sdm_en = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL5,
>> +                     .shift   = 30,
>> +                     .width   = 1,
>> +             },
>> +             .n2 = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL5,
>> +                     .shift   = 20,
>> +                     .width   = 9,
>> +             },
>> +             .ssen = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL5,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .init_regs = t7_mpll2_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_mpll2_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll2_div",
>> +             .ops = &meson_clk_mpll_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mpll_prediv.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mpll2 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MPLL_CTRL5,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll2",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) { &t7_mpll2_div.hw },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence t7_mpll3_init_regs[] = {
>> +     { .reg = ANACTRL_MPLL_CTRL8, .def = 0x40000033 }
>> +};
>> +
>> +static struct clk_regmap t7_mpll3_div = {
>> +     .data = &(struct meson_clk_mpll_data){
>> +             .sdm = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL7,
>> +                     .shift   = 0,
>> +                     .width   = 14,
>> +             },
>> +             .sdm_en = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL7,
>> +                     .shift   = 30,
>> +                     .width   = 1,
>> +             },
>> +             .n2 = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL7,
>> +                     .shift   = 20,
>> +                     .width   = 9,
>> +             },
>> +             .ssen = {
>> +                     .reg_off = ANACTRL_MPLL_CTRL7,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .init_regs = t7_mpll3_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_mpll3_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll3_div",
>> +             .ops = &meson_clk_mpll_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mpll_prediv.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mpll3 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MPLL_CTRL7,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mpll3",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) { &t7_mpll3_div.hw },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence t7_hdmi_init_regs[] = {
>> +     { .reg = ANACTRL_HDMIPLL_CTRL1, .def = 0x00000000 },
>> +     { .reg = ANACTRL_HDMIPLL_CTRL2, .def = 0x00000000 },
>> +     { .reg = ANACTRL_HDMIPLL_CTRL3, .def = 0x6a28dc00 },
>> +     { .reg = ANACTRL_HDMIPLL_CTRL4, .def = 0x65771290 },
>> +     { .reg = ANACTRL_HDMIPLL_CTRL5, .def = 0x39272000 },
>> +     { .reg = ANACTRL_HDMIPLL_CTRL6, .def = 0x56540000 }
>> +};
>> +
>> +static struct clk_regmap t7_hdmi_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_HDMIPLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_HDMIPLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 9,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_HDMIPLL_CTRL0,
>> +                     .shift   = 10,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_HDMIPLL_CTRL0,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_HDMIPLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &t7_media_pll_mult_range,
>> +             .init_regs = t7_hdmi_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_hdmi_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_hdmi_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .fw_name = "in0", }
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_hdmi_pll_od = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_HDMIPLL_CTRL0,
>> +             .shift = 16,
>> +             .width = 4,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_hdmi_pll_od",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_hdmi_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_hdmi_pll = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_HDMIPLL_CTRL0,
>> +             .shift = 20,
>> +             .width = 2,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_hdmi_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_hdmi_pll_od.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct pll_mult_range t7_mclk_pll_mult_range = {
>> +     .min = 67,
>> +     .max = 133,
>> +};
>> +
>> +static const struct reg_sequence t7_mclk_init_regs[] = {
>> +     { .reg = ANACTRL_MCLK_PLL_CNTL1, .def = 0x1470500f },
>> +     { .reg = ANACTRL_MCLK_PLL_CNTL2, .def = 0x00023041 },
>> +     { .reg = ANACTRL_MCLK_PLL_CNTL3, .def = 0x18180000 },
>> +     { .reg = ANACTRL_MCLK_PLL_CNTL4, .def = 0x00180303 },
>> +     { .reg = ANACTRL_MCLK_PLL_CNTL2, .def = 0x00023001, .delay_us = 20 }
> What is this bit that you need to clear after the init sequence ?
> Any chance this maps to something the driver already has ? Doing init
> really belong on the init sequence - done at init only ?


the bit 6 in CNTL2 is used to control pll lock detect module. it avoids 
lock bit false triggering.

It is lock detect bit.

the PLL lock sequence is:

1. enable bit, pll reset bit, lock detect bit is 0 as default

2. set pll reset bit = 1

3. set pll enable bit =1

4. set lock detect bit = 1

5. set pll reset bit = 0

6. set lock detect bit = 0

7.check the pll is locked by lock bit.

I will remove the last one, and left the second init reg(0x00023001).


And change the callback meson_clk_pll_enable in clk-pll.c. So it does A1.

It works well for HIFI PLL on A1 board with Linux-6.14.0 .

static int meson_clk_pll_enable(struct clk_hw *hw)
{
         struct clk_regmap *clk = to_clk_regmap(hw);
         struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);

         /* do nothing if the PLL is already enabled */
         if (clk_hw_is_enabled(hw))
                 return 0;

         /* Make sure the pll is in reset */
         if (MESON_PARM_APPLICABLE(&pll->rst))
                 meson_parm_write(clk->map, &pll->rst, 1);

         /* Enable the pll */
         meson_parm_write(clk->map, &pll->en, 1);

         if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
                 meson_parm_write(clk->map, &pll->l_detect, 1);

         /* Take the pll out reset */
         if (MESON_PARM_APPLICABLE(&pll->rst))
                 meson_parm_write(clk->map, &pll->rst, 0);

         /*
          * Compared with the previous SoCs, self-adaption current module
          * is newly added for A1, keep the new power-on sequence to 
enable the
          * PLL. The sequence is:
          * 1. enable the pll, delay for 10us
          * 2. enable the pll self-adaption current module, delay for 40us
          * 3. release the lock detect bit
          */
         if (MESON_PARM_APPLICABLE(&pll->current_en)) {
                 udelay(10);
                 meson_parm_write(clk->map, &pll->current_en, 1);
                 udelay(40);
         }

         if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
                 meson_parm_write(clk->map, &pll->l_detect, 0);

         if (meson_clk_pll_wait_lock(hw))
                 return -EIO;

         return 0;
}


>> +};
>> +
>> +static struct clk_regmap t7_mclk_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_MCLK_PLL_CNTL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_MCLK_PLL_CNTL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_MCLK_PLL_CNTL0,
>> +                     .shift   = 16,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_MCLK_PLL_CNTL0,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_MCLK_PLL_CNTL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &t7_mclk_pll_mult_range,
>> +             .init_regs = t7_mclk_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_mclk_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +/* max div is 16 */
>> +static const struct clk_div_table t7_mclk_div[] = {
>> +     { .val = 0, .div = 1 },
>> +     { .val = 1, .div = 2 },
>> +     { .val = 2, .div = 4 },
>> +     { .val = 3, .div = 8 },
>> +     { .val = 4, .div = 16 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap t7_mclk_pre_od = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL0,
>> +             .shift = 12,
>> +             .width = 3,
>> +             .table = t7_mclk_div,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_pre_od",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mclk_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_pll = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .shift = 16,
>> +             .width = 5,
>> +             .flags = CLK_DIVIDER_ONE_BASED,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mclk_pre_od.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_0_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .mask = 0x3,
>> +             .shift = 4,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_0_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .hw = &t7_mclk_pll.hw },
>> +                     { .fw_name = "in1", },
>> +                     { .fw_name = "in2", },
>> +             },
>> +             .num_parents = 3,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor t7_mclk_0_div2 = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_0_div2",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_hws = (const struct clk_hw *[]) { &t7_mclk_0_sel.hw },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_0_pre = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .bit_idx = 2,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_mclk_0_pre",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mclk_0_div2.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_0 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .bit_idx = 0,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_mclk_0",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mclk_0_pre.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_1_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .mask = 0x3,
>> +             .shift = 12,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_1_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .hw = &t7_mclk_pll.hw },
>> +                     { .fw_name = "in1", },
>> +                     { .fw_name = "in2", },
>> +             },
>> +             .num_parents = 3,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor t7_mclk_1_div2 = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_mclk_1_div2",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_hws = (const struct clk_hw *[]) { &t7_mclk_1_sel.hw },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_1_pre = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .bit_idx = 10,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_mclk_1_pre",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mclk_1_div2.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_mclk_1 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = ANACTRL_MCLK_PLL_CNTL4,
>> +             .bit_idx = 8,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "t7_mclk_1",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_mclk_1_pre.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_hw *t7_gp0_hw_clks[] = {
>> +     [CLKID_GP0_PLL_DCO]             = &t7_gp0_pll_dco.hw,
>> +     [CLKID_GP0_PLL]                 = &t7_gp0_pll.hw,
>> +};
>> +
>> +static struct clk_hw *t7_gp1_hw_clks[] = {
>> +     [CLKID_GP1_PLL_DCO]             = &t7_gp1_pll_dco.hw,
>> +     [CLKID_GP1_PLL]                 = &t7_gp1_pll.hw,
>> +};
>> +
>> +static struct clk_hw *t7_hifi_hw_clks[] = {
>> +     [CLKID_HIFI_PLL_DCO]            = &t7_hifi_pll_dco.hw,
>> +     [CLKID_HIFI_PLL]                = &t7_hifi_pll.hw,
>> +};
>> +
>> +static struct clk_hw *t7_pcie_hw_clks[] = {
>> +     [CLKID_PCIE_PLL_DCO]            = &t7_pcie_pll_dco.hw,
>> +     [CLKID_PCIE_PLL_DCO_DIV2]       = &t7_pcie_pll_dco_div2.hw,
>> +     [CLKID_PCIE_PLL_OD]             = &t7_pcie_pll_od.hw,
>> +     [CLKID_PCIE_PLL]                = &t7_pcie_pll.hw,
>> +};
>> +
>> +static struct clk_hw *t7_mpll_hw_clks[] = {
>> +     [CLKID_MPLL_PREDIV]             = &t7_mpll_prediv.hw,
>> +     [CLKID_MPLL0_DIV]               = &t7_mpll0_div.hw,
>> +     [CLKID_MPLL0]                   = &t7_mpll0.hw,
>> +     [CLKID_MPLL1_DIV]               = &t7_mpll1_div.hw,
>> +     [CLKID_MPLL1]                   = &t7_mpll1.hw,
>> +     [CLKID_MPLL2_DIV]               = &t7_mpll2_div.hw,
>> +     [CLKID_MPLL2]                   = &t7_mpll2.hw,
>> +     [CLKID_MPLL3_DIV]               = &t7_mpll3_div.hw,
>> +     [CLKID_MPLL3]                   = &t7_mpll3.hw,
>> +};
>> +
>> +static struct clk_hw *t7_hdmi_hw_clks[] = {
>> +     [CLKID_HDMI_PLL_DCO]            = &t7_hdmi_pll_dco.hw,
>> +     [CLKID_HDMI_PLL_OD]             = &t7_hdmi_pll_od.hw,
>> +     [CLKID_HDMI_PLL]                = &t7_hdmi_pll.hw,
>> +};
>> +
>> +static struct clk_hw *t7_mclk_hw_clks[] = {
>> +     [CLKID_MCLK_PLL_DCO]            = &t7_mclk_pll_dco.hw,
>> +     [CLKID_MCLK_PRE]                = &t7_mclk_pre_od.hw,
>> +     [CLKID_MCLK_PLL]                = &t7_mclk_pll.hw,
>> +     [CLKID_MCLK_0_SEL]              = &t7_mclk_0_sel.hw,
>> +     [CLKID_MCLK_0_DIV2]             = &t7_mclk_0_div2.hw,
>> +     [CLKID_MCLK_0_PRE]              = &t7_mclk_0_pre.hw,
>> +     [CLKID_MCLK_0]                  = &t7_mclk_0.hw,
>> +     [CLKID_MCLK_1_SEL]              = &t7_mclk_1_sel.hw,
>> +     [CLKID_MCLK_1_DIV2]             = &t7_mclk_1_div2.hw,
>> +     [CLKID_MCLK_1_PRE]              = &t7_mclk_1_pre.hw,
>> +     [CLKID_MCLK_1]                  = &t7_mclk_1.hw,
>> +};
>> +
>> +static struct clk_regmap *const t7_gp0_regmaps[] = {
>> +     &t7_gp0_pll_dco,
>> +     &t7_gp0_pll,
>> +};
>> +
>> +static struct clk_regmap *const t7_gp1_regmaps[] = {
>> +     &t7_gp1_pll_dco,
>> +     &t7_gp1_pll,
>> +};
>> +
>> +static struct clk_regmap *const t7_hifi_regmaps[] = {
>> +     &t7_hifi_pll_dco,
>> +     &t7_hifi_pll,
>> +};
>> +
>> +static struct clk_regmap *const t7_pcie_regmaps[] = {
>> +     &t7_pcie_pll_dco,
>> +     &t7_pcie_pll_od,
>> +};
>> +
>> +static struct clk_regmap *const t7_mpll_regmaps[] = {
>> +     &t7_mpll0_div,
>> +     &t7_mpll0,
>> +     &t7_mpll1_div,
>> +     &t7_mpll1,
>> +     &t7_mpll2_div,
>> +     &t7_mpll2,
>> +     &t7_mpll3_div,
>> +     &t7_mpll3,
>> +};
>> +
>> +static struct clk_regmap *const t7_hdmi_regmaps[] = {
>> +     &t7_hdmi_pll_dco,
>> +     &t7_hdmi_pll_od,
>> +     &t7_hdmi_pll,
>> +};
>> +
>> +static struct clk_regmap *const t7_mclk_regmaps[] = {
>> +     &t7_mclk_pll_dco,
>> +     &t7_mclk_pre_od,
>> +     &t7_mclk_pll,
>> +     &t7_mclk_0_sel,
>> +     &t7_mclk_0_pre,
>> +     &t7_mclk_0,
>> +     &t7_mclk_1_sel,
>> +     &t7_mclk_1_pre,
>> +     &t7_mclk_1,
>> +};
>> +
>> +static const struct regmap_config t7_clkc_regmap_config = {
>> +     .reg_bits       = 32,
>> +     .val_bits       = 32,
>> +     .reg_stride     = 4,
>> +};
>> +
>> +static int amlogic_t7_pll_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     const struct meson_eeclkc_data *data;
>> +     void __iomem *base;
>> +     struct regmap *map;
>> +     int i, ret;
>> +
>> +     data = of_device_get_match_data(&pdev->dev);
>> +     if (!data)
>> +             return -EINVAL;
>> +
>> +     base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(base))
>> +             return PTR_ERR(base);
>> +
>> +     map = devm_regmap_init_mmio(dev, base, &t7_clkc_regmap_config);
>> +     if (IS_ERR(map))
>> +             return PTR_ERR(map);
>> +
>> +     /* Populate regmap for the regmap backed clocks */
>> +     for (i = 0; i < data->regmap_clk_num; i++)
>> +             data->regmap_clks[i]->map = map;
>> +
>> +     if (data->init_count)
>> +             regmap_multi_reg_write(map, data->init_regs,
>> +                                    data->init_count);
>> +
>> +     /* Register clocks */
>> +     for (i = 0; i < data->hw_clks.num; i++) {
>> +             ret = devm_clk_hw_register(dev, data->hw_clks.hws[i]);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
>> +}
>> +
>> +static const struct meson_eeclkc_data t7_gp0_data = {
>> +     .regmap_clks = t7_gp0_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_gp0_regmaps),
>> +     .hw_clks = {
>> +             .hws = t7_gp0_hw_clks,
>> +             .num = ARRAY_SIZE(t7_gp0_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct meson_eeclkc_data t7_gp1_data = {
>> +     .regmap_clks = t7_gp1_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_gp1_regmaps),
>> +     .hw_clks = {
>> +             .hws = t7_gp1_hw_clks,
>> +             .num = ARRAY_SIZE(t7_gp1_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct meson_eeclkc_data t7_hifi_data = {
>> +     .regmap_clks = t7_hifi_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_hifi_regmaps),
>> +     .hw_clks = {
>> +             .hws = t7_hifi_hw_clks,
>> +             .num = ARRAY_SIZE(t7_hifi_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct meson_eeclkc_data t7_pcie_data = {
>> +     .regmap_clks = t7_pcie_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_pcie_regmaps),
>> +     .hw_clks = {
>> +             .hws = t7_pcie_hw_clks,
>> +             .num = ARRAY_SIZE(t7_pcie_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct reg_sequence mpll_init_regs[] = {
>> +     { .reg = ANACTRL_MPLL_CTRL0, .def = 0x00000543 }
>> +};
>> +
>> +static const struct meson_eeclkc_data t7_mpll_data = {
>> +     .regmap_clks = t7_mpll_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_mpll_regmaps),
>> +     .init_regs = mpll_init_regs,
>> +     .init_count = ARRAY_SIZE(mpll_init_regs),
>> +     .hw_clks = {
>> +             .hws = t7_mpll_hw_clks,
>> +             .num = ARRAY_SIZE(t7_mpll_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct meson_eeclkc_data t7_hdmi_data = {
>> +     .regmap_clks = t7_hdmi_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_hdmi_regmaps),
>> +     .hw_clks = {
>> +             .hws = t7_hdmi_hw_clks,
>> +             .num = ARRAY_SIZE(t7_hdmi_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct meson_eeclkc_data t7_mclk_data = {
>> +     .regmap_clks = t7_mclk_regmaps,
>> +     .regmap_clk_num = ARRAY_SIZE(t7_mclk_regmaps),
>> +     .hw_clks = {
>> +             .hws = t7_mclk_hw_clks,
>> +             .num = ARRAY_SIZE(t7_mclk_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct of_device_id t7_pll_clkc_match_table[] = {
>> +     {
>> +             .compatible = "amlogic,t7-pll-gp0",
>> +             .data = &t7_gp0_data,
>> +     },
>> +     {
>          }, { please


ok, add compatible and data in one line is better.


+       { .compatible = "amlogic,t7-pll-gp0",   .data = &t7_gp0_data, },
+       { .compatible = "amlogic,t7-pll-gp1",   .data = &t7_gp1_data, },
+       { .compatible = "amlogic,t7-pll-hifi",  .data = &t7_hifi_data, },
+       { .compatible = "amlogic,t7-pll-pcie",  .data = &t7_pcie_data, },
+       { .compatible = "amlogic,t7-mpll",      .data = &t7_mpll_data, },
+       { .compatible = "amlogic,t7-pll-hdmi",  .data = &t7_hdmi_data, },
+       { .compatible = "amlogic,t7-pll-mclk",  .data = &t7_mclk_data, },

>> +             .compatible = "amlogic,t7-pll-gp1",
>> +             .data = &t7_gp1_data,
>> +     },
>> +     {
>> +             .compatible = "amlogic,t7-pll-hifi",
>> +             .data = &t7_hifi_data,
>> +     },
>> +     {
>> +             .compatible = "amlogic,t7-pll-pcie",
>> +             .data = &t7_pcie_data,
>> +     },
>> +     {
>> +             .compatible = "amlogic,t7-mpll",
>> +             .data = &t7_mpll_data,
>> +     },
>> +     {
>> +             .compatible = "amlogic,t7-pll-hdmi",
>> +             .data = &t7_hdmi_data,
>> +     },
>> +     {
>> +             .compatible = "amlogic,t7-pll-mclk",
>> +             .data = &t7_mclk_data,
>> +     },
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);
>> +
>> +static struct platform_driver t7_pll_clkc_driver = {
>> +     .probe = amlogic_t7_pll_probe,
>> +     .driver = {
>> +             .name = "t7-pll-clkc",
>> +             .of_match_table = t7_pll_clkc_match_table,
>> +     },
>> +};
>> +
>> +MODULE_DESCRIPTION("Amlogic T7 PLL Clock Controller driver");
>> +module_platform_driver(t7_pll_clkc_driver);
>> +MODULE_AUTHOR("Jian Hu<jian.hu@amlogic.com>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("CLK_MESON");
> --
> Jerome
