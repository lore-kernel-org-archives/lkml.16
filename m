Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50421D3F5;
	Thu, 29 May 2025 23:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748559803; cv=fail; b=JvDnnmux9IaLBQwnq191liPXEzXIo5OwhUhCOghZzQOjZxjElgOK8+7C8RLWwDC0oS+vKXHj+jhubfeiBDTpEpF62anAP9rBYDPQEIwm0gtyzFZurj5tOSd7ImDFxj5U99ck/Pi76DtEk1QBo9ddNe9OkUQMi6muqEVgsu94SPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748559803; c=relaxed/simple;
	bh=Z8ee/hzQ2DwnIKCencaKjDOls0s/SsG+8FfWE3pF0tI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Up/NZ5BLHcdeXRnnN61pScvAFQ2XdTMyQ96FzQHtSy1HCTdhphuk5lAYf0TF3rFKffaPbMVPpoqfnXoWbVecUciLqzew189sViDoSlTDRlg3x9Zt1Al8XLaFJbLgjYpYgnnV8/uzH1eABnYS4N/GtaSlvl+R/eRIs8ZMgDtis5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gy4MoNey; arc=fail smtp.client-ip=40.107.212.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gy4MoNey"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTK9+pgQfBxDly2F9tfijO77CQBA9bWCRrKauX1v7agWfR5ikNDY24hNzb0koB9Zb1EixaY2Sbw5ufdka9z4/MylvWia7CYvHlj+rh5/IY1Iu4ssORNkAncSkxvHU9YlQ3SG4BSYxYZGH2fow7lrTbWmLY45fHvnDllx1s5QscJtbOeeCS7CKmMEAGKC+zh2JaqHg703uKX1ezCQZD0CwSk5mBB3tFepWDwa8j8y4Z0qoFHGp/+859M7PF/F2IMpe0fyaCapehIuTIxW3YChE3D2UgEP+NwCzgOKBANlNpWfvmhzAfhWY8Tc+lau+UWhmpa6shfMfGMkTBvrD63tMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7El0QnHV/88ThhwB+6wNO9X1JVQgifUtlhcCqt5wx0c=;
 b=E7+9RtjJB74HKMx/0ju6BdLAEZukNlt+iAE6NkMxyOub0bpIZZ1TScVwnFfZ44aW2qjg7jIFB01XCxDKyVA3/AS06TJQhJjRdpNk/l5V74zbSzq0ROiMogjqcHViYpqpMkdZwnweV6tZWQe1jifxs2Whzo3U6ipRYPKamBUfEKqza0djJLeKVMs5dyj8UldN4uKA/0kbnVi9uFQC81MuIRjs/OJmQ97LZftvVW4jB+8IXzoJYdpaaw3hTjPVq6QM+0S/AK+Z69NuQ/XFOJFU2UR5Z94yp7nLRPOcH5WYTGmcNd/jHpvgDP+7MasgPgyuKC/wc6oYv9bVO4rJKDpXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7El0QnHV/88ThhwB+6wNO9X1JVQgifUtlhcCqt5wx0c=;
 b=Gy4MoNey1R37Nl70zbaIYJylxjPK8gqbyNiGt9rzyxbc5W3tIiHbBrDRX9KzlEJB8yvh9pjde48/6pmqgI+iS4DqhurIwSg15hCKO5x1Ny3EndXnZban/D9HDqBbSMT9je1Qv/c56BL8ZsXjAfYnj1I+qssgvJ//aia6My8Ez58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 23:03:15 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 23:03:14 +0000
