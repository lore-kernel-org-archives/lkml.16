Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C61DED7D;
	Fri,  7 Feb 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929360; cv=fail; b=P76Dx24NzWuBoN641eMiHha5JlZLH1JrdSwW9elNxBMrqnHgdcFLw51fzbZArS6ZVRxLvBdYhNbTpMJhIchqdpDu95PuiUoH28jIN0pt/IjwHtqaKoiU18RceP6y8kAq0dZssgRTJSuduuFTi+uwoK/t1N9ei01bN4k+Z3PYyFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929360; c=relaxed/simple;
	bh=2J3nt4nVIuDZyMJug5zVxLU+4l71fBYZ/kBtabdYcOs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eS/0M3JkPexZ+aQ/NriXMU9r8ZeKfqDA9Oyx5okAakh0nU602yx4NNoOIVPIcANia2OedSRsY3AfxT7zpbKSHcK6uXPwbKjgvPWswueL4c0yuAhCKXZxO5/8/evt3Z7Z9gE+KpQef/KTY79DCoAgRkUWtUE5/2yePKNPNMTvMvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OSZi4Yx6; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OSZi4Yx6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPLcqxYthcrz6awJYDzUKZGcACVouPkv6Mzx/J4GBFnLDpYxFdRzDGeZYwJY5YgD1FjOauXNytXbG6baafSTKUJ6k3vLw+Ej7eHz8kNLFn5qT1U4eUYpvMlXxhQWxFCU+51Jss3AEB73HlvNinXPocnC9ZyqKJglWp+R+gCeE0Khuvv794TsHJ7/m/SS4iwW98Ab/2gCFJl69BYzHp49Q6wsnQuL6VDed7KNKB57aQh8Crgf//+bnX55R7OpQ3DZeegt9RbHWWeXFgvylCaA/Q3afYwcxCG9SYTIEptppnEdXo5Pu/qik8TXh6XAYEvWIb7P1Yxhc+FSS8E7HGeAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0+meB2TJUjlh5w29mRUipzZsCDvZ/1aAaHcfE+hREM=;
 b=y22Fr19dkabUDkZSgi7p6n1Z4uU4s3ldrbbi0Atmuv+EkDxYTP8YF8+nP5mKscnvO/daQKBtVwlqf4bKUDSGgiYhLlUC28OzyoWdqrJaDcsjwaawBkNYn02iQXrUfV+KR+uTLr/aKnwm0ugiM5ECjG0gdtAj6u0PowNsZjcH931WDluhVORG8OWzYNrtHJB46QbU83CwCRd8x1C83utnv5NWXWRJQyOoWYIhhu/OVk6N2VBKOxJI4h5CKM3ZGEn+hkY0WHQZggswOGKGL+aSvjAn4MVo+CS8vOSl0OJOd5RAqbcua6fv5wdhVeF+BRoGzbiW1J7RcCRnl/TQMeo3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0+meB2TJUjlh5w29mRUipzZsCDvZ/1aAaHcfE+hREM=;
 b=OSZi4Yx6P6+AsYL36lJJMMX5SLz+pACkyPZZoeyB2YzoBtg1N3xCNRsScHOwGO6WXslb7TwUUOSPX0qTVCAWZI1zXlT93vplB/buLQNwySQ8VoyhqA+CEOqJXPvfUi6JcbDoJ4Cy6CMHT3f+GNwHpNPiGq92kZhKe2kZDnO1AHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 7 Feb
 2025 11:55:55 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 11:55:55 +0000
