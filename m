Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02030E826;
	Thu, 19 Jun 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358530; cv=fail; b=DCsZ34zZ2G7ohaKqGuiWv52rUem97IphBtQHIQRdpLhq0E+9gqbtSJ5R5yxY5RyEvsdkrGq7iu3Vp8e4Qj4BfHgG1CT9LviPNyGO5xOVgViups5IB2ZUl2WbCPng+ki+nSpiPSfdjC+m3d251XQyOU1oOO201Gy/wKrwU6ApSKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358530; c=relaxed/simple;
	bh=ZmK5eeJIUvG/56Mu48tjBAT2zsNIhCMjK714bB6W+Zs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OV7x4SFCyZI5/0z0FmjmxJQwDN0rd2C0hzMuKD5C32VbizARE0b5h4QPArY5Xmb9zYkDySjt5D1v8llSpVOWduT7W82KyIYGUAaMMUpO/TGkfd9onmxTgbwWBdfVt88nWaOxrV96UNolJUsw3rB/GbuIdnj/LF3Jt7H9EtA46Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IAcTVtaB; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IAcTVtaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrgxsFeLxC54uSOGwOLaQUf4wMLffGDQsoUIHXdG9LwI7d5C1BDNWbZbTqwuQtVX9GRAdasJucMJWsRA86Bj0SEX1c0jSWq1dFQJPYQn/sHOElIfMfzIx/1bJZpma9yOdUuOuxmb+OJpCy2xXST85mj62ibYpxzk633/i5c7SqBr6uS0WPauEFtJPcrvdr4fUuVEh7pV+EOX4JqmtFJRyMDo6ODEBDGg+q4CME0xr4QsVl7YBNq4CLsjiSmsRIil+79VSw6o2jUQm3zzi1zwG00blk/ah0jZS4R3SAcDNpspp8XDoI4A9k4XidbwhfeGwgaYgqIzZRyARFR9Qoskyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX1EAjgG9NO2wLQVEpg7vK8R87PuYob3fn5kFl7rets=;
 b=ok0YuKAH2uq3vWbvSw7Be+RAbe5krfifXhmwvJRKj4e8owtKOyVzT2s2aMRUs68RljIFIbinRGkdOe1vdRSEdcyalVedvnhkvnlWLS8gAKvXKtMZNZtj7ouAJxG6DulFkQct2wB3Q/nlYmEgfwYMUuNL0b/9T8ri6opdinuKS0S3ty7uS+i0ojHdFACFEsGYYC77B3igOZZ6xeLjCNtliXT1VEyICQCQ3WeNBazz7T5PinYsxgtY2axbPtFxUsIBxxibzbkdAjXdcZTqcUIxxG2Caq62hQl9X1TyFLQmjYOBLl6jj48pSNOdXE9ggdvL3LChFcolZPBeu/wOvLFsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX1EAjgG9NO2wLQVEpg7vK8R87PuYob3fn5kFl7rets=;
 b=IAcTVtaB508Ad363ZCt8Jhgz++Y4bMgSuQShrW7MeV0Uq1pNbKc7cHrOvykEciPl9Qs/GZpQos57xMeTfCXgpv3qkcFEBLIoQAm2YsBPdnDll8QP/5ogLzHXvefJz+Rwza8ez4Fph1nbNVsWX8A7Er/90j78ns28rXCcTo/gmRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SN7PR12MB7108.namprd12.prod.outlook.com (2603:10b6:806:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 18:42:05 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 18:42:05 +0000
Message-ID: <93d010d7-4fc2-46ee-965b-7606fd2cd5ee@amd.com>
Date: Thu, 19 Jun 2025 13:41:45 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable
 io_alloc feature
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
 <3bec3844-7fda-452b-988f-42b0de9d63ba@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <3bec3844-7fda-452b-988f-42b0de9d63ba@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CP6P284CA0076.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1a9::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SN7PR12MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f7b40f-4d3d-4af3-c63d-08ddaf60fd07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzBPTCtwT1FnZkdRWTRMQjBSc3JzblJVSlViMURFa0twOWowQUZKZXNpeGt0?=
 =?utf-8?B?cmozTkxWRWpKNVB6NnduMG12TWpDNEowUkxqRmpXaHBUcU1CcEt1T0kwSWs0?=
 =?utf-8?B?QkY1bkViWEYxSllvYTRoWXlSc2t4MHRvTTBSYmpjbWczdC96eDVsTFpuOVRZ?=
 =?utf-8?B?TmJYNjR4dzN6eloxa0YvakE3TnFqaEJwdzNUSUlvb1NXaDhkT1JiOUxQNFc5?=
 =?utf-8?B?Mndkb3dpdU5IaER4d1l4Y0xTUUlzNWRkeFNYdEgxaXBaaWFFTHc4eDduaGxx?=
 =?utf-8?B?NTE3VHc5cFQwRDUxcFNGMndlMFJUTEpkSXM4VmtVaGdpKzFZOGVycG5MTzUv?=
 =?utf-8?B?clpOTG04RzNsZlFaR3Nzd1RLZ2R6anhxaDNwWUg1NFJ1bzBnZURhYUR2bXE4?=
 =?utf-8?B?QzRpbHBLRnUwUlU2RlZ6MHI2bm5CYk8rNVgzamRKQXNHb1lkR2wvMmNEbU04?=
 =?utf-8?B?Y1BxdUNSd3N4b2JTaTdHN2V1WVBCdm5CaUVDcXFVU0dNQnFIamlBdzhPSldG?=
 =?utf-8?B?cDVJZkZXQXU0a2E4OGhPV05vczdQU28zZWtKc2VHTW4vL3VYeG1yVHlrV2lJ?=
 =?utf-8?B?WUdCU0Zkalg0Y012eUQ2WkxyVkJRUXJjT0h4dTVrWi9VbXExNmlYWlBweHJ6?=
 =?utf-8?B?V1I2bHJ6a3FWVHl6UE41Y0JsYTBXVFV1Y0tYQ05oWFM2bmxVMDQ3VTRxa29w?=
 =?utf-8?B?eTdpSGc0TjI4WjkwV2ttU0hUSzg4QzR1YnE2SitJcDFYM1FqZ2RVMGRoNUlB?=
 =?utf-8?B?Vy9ZT1lldVV0bTN2cjRjMkt5U2F2WklmbTk3d3M5V2VkYnBhTy84QUFpUjZB?=
 =?utf-8?B?U1U2VHFiams3c2tFZDM2Vk13VExqRVEzVmVoTVFoeElaMVFEL0xNdm1TbStK?=
 =?utf-8?B?a3UxdGc2UEVKZG1RTWZzTk9WNVBFVTZySmhpYlN4Y1ZUWFBudWRlcGtmeWN2?=
 =?utf-8?B?R0hLNGI5TjJNVElndVlDeHA2ek5pbVQvVUh0K0EyWjFQREFOZlJWVXdhY2NQ?=
 =?utf-8?B?eWZGMElGQTQ1VWJkZjJCdjlvdDZjT1lNSkhFRzRRNytUMm9Jc1pNL0k1T1NS?=
 =?utf-8?B?YjcwREFNMVEvZVh3akdtMndCN2l6WkIvYm5qdVp3MHZKYzRNYlVLYitKamN1?=
 =?utf-8?B?Z1NHeE9PWTFROUhmblh4L1NqaFUrQW5NdnZ6VVR6bDN6RE1FRCtqa24zUmp1?=
 =?utf-8?B?RHhoMGZUVWY2dW5jblh4SHZSaTc0YUNGTGRrWFZrMTRRRS9mMEZ6U2F6bmxM?=
 =?utf-8?B?NmRvWmkwU2lBbzdXMFkxQ1M2TG9YUzlsWHgwLy92clNUeXhHQTJVMUxaRjh1?=
 =?utf-8?B?QnN5dDlZTktYZHI4RHJWQnJEdXZRazhLaHB3VDJic010M1hkY0Fqd3hZZ1Er?=
 =?utf-8?B?eHlpVUxjbmdzVGl0bEJzV3VaRXUrU3FJZlp4UXl5OE5BL2diVkx4Nnlmdytu?=
 =?utf-8?B?bG50dzBjWkFYZTRJYXk0Q3B5cnNOZ2QydjkxNG1JZ0F1cW1yaHF4VGVnbVpG?=
 =?utf-8?B?cWFTUGlpTU1jSkxGYmJieU9PZm5BaW9yRitMOTB0L2xmRk9PVStPRFUrN0dv?=
 =?utf-8?B?VG9NWXdBYk95YVZmVVJScmNGcDZJaHQ3dVdRQ1p0WUVHODZ3Z2lFb09aQmp6?=
 =?utf-8?B?QzZLdHd4eG5EbHJhU1RnNG9xSU9IanJ2ZHdkN1hoZGVwbnpXY1IxRFpFQ05h?=
 =?utf-8?B?SkJZMm0yWUtKa2dOeWI1VGxXUnRxSnBGNTlQRXY3YnB4OW9CZ01RenRldGVy?=
 =?utf-8?B?ZVk3T01kWWFZZ1VhTGNtb2RhVTFERFM3emEzOWFQR0lWUWExb3BLOENqQytt?=
 =?utf-8?B?Y0pUVGRWeXViVXkxa2JGTkl0cWEySmVkcS9USGF1OXp4aVNualJObGVkS2VT?=
 =?utf-8?B?SUd0aEJEUklxL3REUzRDbzBGeGJ4dnE3ZFRZdGo5bU80RWpTSlVKTnhSOFhK?=
 =?utf-8?Q?IuCiveqlVg4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2dwc3g0QWF0S3BmcW9FY3JRS211M2s5a09zQnZiVTgzeEtZUCt2RWRmNDJw?=
 =?utf-8?B?emtmaGxSeEN3MmpjbmlhcnVobVVEeHhBUzljaDlTRDhuWmhRV2o3L0tSdk9K?=
 =?utf-8?B?VmFTVE9COFpTV05vSWozL3ZoLzB2ajd2KzJlSWl2eFdwd0NyWVFsbTZSZlow?=
 =?utf-8?B?cXNtRzk0WW9vc2VLOVFvWnB1UUxWaklwR2hrV3dnUHBxeUE5UGJNbEpZWXpr?=
 =?utf-8?B?VzhXRGZzSTQ0VHkzUDN6VkpRdU9MdTRkUTloajlkMVBST3cwVkZ4aUIrV09r?=
 =?utf-8?B?ajZwc1lwRWI1RHYyY0w3aGpKWW9tWkxJTWExQitEOE51bklBcFNuOWRmclpQ?=
 =?utf-8?B?TDJINGs2UElGbGR0OTNKMU1QNlU3T3ZjMFNxUXBFUWlYcjJSNWM2cTBDZ3Bn?=
 =?utf-8?B?TU5YSHQzS3BHRWNKSGI4WFllRkc2UlpsOWZveGsrSm9mSDJpRFl3Rm5sVFM2?=
 =?utf-8?B?bVo3Y0YyNUllc2RqTDZQdjY2bjI2UEhEQnI5aFZUdXJJaGJBdk03anlzajJU?=
 =?utf-8?B?MVArakk2NXVEOE5tWGF4SExNUGlqQ1ZOMkd0VVZOckJGUzBBUzFrN2hQT09h?=
 =?utf-8?B?OWkzSi83WVM0VEU3Yko5cUV0dVoxQmhSQnVuUG56ZzZIclN0M0hlQjdMRWp3?=
 =?utf-8?B?TExsek9td2hkeStXSTVrRnZCUEgrY2hNaDU0UTloUkl3UTY0Qy9DOWQ0eUdi?=
 =?utf-8?B?amcrcGp1NE9LRytEUlBHWTNXNzZvOStUdk03VFV3c0orcWVkVXdtNy80VEE2?=
 =?utf-8?B?NU1iZjFyNjB5RVpuVWVsVHlvRHRTMXptTWM1b05nNVpjU3d1L1lIdllwZ0Ev?=
 =?utf-8?B?cU5wWlBQSVp4Y3JWL2kwSWh1aTVWQ3dVdTNIbUNibUo3RzB3MmpBRUFoM1JV?=
 =?utf-8?B?elJKL1hrT3VBZmJVWWRkZ3Z2b2JkVmNJcFlqM1Y1MG1EeW4wZDJyMFhpZW14?=
 =?utf-8?B?RWlUNGNWdFU5TDYwamZCbWdXanNacldMZmxEMmF6Lzg5SEp5MFRuSVp4L2Rm?=
 =?utf-8?B?SHFiNFNrUkVFeEdESGFlTmhoMHlaTVhUMkxhZy9PMEJ0dUI3blRidnpBOXFE?=
 =?utf-8?B?TUgyZ0k5eEREdXlva1hlcXNxU0JjdkdKdXNieGp6MmFZZEFPREFoaS94YVc0?=
 =?utf-8?B?Zis0YTBSejEzR2d6Njduenh3ZjlIdVk4ZHdmTHNoK0pRTzk4WnZLSDR0dUpw?=
 =?utf-8?B?K1NxMGZBZjdOZVg1UmpMeTl5N1dVd1MwejFyVzFhTWU5UGhIKzJqbzF6enVk?=
 =?utf-8?B?RUhvUjJyeGxMTXJ6NVVObnlrRzA1bEoyU2RGVmNib2IyNy8vUlZyeEJLTFRu?=
 =?utf-8?B?YnI0K1JFa1Y0UzJLWFVMNExsWlBGNk1FRmpMU2xoRmpsYTFlWXF2UlEvODkx?=
 =?utf-8?B?NGVueS9VNndhNnkyNDM0UlRSd21KN1BodmhBV3JrNkNhUTdlbWN6aW9TK2Na?=
 =?utf-8?B?djNQcjc4OWpMQndlSE5pLzl6Tm5CYytZbStoZUdkaTJ3NDQ2VnYxdHB4c3JV?=
 =?utf-8?B?MjZ1QkNBYUlRQ3M1TGZFZ2R2UzEwZUFoQzJvbkVBaE91UVZrQkE0SVJmQU9U?=
 =?utf-8?B?R3dML1ZQT3JZTFhKeTRhU1kwUW1WTnM0QWdFWTNCcExGSFJmKzc3bjdSTm9l?=
 =?utf-8?B?WVh0VzBKd1NXZ3JRcitPZmhsekt3ZnZCU3VVd3Y4ZTFIYjhkK0RGUEVmNkRZ?=
 =?utf-8?B?V2pxMjBZUWNzZWZLNkx3VGNFbEVBbWxnRXRQemx1UzVsbnBZekVtbFFDTVdV?=
 =?utf-8?B?MXZYbU13Vml5WVk5cENrbUJ6V0xJcDRqV2RXM29jM3lGQzRQVGVZR3liMkN3?=
 =?utf-8?B?YWxSRm84TFJqSVFoa3Bhc0pNZUxrK3QwQXdXeCsrbE1zOW9sUEgxZ3BnWVpH?=
 =?utf-8?B?Q1F1WjEvVDNRV1dLL0U4OUl5VHVUNk1sbVE0QXlOei84UXpuSzdLdWUwNE5v?=
 =?utf-8?B?MlVUNzY1NW45Q2ZueEE3Mzd2Vys3S0NqVXViOFovKzREemZuODR4YWN4Vit1?=
 =?utf-8?B?R0hsZnlSeGdXai9sZmh6ZVhyOUtrVkR6NGl5dGRkcCtsaXBrMGdFVE9WM295?=
 =?utf-8?B?QnBqUWlvSjdaaUNDMnU1bG1HTm1zbzFzc2dDRFRyODZ6dDFpeE5MaC9qUFdQ?=
 =?utf-8?Q?SqB0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f7b40f-4d3d-4af3-c63d-08ddaf60fd07
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 18:42:05.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUCqHcAPxB3eMkYzCp/hmBN25u6lZXD/M+NcniuN8GGkDrAS2RDSC9RFEWZNFFAU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7108

Hi Reinette,

On 6/17/25 22:59, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/11/25 2:23 PM, Babu Moger wrote:
>> The io_alloc feature in resctrl is a mechanism that enables direct
> 
> "The ... feature ... is a mechanism"? What does it mean when a feature
> is a mechanism? How about just "The io_alloc feature in resctrl enables ..."?

Sure.

> 
>> insertion of data from I/O devices into the L3 cache.
> 
> Drop "L3"?
> 

Sure.

>>
>> On AMD systems, io_alloc feature is backed by SDCIAE (L3 Smart Data Cache
>> Injection Allocation Enforcement). When enabled, SDCIAE forces all SDCI
>> lines to be placed into the L3 cache partitions identified by the
>> highest-supported L3_MASK_n register as reported by CPUID
>> Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15, SDCI lines will
>> be allocated into the L3 cache partitions determined by the bitmask in
>> the L3_MASK_15 register.
> 
> This is a resctrl fs patch but most of changelog so far is about AMD's implementation
> details. I do think it is relevant, but all the register details can
> probably be dropped since it is too low level to support the goal. I believe the
> goal here is to motivate resctrl fs's implementation that needs to pick highest
> CLOSID. So, essentially the changelog needs to hightlight that AMD's implementation
> requires highest CLOSID and without any other reference that is what resctrl fs's
> implementation supports. I think it is important to highlight that the
> user interface is not tied to this implementation decision to avoid future issues
> if another architecture support "io_alloc" "differently". Internals of
> resctrl fs can then be changed.
> 

Sure. Will split these patches. Will try make the text more generic.

>>
>> When CDP is enabled, io_alloc routes I/O traffic using the highest CLOSID
>> allocated for the instruction cache (L3CODE).
> 
> Again, this is a resctrl fs patch and above is an AMD implementation detail. resctrl
> fs should not be limited by how AMD implements the feature but can use it as first
> reference.

Sure.

> 
>>
>> Introduce user interface to enable/disable "io_alloc" feature.
> 
> This patch does more than this.

Sure.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  Documentation/filesystems/resctrl.rst |  34 ++++
>>  fs/resctrl/rdtgroup.c                 | 216 +++++++++++++++++++++++++-
> 
> This patch contains several logical changes that are not adequately described
> in changelog.
> I think the following can be separate patches:
> - rdt_bit_usage_show() change
> - io_alloc_init() definition and usage
> - show() and write() helpers
> - possibly the io_alloc_closid helpers (more later)

Yes. Splitting this into 3 patches.
1. rdt_bit_usage_show() change
   Updates shareable_bits section.
   It calls - resctrl_io_alloc_closid().

2. io_alloc_init() definition and usage
  Introdce the inteface and add show()

3. Add io_alloc write().
   Calls resctrl_io_alloc_closid_supported() and
resctrl_io_alloc_closid_get().


> 
>>  2 files changed, 248 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index c7949dd44f2f..03c829b2c276 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -95,6 +95,11 @@ related to allocation:
>>  		some platforms support devices that have their
>>  		own settings for cache use which can over-ride
>>  		these bits.
>> +
>> +		When the "io_alloc" feature is enabled, a portion of the cache
>> +		is reserved for shared use between hardware and software. Refer
> 
> "reserved" and "shared" sounds like a contradiction. How about "is reserved" ->
> "can be configured"?
> 
>> +		to "bit_usage" to see which portion is allocated for this purpose.
> 
> This is the "shareable_bits" section and the reason why user is pointed to
> "bit_usage" is because "shareable_bits" is a global CBM that applies to all
> cache domains/instances while "bit_usage" is per cache domain/instance. I think
> it will be helpful to point this out to the user.
> Perhaps second sentence can be replaced with something like:
> ""bit_usage" should be used to see which portions of each cache instance
>  is configured for hardware use via the "io_alloc" feature because every cache
>  instance can have its "io_alloc" bitmask configured independently".

Sure.

""bit_usage" should be used to see which portions of each cache
instance is configured for hardware use via the "io_alloc" feature
because every cache instance can have its "io_alloc" bitmask
configured independently.


> 
> Please do improve this.
> 
> To complete this the first part of the "shareable_bits" doc can be amended:
> "Bitmask of shareable resource" -> "Bitmask (applicable to all instances of this resource) of shareable resource"
> What do you think?

Sure. Added one sentance for that.

Bitmask of shareable resource with other executing entities
(e.g. I/O). Applies to all instances of this resource.



> 
>> +
>>  "bit_usage":
>>  		Annotated capacity bitmasks showing how all
>>  		instances of the resource are used. The legend is:
>> @@ -135,6 +140,35 @@ related to allocation:
>>  			"1":
>>  			      Non-contiguous 1s value in CBM is supported.
>>  
>> +"io_alloc":
>> +		The "io_alloc" enables system software to configure the portion
> 
> "The "io_alloc" enables"? Maybe just ""io_alloc" enables"?
> 
>> +		of the L3 cache allocated for I/O traffic.
> 
> Drop "L3"?
> 
> Can append, for example, "File may only exist if the system supports this feature on some of its cache
> resources".
> 
>> +
>> +		The feature routes the I/O traffic via specific CLOSID reserved
>> +		for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
>> +		for the CLOSID, users can control the L3 portions available for
>> +		I/0 traffic. The reserved CLOSID will be excluded for group creation.
> 
> Looking back I've commented *four* times already about how resctrl fs user interface
> should not be made specific to AMD's implementation.
> This paragraph just be dropped?
> 
> 
> The rest can be something like:
> 
> 		"disabled": Portions of cache used for allocation of I/O traffic cannot be configured.
> 		"enabled": Portions of cache used for allocation of I/O traffic can be configured using "io_alloc_cbm"
> 		"not supported": ...
> 
> 		The underlying implementation may reduce resources available to
> 		general (CPU) cache allocation. See architecture specific notes below.
> 		Depending on usage requirements the feature can be enabled or disabled:
> 
> 		To enable:
> 			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
> 
> 		To disable:
> 			# echo 0 > /sys/fs/resctrl/info/L3/io_alloc

Sure.

> 
>> +
>> +		The interface provides a means to query the status of the feature.
>> +
>> +		Example::
>> +
>> +			# cat /sys/fs/resctrl/info/L3/io_alloc
>> +			disabled
>> +
>> +		Feature can be enabled/disabled by writing to the interface.
>> +		Example::
>> +
>> +			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
>> +			# cat /sys/fs/resctrl/info/L3/io_alloc
>> +			enabled
>> +
>> +		On AMD systems, the io_alloc feature is supported by the L3 Smart
>> +		Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
>> +		io_alloc is determined by the highest CLOSID supported by the resource.
>> +		When CDP is enabled, io_alloc routes I/O traffic using the highest
>> +		CLOSID allocated for the instruction cache (L3CODE).
>> +
>>  Memory bandwidth(MB) subdirectory contains the following files
>>  with respect to allocation:
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 1beb124e25f6..bbc032b4d0e9 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -70,6 +70,7 @@ static struct seq_buf last_cmd_status;
>>  static char last_cmd_status_buf[512];
>>  
>>  static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
>> +static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
>>  
>>  static void rdtgroup_destroy_root(void);
>>  
>> @@ -232,6 +233,19 @@ bool closid_allocated(unsigned int closid)
>>  	return !test_bit(closid, closid_free_map);
>>  }
>>  
>> +static int resctrl_io_alloc_closid_alloc(u32 io_alloc_closid)
>> +{
>> +	if (__test_and_clear_bit(io_alloc_closid, closid_free_map))
>> +		return io_alloc_closid;
>> +	else
>> +		return -ENOSPC;
>> +}
>> +
>> +static void resctrl_io_alloc_closid_free(u32 io_alloc_closid)
>> +{
>> +	closid_free(io_alloc_closid);
>> +}
>> +
>>  /**
>>   * rdtgroup_mode_by_closid - Return mode of resource group with closid
>>   * @closid: closid if the resource group
>> @@ -1030,6 +1044,29 @@ static int rdt_shareable_bits_show(struct kernfs_open_file *of,
>>  	return 0;
>>  }
>>  
>> +/*
>> + * resctrl_io_alloc_closid_get - io_alloc feature uses max CLOSID to route
>> + * the IO traffic. Get the max CLOSID and verify if the CLOSID is available.
> 
> The function name should be followed by a *brief* description.

Sure.

> 
>> + *
>> + * The total number of CLOSIDs is determined in closid_init(),  based on the
>> + * minimum supported across all resources. If CDP (Code Data Prioritization)
>> + * is enabled, the number of CLOSIDs is halved. The final value is returned
>> + * by closids_supported(). Make sure this value aligns with the maximum
>> + * CLOSID supported by the respective resource.
> 
> All but the last sentence is unrelated to this function and the last sentence
> is very vague. What is "this value" that it refers to?

Removed it.

> 
>> + */
>> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
>> +{
>> +	int num_closids = closids_supported();
>> +
>> +	if (resctrl_arch_get_cdp_enabled(r->rid))
>> +		num_closids *= 2;
>> +
>> +	if (num_closids != resctrl_arch_get_num_closid(r))
>> +		return -ENOSPC;
>> +
>> +	return closids_supported() - 1;
>> +}
> 
> resctrl_io_alloc_closid_get() seems to be trying to do two things: 
> - determine what the io_alloc_closid is
> - make sure the io_alloc_closid is supported
> 
> I think this should be split into two functions. Once the
> io_alloc_closid is determined to be supported and io_alloc
> enabled then there is no reason to keep checking if it is
> supported whenever the io_alloc_closid is queried.
> 
> How about simplifying this to:
> 
> /*
>  * note how this returns u32 that will eliminate
>  * unnecessary error checking in usages where io_alloc_closid
>  * needs to be determined after an resctrl_arch_get_io_alloc_enabled(r)
>  * already confirmed io_alloc is enabled
>  * function comment could note that this returns the CLOSID
>  * required by io_alloc but not whether the CLOSID can
>  * be supported, for this resctrl_io_alloc_closid_supported() should
>  * be used.
>  * Can also note that returned value will always be valid if
>  * resctrl_arch_get_io_alloc_enabled(r) is true.
>  */
> u32 resctrl_io_alloc_closid(struct rdt_resource *r) {
> 	if (resctrl_arch_get_cdp_enabled(r->rid))
> 		return resctrl_arch_get_num_closid(r)/2  - 1
> 	else
> 		return resctrl_arch_get_num_closid(r) -1
> }
> 
> /*
>  * note how below already makes resctrl's io_alloc implementation
>  * more generic
>  */
> resctrl_io_alloc_closid_supported(u32 io_alloc_closid) {
> 	return io_alloc_closid <  closids_supported()
> }
> 