Message-ID: <54f7b1df-7635-4c3a-8395-172806fde99f@amd.com>
Date: Thu, 29 May 2025 18:03:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 21/27] x86/resctrl: Introduce mbm_assign_on_mkdir to
 configure assignments
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <ec8d3053a63980fb7fd2b4fc8bba0a1cfa8a69e6.1747349530.git.babu.moger@amd.com>
 <1395b692-cc65-4d84-a68e-f9b20c37f74a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <1395b692-cc65-4d84-a68e-f9b20c37f74a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:208:d4::48) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c08b3e0-084b-46b9-a389-08dd9f04fdcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ai9BMjl1RVlKZTF3WE5jeWFSVEJNam42dXpFVk5FK0xzcXd4RFUvRmk4cXVL?=
 =?utf-8?B?YjJIQkFuVFVtQnE1ajMvVFU3ZXRIZTNqSHRNTDNrdEdYL0tNQ0twZDU1WEk5?=
 =?utf-8?B?U29kNVp1Z29uZ0ZPOEhCc1FXTUVLMkZ4UU9NRVRtakJTTC9DY2d2YU1uWndK?=
 =?utf-8?B?bSt0bkFnYUZNNHRHYlVTd25YLzNoU0s5TWJkNEpsdStyemtXd3BaMGdPQStV?=
 =?utf-8?B?OUZDUENJMzJxbXJrK21BMC9vZlFkbXZPVlZ0OGh5RDhBVnR5S1krMjNpb0J1?=
 =?utf-8?B?WXNRdFFQUG5UQU1QeFlNT2xvK0cxS1IrSzlkOVBPeXRrVkNmUzdxcnBQZkNr?=
 =?utf-8?B?OU11MTFlSmVXU1FqcU84dFc3T0EvMHluVVZiSDNkVzZZR2k4M0lnaVVoMUNY?=
 =?utf-8?B?dHlEZmdFdDRFSE1FdElTZ3h2VThnMGlRWk9XUXlTQmlNdFh6MkNHTjJubmZh?=
 =?utf-8?B?aklyVEh6dkpNRUxkK2JZM3N6SjB5MVdWYitzZVFybzZ1QzRBSTM1UVRqQ3My?=
 =?utf-8?B?R1FPK2l4ZkFDNnNWOG5RczZTNUVBQkJoV0xPeWlscGM5elJpbFQvVVcwQ3lh?=
 =?utf-8?B?a0hZQ1dXYVR3cWhIT0ZGVXRlKzVRUE9WRllwdEplejY0b1ZINEhsTmQxRE5J?=
 =?utf-8?B?SE9xK1dmTWJmTWNPd2FBbzlBWEFZRnhuckdOMlIzMkVJbVk4U0NJS282QVJI?=
 =?utf-8?B?NDl2WUdwMnhKdE5ReWw2L2FaQ3JpczBzek1sdnE2WWlyeDR4VjlBa3E2TVFm?=
 =?utf-8?B?STlEMm5jVXdNWlIxU1BMcUxmcXh4Tk5mdXRsYUJ0L2NnVnhod1RIb3grSk8r?=
 =?utf-8?B?MjgwZUhlZnFNVTFlSjNZS0VmODQveTd6SDN3REpYQkVIN2tLb3lUSHFGdkZH?=
 =?utf-8?B?Z0h6UWV0VUhmNEQ3U2FJTjVsSmU3cTRHdHV0b0pYcE5MNFhrRThkVGN4V2JL?=
 =?utf-8?B?UmhTMDYwL016dmFIWHgwaXgvejRveHk5bXVac3h3YkdzazRIY3BsV2JsQnpR?=
 =?utf-8?B?MVRlKzRCbklmUWYrOWoyRENCMTB0Y1ZjK2c3OXNtZ3VzOUNqTVdpZ3hBdlFj?=
 =?utf-8?B?RVg5dW9Dd0EzdEcwRmtrY25zMWF5WTZYYVlsZFFMdit5S3N4djdRVncrbzI1?=
 =?utf-8?B?Q2lsOWVhZHV5MGNvNmV5Q05Fd2pQRUZ2UXVGQjhlUUVWLzl3eGY3ckhRVDNw?=
 =?utf-8?B?K0h5anpDZElJWFAwS3p5Z09hUHp4OVdkOE4wY2lraTJlMGRFRWozNmJnOVd3?=
 =?utf-8?B?bzh0eFdXcGVzb3Q0eHphc2U3Z1lqckNaazFhNldadGNNNHhSdDFEbm15S21T?=
 =?utf-8?B?T0RqbDRuNC9xZ0h6azlYamJGVkRwTnUySmRZTXV2aVlvdjlhamsyWkRzbWd0?=
 =?utf-8?B?QXJXRnFXQWRaUnpWQUR4ZVVtZFlianQrNkRPb3ErRE9JQjJMcVZVNExrRlJF?=
 =?utf-8?B?alN3Vk5XQVNSUFZtZlVYeVJpdGIwbm9SWEkwdlpTeGdwWDVBUTZ1Z3NEYUVz?=
 =?utf-8?B?amVIY0E4aE4xeUFhTVh0WnNtUHJIZDZ1SVY3czFPN2dCZnNBRXloTUFxYlFY?=
 =?utf-8?B?d2FxdDVnR0x5ZGkyVXV1WmlCc21Cdk4xcEsvK0xKUzM3ajdrQmxlOFZWQVNm?=
 =?utf-8?B?MHJPNjdkUU44UXVwaFJWRzFXZUxiZklEcjRqdUZGRWl3NktNTzJaZC9keExu?=
 =?utf-8?B?dWp5aTRVdzVJQ1Q3dE93V2FGYTRwVUxpLzZJYkptYjM2L3lQK2EyeDZHWnVV?=
 =?utf-8?B?bnUxbmtDRVJPdHN1a0pCVGpaOVZzMTAzeU9rZndQRmFaWVRXbXBRMUcvUnBW?=
 =?utf-8?B?NlJ2R1UvTlNFakFjNWtLdUpqWEcwYjdnVFg2d3FTcGlHSi9sUHpOeHNVUVlq?=
 =?utf-8?B?ZC8vZjVqU1R4ekxMOTdRR2FKeHlaaGJNUUYxWmFYMTRRZlFldnR5M2E2WXdt?=
 =?utf-8?Q?K5pz0wUNNYo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1B6cENXampOT09tRjVPOVFRME51bTdWVmFmNXNMb3ZzTE9xVnVjL0R1NEtK?=
 =?utf-8?B?NXJlaGx2U3lkUmdYSHJMaHdDSWk3TlRKTFA3cDJ3MFNFMm5Zank2RlZkbDhr?=
 =?utf-8?B?c053MmZmRlZraTYwSm12S3JWSDhDTy91eDVGSTJSK0ZqdkZwYlh4ZTdXNVM1?=
 =?utf-8?B?YlBlN1pxUDlLeHZ4Sm9abnljR1pwbFZXTHcvMEdnclZXaTEyN2RXcnlESUo4?=
 =?utf-8?B?czIvOXF3SUVqdUtNTytoN1hCM0Y4b09iN3hGRkE0dHN6VFRJWGVuNHFXS3ZD?=
 =?utf-8?B?aEpZd1V5ck5EVlV1ZVE1L2ZvZGlGK0RkRXlZbHRsWE1SQU00UXJUbmRVMXFu?=
 =?utf-8?B?eDBMZlhOR0tBbVdBRlRNVDl2MHhMNWNqdW0zenJMeVVwNGYzUEx6RElzN0VD?=
 =?utf-8?B?QlJjTWtzL2JYN2haaUU5a0FoUExhSlBWb21mUklhUEFzNllhbWp5QUNyRUJ3?=
 =?utf-8?B?cDBpbEJPN0h3Z2JjTjRVN1ZNSUR6VFlPMyswaTZTV0plS1BMZVJoN096SHlD?=
 =?utf-8?B?S1BzSUZvYW9STjFvNThJR0pienZjL0JCRTRkbHpLaUZITzVqY1d5djg4V2pZ?=
 =?utf-8?B?QlJrdzdRc0JYMjNXSjg4bWYvUTErSm5MSTQ4Zi9CU2Y5c3JmUUUyUVcvTXpZ?=
 =?utf-8?B?OExJcElFY3hTT3EzLzRiMklNcXJETG53WjNHTUpuWkdTQ2FURWF4TjZ1MktX?=
 =?utf-8?B?cjA2VVdFTTJKbjlNTUQ0VnBEZ3hlbUhUV1c3UE51UFJNRGtHVVdjYkU0L3Bx?=
 =?utf-8?B?SWRRa3JkZzd0R2JNamxlYjhTWkI5VXk5SW5HNDMrbXJWR3NmYUFWY3VBb0dY?=
 =?utf-8?B?clNDZHZWS1o5dkFuS1RDZ3N3cHlkeFVYZnRPZzdiaitIRlR5L2htWU1mLzVz?=
 =?utf-8?B?V2pXNTBmSG1qMHduN0tHWDAxczhlRnFkck9mSm9FNG54L3ozS2RBaEcxTjAx?=
 =?utf-8?B?VmlEOThEWDRxcUpsVndranpHR2hxcFl3WmNkcHlEcm40cEJEaTRvMGJBNTZU?=
 =?utf-8?B?VXFiU01CSjlZaXN5Uk1KTHJFL3poR1FlNDhWZWUrLzZEUFhHL0hOUERFaE0r?=
 =?utf-8?B?UktzNXhJdU9wZDFleUYxWllSR3lyaTdUaC83OVZmam9xK0dLRlpKcjNqektL?=
 =?utf-8?B?NU53S2VXcEFWeWZHZFV4T3BYbmd4QTl6SExQUXB0dnBKWFpKOVd0UEpldVpZ?=
 =?utf-8?B?UGhLYk1IemcyQi9nd0RGd1BRV2lFUFhuSWF5Rm83Mm83Q3JrLzZyZ05xdDFQ?=
 =?utf-8?B?SXB5WUYrSE8yNnRqeWRmOEpad0gyOUp3VnU0cUZ5T1FtZmRWSjZhVW40Z05B?=
 =?utf-8?B?Ui9rV2RJQzgzd3p1UUNGYXBqdjhZSnBpMnlUbU1DaFNDRkI0MVRvYXNFYnNn?=
 =?utf-8?B?ZU1EYkZLWDhnSDMvS3Yva0pkck9VdTRHaGhYeXhnNklxYTVNbXZvMjNRR0lL?=
 =?utf-8?B?c09wdzNOaXQ5ZzJRK0JBRmY2QitFMmZYbzFHZmRaaDZ3d05GOVgrbXhpYjF3?=
 =?utf-8?B?WSsxTXozTHNqSTFOSkVpRUJ4djlGQmc5cU02bmZrYTVkdy9mMUJXd2taRzR1?=
 =?utf-8?B?VkFONS9QTW5pcVZMSFZxMytiN3FIcTJyWUFvTW5VUkVPeXZiQTdyUlpIcG5l?=
 =?utf-8?B?WGk5dmp3a3Job1paL1FmYTc2dHNYNXBnbklIUzdoUlREeEhLL2FrS1NndG95?=
 =?utf-8?B?MTJDRDh0QkF0ZUZTbUxZYnl2N1E3TWwyeU8vN0JxMC9DRjd1QzhDMXF1bFBq?=
 =?utf-8?B?a2JXSlZxeE96WDgvNStaTTByKzdBdVh3eHcySmtsSmt3T3g0L3BIcnljM1pk?=
 =?utf-8?B?Tkc4MVMvY1FjT3JlSWNYdEdPbk5KVmFicXJPLzRPOGFsaTVpbmt5OFFiYm9Q?=
 =?utf-8?B?WEN2cTdHTEJxTmUvOEI1TzhzZEljblpYYWN4a015OTNGd2RYVVQ4aE5DbGsx?=
 =?utf-8?B?MU42bU1Xa2toNHJia1JKY05DbVRkSUlwaGRRSk15dlRtWDBKaS9WdDJCdUh6?=
 =?utf-8?B?aWVFU3lFNVEzK2NsMTMwcGZiK084dEpqTnlOZzIrR1ZOZ0M5WVRFQkNwUFhi?=
 =?utf-8?B?N21VRmdDTDhWWFVvQ0hrSEc3L0k2WVBJOHRIbVc4TFJzUEl4aE83VUx2VTVG?=
 =?utf-8?Q?2O0w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c08b3e0-084b-46b9-a389-08dd9f04fdcf
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 23:03:14.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wF+LGAZAoLJ+P4jVXe+jrXgbEf1PiTxbT0hctinQ1wpvAGD4KfDXB4h5KIZyLIrJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240