Message-ID: <cd64ea3c-fbb4-4c97-b369-dd78942a522f@amd.com>
Date: Fri, 7 Feb 2025 17:25:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: Handle IPC replies before
 FW_BOOT_COMPLETE
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
 <20250207-sof-vangogh-fixes-v1-3-67824c1e4c9a@collabora.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20250207-sof-vangogh-fixes-v1-3-67824c1e4c9a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::31) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4684c132-6167-46fc-aed4-08dd476e608e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cllPclNjZS9uRmhuVGwxcnlzTWdtQklObG5zMDhJRDZOSE9PZTJjWVBCTnlG?=
 =?utf-8?B?L3gyNVZIeU5VY0JZM2xEUTk1TVZRTEJ3Z1BuNHAvZUZOREJjQytETW9KSHcr?=
 =?utf-8?B?Slg5S1RFZXB2a3MyblpCVWQ5NTZwYWRhWGdQRGY2M2NDbFhQUWgyYzNiRkpw?=
 =?utf-8?B?ZFM4am1VNXRCa09KTm1pTGNVcU1jK0dsSmUvbjlmWVhNWmFWcDJXYzI5VStw?=
 =?utf-8?B?NmpwNTRuSEhNbllXNkxGOWpzQXRSb0hCaGxNcXJsZkJLa0ZVS2ZJZFdTUXdK?=
 =?utf-8?B?KzU4YkYvVjVvS2tHVE9rd28xbmQ5MHFIdHJ0am1VY2RyUmlJNi9mbkQ3eE9t?=
 =?utf-8?B?a0owQWhmSFd0dDNkZVgxMmpqYmhNaGtzY0hqd2JzVEgrb0QzT3QyeWxoQncy?=
 =?utf-8?B?MDRCYjFTVjBHNWwyUnR1UUU0NWlmWllmelBRZlBOR3Q1TTYzMGFGUWU3QXF5?=
 =?utf-8?B?WFYzbWl2aVBuY3BVUU95by9zVldzWFlyaWt4NnJjN2tyZXRnY3c1QVM1YVNv?=
 =?utf-8?B?cFgxMysyMlZrOEJMS2tyKzg5QUJHTGNTMGpWejRhc3BNVjhjVmhKMHVGbWtu?=
 =?utf-8?B?bDVDVUhuVVJQcEtGTmE5dm5wMCt0MDROQm1SVjZCcXNkZnNJQy81UlZUdnh3?=
 =?utf-8?B?VDIrZ3NVYUJIRVJ4Q1FwRlJITTd1Uk9xZzh1a3ZGMHV1U2FBUEJ2WG5lU2ZB?=
 =?utf-8?B?TUhucHFvWFpzSEJlZWtBSFFLcHlST0FuRmx3dzcvTnl4Qm9ySmo3OTNONjI3?=
 =?utf-8?B?THNRNXRHRFVrQ0dwM3A3Mnc3S3BMSjBBbUpmellLRDNDbHEwa2V2QTBNVXJ0?=
 =?utf-8?B?OXNDT0dIcFNEUE1qWUdGQVhwL2ljeDM2TFBteHJSZ3dRaW5QOVNNRjFEenM4?=
 =?utf-8?B?cFZHdmhnU1ArSUp4YzE1L1RVTkpNTE8ydjN6NEhHaWQ4SmRvQkhOekZtaVQ4?=
 =?utf-8?B?UUR4d2dPVlpCY0xGS0Z0Mk1oQ2hJYWVKL0tLb3V3cThQb0Q0M01PYkVKOXFy?=
 =?utf-8?B?Sno3WktiVUIwb0NiMGtKUmlMcWM3Wk1nNSt3dDdkZUJ1eVhtVUdMOC9PNklI?=
 =?utf-8?B?UzdzVWI5REZPQ0RxOGNEcGVoVi9pV09tTElKa2x4alJ2S3pjQWhsN3Nvb3Q5?=
 =?utf-8?B?ZW9ZNlpzOTZ3byt6d2dQSWtTd0dGWW5GaVcwbnJEbXlod21QSU9TOUVGM3pX?=
 =?utf-8?B?QWNVYU1lQ2xGNGNoV2FocmlLeGJ2RkhyUHo0dVRsNFBRQnhUZTFFUmRZajBs?=
 =?utf-8?B?WWM0ZW5HT0tMTlRlR0dLTFFpeFdtMUR0a3dvVGx3aXREajdkMVhjR1orbVZl?=
 =?utf-8?B?QlFWTmVBUk8rZDR5TS9WRkswNENvRlJad01DY3lNVTN0eWM5dHZWcmRnc1Ex?=
 =?utf-8?B?enJ2Y2ZnZm5DSllVaW94aytYYXMrMXQyeGpPL2puL1VROWJSckpZOUgzd3ZH?=
 =?utf-8?B?bTg2OENJSWVhSmVvcEdvenJjWGhhL0thcUw3dFRrZWtDZnNPeFhkTEhpb0pV?=
 =?utf-8?B?ZTlZRklCVEtmcVcrOWs0OHo5ZHJWREdmVzNEWFFnTUVZaTJiU01rYmp1Rm1l?=
 =?utf-8?B?SEVUcFluSlpOUFd5SzhsSkljeWJubk53RC9ocE1HSXJNTjBwL2hsN0FBSEJF?=
 =?utf-8?B?Q3dtYzBKWFFXcVExWEljakVhc2lUSldIdUtaOU5FK29GOXpDUHdhM2V2RFE4?=
 =?utf-8?B?eFZKNjdaY2J5TmlIRVNTdHBBQjhPU0I4V0FQQ0lwZjZZbmk1SmxoeXZvWXFP?=
 =?utf-8?B?aEdoeWhyOVl0TVQvR0haZjVhL0F6NlQ5UVkwQURHMjJEUGQwYkd0MkV5VG9Q?=
 =?utf-8?B?ZGtaMjB3RmppTlg2UVBSK3BQczJRaWxNQmorMEtRSHJnQkJlZzlKeEtjUlZH?=
 =?utf-8?B?dC9oM29HYXFHVFlNZDU3TlVkM1FjV0xnV3Rla295S3A2R2JXMmVjSmxoSzhr?=
 =?utf-8?Q?E3woN2CctU4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHlONmNINDZsZ0ErQjlSNXdkdUYrcGFQT08wOUZ6TjI5SVBrVGx3djhCdHNS?=
 =?utf-8?B?a1B6alM0bGsrT0xVYWRTSVlSVFlPRUxSdEU2eWFpWC9lMEdxNjJvazgrQW1S?=
 =?utf-8?B?WjdqbjRRbEZRdjZPckszVVNJL1o4UU1BR2JpZUNXTkVaUFUxVHo1cGIvSmVz?=
 =?utf-8?B?QW5GTkd4VXR1RVJrUUIzcElBTnFZTmNvMU9weDczMEV6MlVQbHMxWm9wcFR6?=
 =?utf-8?B?NWpwQ1psczIwdjBKdzZteTF0WityQnJ6bjhvMEduL0gxMFRISWlQTTl6SE9J?=
 =?utf-8?B?aWdDUXowcWUxQnIvS3BKSzhRWW4rR09ScW82aWFuWmFtSUoxWTF3ZnFsZlVN?=
 =?utf-8?B?Tjh3MVoxQlFidUFXQmxYQ2d0VDIrTXg2RkgvS2llVkJlWncvZUJUc3hJY25Y?=
 =?utf-8?B?K2oyWVdEUEk3Ky9PS2haR1EwMHo3Y2wwTEV3RTRQVU5GaEJUUllGdVFaUFFS?=
 =?utf-8?B?b005aWFRQ3UxY1NKeEYxK0JEa1MxWkY0OFZyTFVFL3YrZ01ibnpScVgrcUU0?=
 =?utf-8?B?MVpkcUprN3lET3RWOGhzSGlOOTZCaCtVMko1eDFJb2hoMXExZ2R2VTc0RmtJ?=
 =?utf-8?B?eHVPRkN0TzBHOTJiTGNMTWxSNGN6UEozWHJWR2xvVTlLL2dEN2tBSFlBUGxh?=
 =?utf-8?B?Zlp3QUluVWRYdE14VXUwYVI2YUpJY25kM0dYc3hmQVhabGYxak5HdHRzakNV?=
 =?utf-8?B?ZWgrM2xDQWVhRVZTaklKekliNERhRlA5SGlVOS8zdTlTRU9HMFV1dktETE03?=
 =?utf-8?B?dUVaYW1YUkRzekxzS0czc0ZCSjE0cmxQeWxlRU1XU0hHVWJ2c21CaG9yMThY?=
 =?utf-8?B?Qkoyb3hwT05Kby9wS2p5RW5LNW5UYnlPeGF5YS9xL0ZsTkpYK1VGWXBIdWQ3?=
 =?utf-8?B?RVlpUVpMT2lGQzdCUE1QalpyMEIwMFZLQlhtNUJ2UUttM2ZIaENRQTN3RUVt?=
 =?utf-8?B?Qk5PUmd1MHBZVVd2UEI3UUN6b3ZEaTZWK1A0UlRxQm1DcFZjVE5Jbk9JY2Zx?=
 =?utf-8?B?cTkvR0FHWjh0QUd1NnRoUlcwbFZidG03SVdwem9TSXExVmdMMXRKZUlNUTd0?=
 =?utf-8?B?YU9RNk1Nb1YwUDdDdmtOaG5nM3JPYTEvWjJkb2Z6YjF5NzVpN25ySlZHTnRr?=
 =?utf-8?B?N25UNjhXNEROWVNVQXI2QUhtamdGS2N3UFBxSzVNdVZGeFAvbVVETU10Mzkr?=
 =?utf-8?B?aWpRT21QYk1HN2ZtcFBlUkFwdXJvNks4MDM1UVJpKy9XdEtxUHpPeE1zVWNS?=
 =?utf-8?B?Z3FkdkZQTy9WcnhrM1FVcEhlREwzdHlpbTBlU2hMOTRoaUJYNHA3VEhlcHFJ?=
 =?utf-8?B?dXlac1ZQaFdOeHBwN3d5MVQ0TFhFc1JMMzFnaEZSemQ4WEpJa3BaK1NSeE0z?=
 =?utf-8?B?NkFvT1ZTdVI0M09JMzlrZnh0MDVRcHl0YnFLeWhmWWRtbjhUblYxbkdtWnha?=
 =?utf-8?B?UkEzaXRaTXl4elhMQVFXNEFKZmlUQnl2eTVoc3BYY3l2UjNYT0RPU3NHbzgz?=
 =?utf-8?B?VG9MNXpqSFJSVndDYlBZVHhueDRHMmFGaFh6Z0t3SGZ3Wjc5SERyaWRacy9E?=
 =?utf-8?B?TDRjSk5ZQ3NiM05aN0tVV3I0Q25aVXVMbkFwdDFpZm1DaW9MY25JU2N6ajVp?=
 =?utf-8?B?MWZNQytNSWEwc041THVVQzNMNEpWZlMyYVg5WEZJamlaL2wwL3cydm9jU3E1?=
 =?utf-8?B?U0d5ekp6ZklxSEwwVFhTSmtiTWorWmR2bFdScUNoTENwVUVJMTFtQ1p4R3RB?=
 =?utf-8?B?d3V1bG5FQU9WY2U3Tzl1K0NSQ2FZczg4OTlkR3Q5TGNPNU0zZVVYREYxWmty?=
 =?utf-8?B?VWNBYmFQWUhPYk53RTNkZFA3a0pIMldYU1QwaVhpY2ptZFd2UEszY0J3b2pr?=
 =?utf-8?B?MjRpNjhFVjZidDlNblZsY0JPdjlESk56enloZTl6SDFuWXJYVW5PbE9KaExY?=
 =?utf-8?B?ekpKZ2h1VVhSTEhGVHBiM0xHK0hWRjZ0bkMzYWtieUU2b2hjeVpwU2kzZVc1?=
 =?utf-8?B?QmluUzFNNk43cWVpYnZaYkVIWW5PelJYM2IzNXJ4dGkrRG1CUGxDY2ZWUncr?=
 =?utf-8?B?S1lOaHZCcnBWOEIxTGdVYVQ1L3h0L3VBalpTL2FTRklqK0FOeUdCNmZFQVNI?=
 =?utf-8?Q?c7Jpw0gLo80RMNZ8bqJ685V4y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4684c132-6167-46fc-aed4-08dd476e608e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:55:55.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoeC7Y90cEJ0t38ln/H4vUcYXWEeVCHLf5M0tOBoYiZkoV3SJHdsdbEYmJIkU8CwovGjoohOG6biOnbD2rZBzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