Sure.
   Changed the check to

    return io_alloc_closid == (closids_supported() -1)

> 
> 
>> +
>>  /*
>>   * rdt_bit_usage_show - Display current usage of resources
>>   *
>> @@ -1058,20 +1095,23 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
>>  	struct rdt_ctrl_domain *dom;
>>  	int i, hwb, swb, excl, psl;
>>  	enum rdtgrp_mode mode;
>> +	int io_alloc_closid;
>>  	bool sep = false;
>>  	u32 ctrl_val;
>>  
>>  	cpus_read_lock();
>>  	mutex_lock(&rdtgroup_mutex);
>> -	hw_shareable = r->cache.shareable_bits;
>>  	list_for_each_entry(dom, &r->ctrl_domains, hdr.list) {
>>  		if (sep)
>>  			seq_putc(seq, ';');
>> +		hw_shareable = r->cache.shareable_bits;
>>  		sw_shareable = 0;
>>  		exclusive = 0;
>>  		seq_printf(seq, "%d=", dom->hdr.id);
>>  		for (i = 0; i < closids_supported(); i++) {
>> -			if (!closid_allocated(i))
>> +			if (!closid_allocated(i) ||
>> +			    (resctrl_arch_get_io_alloc_enabled(r) &&
>> +			     i == resctrl_io_alloc_closid_get(r)))
>>  				continue;
>>  			ctrl_val = resctrl_arch_get_config(r, dom, i,
>>  							   s->conf_type);
>> @@ -1099,6 +1139,24 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
>>  				break;
>>  			}
>>  		}
>> +
>> +		/*
>> +		 * When the "io_alloc" feature is enabled, a portion of the
>> +		 * cache is reserved for shared use between hardware and software.
>> +		 */
>> +		if (resctrl_arch_get_io_alloc_enabled(r)) {
>> +			io_alloc_closid = resctrl_io_alloc_closid_get(r);
> 
> In this implementation io_alloc_closid can be negative and the static
> checker I used complained about the subsequent usage in 
> resctrl_arch_get_config() that must be unsigned.
> Since resctrl_arch_get_io_alloc_enabled(r) already passed this is one
> example where resctrl_io_alloc_closid() can be used.

Sure.

> 
>> +			if (resctrl_arch_get_cdp_enabled(r->rid))
>> +				ctrl_val = resctrl_arch_get_config(r, dom,
>> +								   io_alloc_closid,
>> +								   CDP_CODE);
>> +			else
>> +				ctrl_val = resctrl_arch_get_config(r, dom,
>> +								   io_alloc_closid,
>> +								   CDP_NONE);
>> +			hw_shareable |= ctrl_val;
>> +		}
>> +
>>  		for (i = r->cache.cbm_len - 1; i >= 0; i--) {
>>  			pseudo_locked = dom->plr ? dom->plr->cbm : 0;
>>  			hwb = test_bit(i, &hw_shareable);
>> @@ -1803,6 +1861,142 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>  	return ret ?: nbytes;
>>  }
>>  
>> +static int resctrl_io_alloc_show(struct kernfs_open_file *of,
>> +				 struct seq_file *seq, void *v)
>> +{
>> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_resource *r = s->res;
>> +
> 
> Needs rdtgroup_mutex

Sure.

> 
>> +	if (r->cache.io_alloc_capable) {
>> +		if (resctrl_arch_get_io_alloc_enabled(r))
>> +			seq_puts(seq, "enabled\n");
>> +		else
>> +			seq_puts(seq, "disabled\n");
>> +	} else {
>> +		seq_puts(seq, "not supported\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Initialize io_alloc CLOSID cache resource with default CBM values.
> 
> It is unclear what "default" means.
> Could be "Initialize io_alloc CLOSID cache resource CBM with all usable (shared and unused) cache portions".

Sure.

> 
>> + */
>> +static int resctrl_io_alloc_init_cat(struct rdt_resource *r,
>> +				     struct resctrl_schema *s, u32 closid)
>> +{
>> +	int ret;
>> +
>> +	rdt_staged_configs_clear();
>> +
>> +	ret = rdtgroup_init_cat(s, closid);
>> +	if (ret < 0)
>> +		goto out_init_cat;
> 
> The "out" label should reflect what is done at target, not the source.
> Consider all the usages of "out_unlock" in resctrl.
> Since this is the only label it can just be "out".

Sure.

> 
>> +
>> +	ret = resctrl_arch_update_domains(r, closid);
>> +
>> +out_init_cat:
>> +	rdt_staged_configs_clear();
>> +	return ret;
>> +}
>> +
>> +static const char *rdtgroup_name_by_closid(int closid)
>> +{
>> +	struct rdtgroup *rdtgrp;
>> +
>> +	list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
>> +		if (rdtgrp->closid == closid)
>> +			return rdt_kn_name(rdtgrp->kn);
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/*
>> + * When CDP is enabled, io_alloc directs traffic using the highest CLOSID
>> + * linked to an L3CODE resource. Although CBMs can be accessed through
>> + * either L3CODE or L3DATA resources, any updates to the schemata must
>> + * always be performed on L3CODE.
>> + */
> 
> I think that updates to the schemata needs to be made on *both* L3DATA and L3CODE.
> Consider how __init_one_rdt_domain() works when a new resource group is created ...
> the algorithm looks through all allocated CLOSID and the associated schemata impact
> the CBM of the new group. If an allocated CLOSID is associated with L3CODE
> then its "peer" L3DATA is also taken into account, similar for L3DATA.
> If only L3CODE is updated for the io_alloc_closid then it looks to me that
> whatever the original L3DATA schema was will keep impacting new resource
> groups. To avoid that and ensure only accurate CBMs are used it looks to me
> as though the L3DATA and L3CODE schema needs to be kept in sync.

Sure. Will verify this.

> 
>> +static struct resctrl_schema *resctrl_schema_io_alloc(struct resctrl_schema *s)
>> +{
>> +	struct resctrl_schema *schema;
>> +
>> +	if (s->conf_type == CDP_DATA) {
>> +		list_for_each_entry(schema, &resctrl_schema_all, list) {
>> +			if (schema->conf_type == CDP_CODE)
>> +				return schema;
>> +		}
>> +	}
>> +
>> +	return s;
>> +}
>> +
>> +static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
>> +				      size_t nbytes, loff_t off)
>> +{
>> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_resource *r = s->res;
>> +	char const *grp_name;
>> +	u32 io_alloc_closid;
>> +	bool enable;
>> +	int ret;
>> +
>> +	ret = kstrtobool(buf, &enable);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!r->cache.io_alloc_capable) {
>> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
> 
> This could be more useful with a small change:
> "io_alloc is not supported on %s\n", s->name

Yes.

> 
>> +		ret = -ENODEV;
>> +		goto out_io_alloc;
> 
> out_io_alloc -> out_unlock

Sure.

> 
>> +	}
>> +
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
>> +	if (io_alloc_closid < 0) {
>> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
> 
> This could be more useful to help debug by printing the value of io_alloc_closid
> that user can compare against output of num_closids files. Here the terms become
> a bit complicated since ideally we want to use ctrl_hw_id but that does not match
> "num_closids", so perhaps use both terms, for example "CLOSID (ctrl_hw_id)"?
> I am not sure here.

Fine with me.

> 
>> +		ret = -EINVAL;
>> +		goto out_io_alloc;
>> +	}
>> +
>> +	if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
>> +		if (enable) {
>> +			ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
>> +			if (ret < 0) {
>> +				grp_name = rdtgroup_name_by_closid(io_alloc_closid);
> 
> Below handles !grp_name but that would be a kernel bug, no? Maybe WARN_ON_ONCE()?

Sure.

> 
>> +				rdt_last_cmd_printf("CLOSID for io_alloc is used by %s group\n",
>> +						    grp_name ? grp_name : "another");
> 
> 
> CLOSID -> ctrl_hw_id
> 
sure.

>> +				ret = -EINVAL;
>> +				goto out_io_alloc;
>> +			}
>> +
>> +			ret = resctrl_io_alloc_init_cat(r, resctrl_schema_io_alloc(s),
>> +							io_alloc_closid);
>> +			if (ret) {
>> +				rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
>> +				resctrl_io_alloc_closid_free(io_alloc_closid);
>> +				goto out_io_alloc;
>> +			}
>> +
>> +		} else {
>> +			resctrl_io_alloc_closid_free(io_alloc_closid);
>> +		}
>> +
>> +		ret = resctrl_arch_io_alloc_enable(r, enable);
>> +	}
>> +
>> +out_io_alloc:
> 
> out_unlock ... to match the other places in resctrl.

Sure.

> 
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -1955,6 +2149,13 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= rdtgroup_schemata_show,
>>  		.fflags		= RFTYPE_CTRL_BASE,
>>  	},
>> +	{
>> +		.name           = "io_alloc",
>> +		.mode           = 0644,
>> +		.kf_ops         = &rdtgroup_kf_single_ops,
>> +		.seq_show       = resctrl_io_alloc_show,
>> +		.write          = resctrl_io_alloc_write,
>> +	},
> 
> Please match existing code wrt tab usage.

Sure.

> 
>>  	{
>>  		.name		= "mba_MBps_event",
>>  		.mode		= 0644,
>> @@ -2062,6 +2263,15 @@ static void thread_throttle_mode_init(void)
>>  				 RFTYPE_CTRL_INFO | RFTYPE_RES_MB);
>>  }
>>  
>> +static void io_alloc_init(void)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +
>> +	if (r->cache.io_alloc_capable)
>> +		resctrl_file_fflags_init("io_alloc",
>> +					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>> +}
> 
> Note that even if it only checks the L3 cache resource, this will make the
> file visible to all cache resource, also L2. This is why it is important to
> ensure documentation and implementation also accommodates resources that
> do not support io_alloc.

Agree.
> 
>> +
>>  void resctrl_file_fflags_init(const char *config, unsigned long fflags)
>>  {
>>  	struct rftype *rft;
>> @@ -4249,6 +4459,8 @@ int resctrl_init(void)
>>  
>>  	thread_throttle_mode_init();
>>  
>> +	io_alloc_init();
>> +
>>  	ret = resctrl_mon_resource_init();
>>  	if (ret)
>>  		return ret;
> 
> Reinette
> 

-- 
Thanks
Babu Moger