Hi Reinette,

On 5/22/2025 11:48 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides an option to the user to assign a
>> counter to an RMID, event pair and monitor the bandwidth as long as
>> the counter is assigned.
>>
>> Introduce a configuration option to automatically assign counter IDs
> 
> "assign counter IDs" -> "assign counter IDs to <what?>"

"Introduce a configuration option to automatically assign counter IDs to 
to an RMID, event pair when a resctrl group is created, provided the 
counter IDs are available."

> 
>> when a resctrl group is created, provided the counters are available.
>> By default, this option is enabled at boot.
>>
>> Suggested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Added Suggested-by tag.
>>       Resolved conflicts caused by the recent FS/ARCH code restructure.
>>       The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.
>>
>> v12: New patch. Added after the discussion on the list.
>>       https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
>> ---
>>   Documentation/filesystems/resctrl.rst | 10 ++++++
>>   fs/resctrl/monitor.c                  |  2 ++
>>   fs/resctrl/rdtgroup.c                 | 44 +++++++++++++++++++++++++--
>>   include/linux/resctrl.h               |  2 ++
>>   4 files changed, 56 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 9923276826db..356f1f918a86 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -348,6 +348,16 @@ with the following files:
>>   	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>   	   local_reads, local_non_temporal_writes
>>   
>> +"mbm_assign_on_mkdir":
>> +	Automatically assign the monitoring counters on resctrl group creation
> 
> assign the monitoring counters to what?