On 07/02/25 17:16, Cristian Ciocaltea wrote:
> In some cases, e.g. during resuming from suspend, there is a possibility
> that some IPC reply messages get received by the host while the DSP
> firmware has not yet reached the complete boot state.
>
> Detect when this happens and do not attempt to process the unexpected
> replies from DSP.  Instead, provide proper debugging support.
As per our understanding, before FW boot completion there won't
be any IPC responses sent from Firmware.
In this case, do we really need such a condition check?
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  sound/soc/sof/amd/acp-ipc.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
> index 5f371d9263f3bad507236ace95b7ef323c369187..12caefd08788595be8de03a863b88b5bbc15847d 100644
> --- a/sound/soc/sof/amd/acp-ipc.c
> +++ b/sound/soc/sof/amd/acp-ipc.c
> @@ -167,6 +167,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>  
>  	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
>  		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
> +
>  		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
>  			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
>  					  true);
> @@ -188,13 +189,21 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>  
>  	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
>  	if (dsp_ack) {
> -		spin_lock_irq(&sdev->ipc_lock);
> -		/* handle immediate reply from DSP core */
> -		acp_dsp_ipc_get_reply(sdev);
> -		snd_sof_ipc_reply(sdev, 0);
> -		/* set the done bit */
> -		acp_dsp_ipc_dsp_done(sdev);
> -		spin_unlock_irq(&sdev->ipc_lock);
> +		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
> +			spin_lock_irq(&sdev->ipc_lock);
> +
> +			/* handle immediate reply from DSP core */
> +			acp_dsp_ipc_get_reply(sdev);
> +			snd_sof_ipc_reply(sdev, 0);
> +			/* set the done bit */
> +			acp_dsp_ipc_dsp_done(sdev);
> +
> +			spin_unlock_irq(&sdev->ipc_lock);
> +		} else {
> +			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_BOOT_COMPLETE: %#x\n",
> +					    dsp_ack);
> +		}
> +
>  		ipc_irq = true;
>  	}
>  
>