"Automatically assign counter IDs to an RMID, event pair on resctrl 
group creation if the counter IDs are available. It is enabled by 
default on boot and users can disable by writing to the interface."

>> +	if the counters are available. It is enabled by default on boot and users
>> +	can disable by writing to the interface.
>> +	::
>> +
>> +	  # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
>> +	  0
> 
> Please be explicit in docs what possible values are and what they mean.

Sure. I can print "enabled" or "disabled".

> 
>> +
>>   "max_threshold_occupancy":
>>   		Read/write file provides the largest value (in
>>   		bytes) at which a previously used LLC_occupancy
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 1f72249a5c93..5f6c4b662f3b 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -933,6 +933,8 @@ int resctrl_mon_resource_init(void)
>>   		resctrl_file_fflags_init("available_mbm_cntrs",
>>   					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>>   		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>> +		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
>> +					 RFTYPE_RES_CACHE);
>>   	}
>>   
>>   	return 0;
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 8c498b41be5d..0093b323d858 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2035,8 +2035,8 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>>   	}
>>   
>>   	ret = resctrl_process_configs(buf, &evt_cfg);
>> -	if (!ret && mevt->evt_val != evt_cfg) {
>> -		mevt->evt_val = evt_cfg;
>> +	if (!ret && mevt->evt_cfg != evt_cfg) {
>> +		mevt->evt_cfg = evt_cfg;
>>   		resctrl_update_assign(r, mevt->evtid, evt_cfg);
>>   	}
>>   
> 
> Needs to be squashed.

Sure.

> 
>> @@ -2047,6 +2047,39 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>>   	return ret ?: nbytes;
>>   }
>>   
>> +static int resctrl_mbm_assign_on_mkdir_show(struct kernfs_open_file *of,
>> +					    struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +
>> +	seq_printf(s, "%u\n", r->mon.mbm_assign_on_mkdir);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>> +						 char *buf, size_t nbytes, loff_t off)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +	bool value;
>> +	int ret;
>> +
>> +	ret = kstrtobool(buf, &value);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cpus_read_lock();
> 
> not traversing the domain list so hotplug lock not needed.

ok. Sure.

> 
>> +	mutex_lock(&rdtgroup_mutex);
> 
> rdtgroup_mutex seems only needed because the message buffer is cleared below, and this is why it
> is not required in the show()?

Hmm. I didnt think about that. Do you think it is required?

> 
>> +	rdt_last_cmd_clear();
>> +
>> +	r->mon.mbm_assign_on_mkdir = value;
>> +
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
>> @@ -2056,6 +2089,13 @@ static struct rftype res_common_files[] = {
>>   		.seq_show	= rdt_last_cmd_status_show,
>>   		.fflags		= RFTYPE_TOP_INFO,
>>   	},
>> +	{
>> +		.name		= "mbm_assign_on_mkdir",
>> +		.mode		= 0644,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_mbm_assign_on_mkdir_show,
>> +		.write		= resctrl_mbm_assign_on_mkdir_write,
>> +	},
>>   	{
>>   		.name		= "num_closids",
>>   		.mode		= 0444,
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index cd24d1577e0a..d6435abdde7b 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -278,6 +278,7 @@ enum resctrl_schema_fmt {
>>    *			monitoring events can be configured.
>>    * @num_mbm_cntrs:	Number of assignable monitoring counters
>>    * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
>> + * @mbm_assign_on_mkdir:Auto enable monitor assignment on mkdir?
> 
> How is "monitor assignment" different from "counter assignment"?

I should be:

"Auto enable counter ID assignment on mkdir"

> 
>>    * @evt_list:		List of monitoring events
>>    */
>>   struct resctrl_mon {
>> @@ -285,6 +286,7 @@ struct resctrl_mon {
>>   	unsigned int		mbm_cfg_mask;
>>   	int			num_mbm_cntrs;
>>   	bool			mbm_cntr_assignable;
>> +	bool			mbm_assign_on_mkdir;
>>   	struct list_head	evt_list;
>>   };
>>   
> 
> Reinette
> 

Thanks
Babu
