Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8923C8DA;
	Fri,  7 Feb 2025 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949445; cv=fail; b=tf9IWFUM1HKkh5Mna9P9wXRIMGtRtskD2wbCO4d522/IjkFRr+uHALFzgRljsVFDF+rHGBKxY8wb7i8b79xSYC+U29IR2ND/KLePXu6CE+vCMi47kYQS6czpXjC/U3pmwrOQ3WWVWwgYmM21q/wEPyl1i7jiDCh7KPOC8DdKyAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949445; c=relaxed/simple;
	bh=cEO3uxAJYEBanUbtMyiR3aP8xwC75fDn6xKZWR2c2vs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rbjgbk/zi9lk6fZ+27vd40Y6Fy6GYvIGEw36zvn2m8krmq7esuGVtLpnX/qOx+pmTiSIlnjCSmmzHZAop6IVrW/qaygHQOeIEyI/Ou5lbxyskjfo5IUIfTMdRRda0DHR7B6XmUXB9WmKB+APclA2ZOEJUuP3k52KgXZWlJqFmbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XIcwzDSc; arc=fail smtp.client-ip=40.107.94.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XIcwzDSc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxDqdOrG7mUhyHeUg3454+RFJK1B6r/jfkVMZLEIo5V1sPEZzC67kt5gUTe9h8nIZW6sU159pK8RDrUttQVpMumjUd3RH1D+4iqgASaCIJVGzprsNRJdlZCrFKV+KHz9Wcg/G849M9pXdRg/440ZMOllYVkt6q7h89B+ZWf0Bb8bdXVdmn5wn7oaHvH6Eb4h5qsC5HneERYzVh1hMgUAqX6j0MuU2OaZf9QGNy1mp16JFQU953a1ZpkgE16R0M6QHa4cKJ8Rs/RBM8pwY+L69asIKL/JtkjZf3ctKiIjtwcqGx4Y0sp5+djsWvhlaxPbfXeKiSEFjjHqkYORYZSfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD4wEPsIapKz1R9Eyr218ZZ6Qok/99FmZHMZ1zIGCLU=;
 b=i3iCEEHp3Nr3ywHyncVEZ8yp6aRr6F8pLicP5btuddOCVOpRZfIt34dur9oW9UPDeGWD6gDSuTP9xqMGX51kVUzqW1SSZRJt5D2qoUVeLbPWF5O5YByz96rXLZ/jTb+39/HQ+GANos4tZe4gikLjXxs5S5bu5Ssl88uCfYs/ebHstnwq/FLAobU4VZTbJ6dZS5ODTFLpSWkgOSGum5UexhzfMM0Y0M//dCUcD6yAEcN3BS1TzdXz090OI4UmMzVzPk5zvM3dbOiBN0M8JAO+N0TgG5hjLTjbpfjC6lKssBKT3J1jDgapK0rliW8AH1+iAMpp5G2aWfiwyxDz3Oj8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD4wEPsIapKz1R9Eyr218ZZ6Qok/99FmZHMZ1zIGCLU=;
 b=XIcwzDScb5mXQwEtLq21YdJLJfluEANfb5AcEI8UAOl8Cm6h0q7SNV0w1FlMA6Hnqnr5z1SCJDkQpNpZpksAzHlC+X7pOW3Re5RZK7hlgWq3ssacYnS3VxzT/bAitjvnRDgGK8qB6Ul6vJL4FflGgBQ0zHwsi5fxLLPN7gVwMs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 17:30:36 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 17:30:36 +0000
Message-ID: <119e3ad5-afe1-43e5-8784-dd8f9e387545@amd.com>
Date: Fri, 7 Feb 2025 11:30:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
 <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:806:20::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: c0341209-bdbe-47c5-14dd-08dd479d21f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDlHR2RVUDQ3TFp3SGc0NXpsS1JOdFBBV25KVGxSY2U0a211NXFhMkV1ZUV0?=
 =?utf-8?B?UHgzNXJRS1Fla1dDRFA2SnkwL0tQNzhpZGFmK09GZi83TXF6aXgzY0kra09a?=
 =?utf-8?B?YW5zVENJZ0RMQVp4U054elFyQm9hVlN0Q3hMY1ZVMGFpa2tLa2RzM05COVFq?=
 =?utf-8?B?K2g1blVNell3NkY1N3FuQjZ3THJSWGxjOFJhdVU3S21FcFcvTHJHT0wzM1Vq?=
 =?utf-8?B?Q01zcGRSdXRrSGNsVUltUzI5UFN0Qi9KYUFLTmZzdlFoMW5PYkhQREYyMDkz?=
 =?utf-8?B?bUdSdm1aVUNyeU9oVEZNRWMwWGtjbmN5QzkxMG9Ha05aWk13bC9hSFhaWnJI?=
 =?utf-8?B?ZGpjM1dDOU5nRkZMSzVoMEpwcG1jcFB0eWRZQkJEcmN3b0VqamJmOFhXZ2RJ?=
 =?utf-8?B?QmRNTHRLa3NIVzJMT2dpaFQwVHVObU5RSklWbjdjVVhoZWFBMTdhcCtXWjVi?=
 =?utf-8?B?WW95dmY0TnVQejVhMHRxVWVzcnBDR2N0anRLZ2hQNTNoRVZLSXVJSnFLYWVy?=
 =?utf-8?B?YktGdWZwRHBSa2lOcnhJUTUvTngwOGVUaVVXakdKczFMMDRGK2gralliUDE5?=
 =?utf-8?B?ZFhOVzJBTVNTZzIzNjVzcE1Hbnd1MFlBNTBud0ZmUjBrT0U0c09JLzhLb2tD?=
 =?utf-8?B?WGEwSC9CbUpkdnF6Y1JmcFRJcFptc1pXWWxGSnhHelJYMUZGa2lZYnk2b0VF?=
 =?utf-8?B?a0R2d1hLRFViU3E4b3l0TWpFb0t2ZGRVVXk3aXlsQ1pxRWpPKzZidG5IeFI2?=
 =?utf-8?B?cWh4RFF0RzNhUUt1VnRjQW5qc25LYTFBa2J5aFRrY2tGMGFKWVhaQWZEa1Vr?=
 =?utf-8?B?UWNmUWFWbjVrbnUyM0pHWG12MjIwRFUwTHJOQzdtS0I0bEtUa1R5d2hWSDZu?=
 =?utf-8?B?L3MrM1l4S2FiRHVjZUNqSzNjUDZwYnMzaTJsY0d4Vm10d3NvbVF4WlF5OHBM?=
 =?utf-8?B?OHpzS2xJODhDYllnQzBlMytLaTB0OEVhVEFzcXZqb1UyMmt1aXNTT2JsRUVm?=
 =?utf-8?B?cFdKVFA4OWRyZmpVR1UyaFBCRHN1b2pEWFhQVUFvUDRqQ2NJM0diUXordVZN?=
 =?utf-8?B?ckhDZEJZaW1pNklib3VUaVVnOVBjSGZhY1VpR28zUTUvdTEzNXQwa3grcE40?=
 =?utf-8?B?eUZEbDJKYzJEVHMwSEZIMGpUSWxWS3VtMHpqaS9GY0JxQXZSMVBzWlMrV1pX?=
 =?utf-8?B?YlVYZGxCMDFTczFKd3BZUmdLbnNxRVBHeGtLUUdjN1diVlFnaUdQdG1sMnc2?=
 =?utf-8?B?bDJ4VGFHMUNmUzAxUk5mL0hXRWJKaW1CUW5NSHV2dTNCdWZ6Y1FRVlBTNjhK?=
 =?utf-8?B?MGFRYktTRU1KTTdEL04wKy9GcG14N3Q3QndIcTdBWW1wYWdlUmdTQ2E4ZDlh?=
 =?utf-8?B?R0tjZ3Nubjc0YWJUV1NlMEg1NFFjeU1GLy9IS284SytlSURrV3d0OEVHby93?=
 =?utf-8?B?VlBKS2o5UVZlMTRzbG5lTHphT082cEZLbGhjZElleW1wSGhaaGl6OEtxMWpL?=
 =?utf-8?B?ZlgrMFE2a2hqc3ZWRVc0WlBoWFlGMWJObnNCanNEWmNRRkE1UHFHUkM3UWYr?=
 =?utf-8?B?Sll6eVpOSHVIdTdGU2o5blJ4Vi9VdDVNTzNzVGtIUXI1NlNRVXVSeURiUDR6?=
 =?utf-8?B?K0tuNnpYQXRpVTNSaCt6aUhMUk5JNXYzYk83WTM1NXVoQjZMSGZ1L0p6UlJq?=
 =?utf-8?B?aDFpRG1WMlhPYmt2VWpaNEkrKzJQdjd0NVZMQzRFNDhGdVd4NVBNK1luWjF4?=
 =?utf-8?B?K2ZHWjZlS214ejR6elpJa2lnTS93dkpJUjFqZExtL0NYUmt2VnVnTlBUK1lu?=
 =?utf-8?B?U3ZDNTVCYUY4STJYVlZyUDJLcHppTE9yemUwNWU5RG9PcEtiLzdEUThCY3p3?=
 =?utf-8?Q?7AJzanVHiXTcQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1INm1SbjlmTHllNXNLL0RqaG9ZaVIrQUxzL3M5dFBNM2dzTndaRDVuVE1I?=
 =?utf-8?B?TDdTVG0xeU43ZFBCd1NCL1VlSTIxRndxNUg5bVhjSDg1YTFTSWRqK0hNMTlo?=
 =?utf-8?B?NkRQRXM3MHhEbENGcDJiVUJwRlRoWERwNis1U1NhbWxGWjF6MzZaSHY2NndE?=
 =?utf-8?B?M1lCZC9XekJzTUtxajlHNnMrSlpMRmV6VEhpUTE4THRXWjVVV2FEUmJSbG9B?=
 =?utf-8?B?UFVKMTY3OEc2d3FCNHp3azJXSVBlV3JGMjh4UVBYc0UyeXAyU1JXMHRBVVB4?=
 =?utf-8?B?R29pR3JoYWJLMDhraXhLS1BxaWNlUThSYWNrMVV3WGgySzVCVXhMbFZ5Q0VR?=
 =?utf-8?B?MWN5VDNBcFdRZGtKaUYzRGpuRWd0QmkvTTBndWM3L2JMTEZIUFlKUUtUOGIz?=
 =?utf-8?B?dml6VzU2eTRaZnRiRFYvU3RSYWFzR1VRQ0QyYXRoTnI5VG9Kd1c3Mit4allS?=
 =?utf-8?B?ekFHZG1SL2tZZE9kM1B2YnF5Smo1ZmkrRDB5bEdRQ1EwelZKYXNwVkY5RVBj?=
 =?utf-8?B?V1E4TUZUYmd1ZE8wR3JMMWlNSkd6cGdUM1UvUE1QeEozYTB6U1FMcEg3aTlO?=
 =?utf-8?B?WFlSTldwVWxhT25Xcis1SjBpZ1dYNExDTWkxSmxIU2dSVGI1S29ZWEd5R3dM?=
 =?utf-8?B?NlJQZkVNNVlWb2Z0dlB5c3pvWFpSQ1RuZWFmYWJIN1NZQ3I0bGVKMmZwcDR1?=
 =?utf-8?B?a0EzdUw1UHhORVF4L1NyOVVzVzkwczYrT0doaGN0LzAwcFRreUFHcEZ2bFp4?=
 =?utf-8?B?NTBGdXlCN0IveGorckdLZXk3MEtpWGRVdGlsdzM2ck5sV3hDdDZFdkgxY2pU?=
 =?utf-8?B?eXZVUzVVT1ZEQ3FCN0o3TGRkR0N6cnBlTkVLTmxzSnE4YVJFRTFkWlplT0NC?=
 =?utf-8?B?WkdDM25FVXpYcklVSkJ0NTlzUytXc0FsSng5MHlJbmltTDFmZ1pNeTU0WmM1?=
 =?utf-8?B?VHI3eE5HSlZmbWNqVUJOKzk2QXp1Y3kxaVdUMW0wdERhQ2x5Q0Vrc2REUkk3?=
 =?utf-8?B?WVFFNXovUzJvclZsb2dqMHBoTEZCOW5rUWdOblpjL0hGU3ZXb0lvK3J5V0Yz?=
 =?utf-8?B?WVdKNW9wR1NBZDkxZjNONUxFbVhGN3djWkY3eG5OMCtWL3gyR1h2eldqdCts?=
 =?utf-8?B?bXhJMm9Oc0dQR0Z1M3hPN3c0aWhLQS9kYmFpY0h1MXh6MzRKMEJhdUFHbmMz?=
 =?utf-8?B?TzhCR2NsTmkrTk5CenJOVEVlVUFOcndGSVJIbjJob0dDVWNNZ283R0lDTlhM?=
 =?utf-8?B?WWJQL2Nra040TVlOVEViU3A0QWhGRHJnZG5CSDRUOUhHNEZEUDlYalFRRnZZ?=
 =?utf-8?B?THFwRGxHWjhIZGxqeWZWdWN2WmFNVU55b0dPc2RjYUtSREh4KzJDY0RDYUNo?=
 =?utf-8?B?TTYzL1I2ZHNDa2IxYzJlUDRKbmtnYXNlOGQ1Z1JtS3BWbW1yUHpKUDMrbXZK?=
 =?utf-8?B?cnZnN3M5N25VdmJ5NWdWYmhzMys0cnIrRjJ5KytoVGJNamw5Kzl4TG5SMXZG?=
 =?utf-8?B?Wk5sUWZRSktRQStKZzNpQWtQWlNDV2wvQThtOExHd0x5c3VXVHJNRmpzMEJs?=
 =?utf-8?B?OFhCYVp4cE1GaitJd3VpQ0d5Rm53VmRyNGdBaUNoZFFtZTV6ZldOMjZ6T3Rz?=
 =?utf-8?B?ZXZUMGJENlFFZzM1aGd0SmZTZGdHSkkxOGRBTytud0RvQWo0MTdaUis3OU41?=
 =?utf-8?B?UGM3NEJhbHlPTVVhUUp0TVYrbTZEWWw1TFBTdnpPNFNiU2Q0NkdxWHpXTEhK?=
 =?utf-8?B?c3Z2Tk5iemNQeXZlTC9jOHlYNEZxeUdwTzVqVllGVkxkKzB5T2lYWWg0SGNi?=
 =?utf-8?B?cGhlcm82OXZCLzRGZlprcXhwUG4yMzNPUmZLYWNGQ2twaDBkWGgvSjBSeGg4?=
 =?utf-8?B?c3puNlFxUHEzZ3NCT1krVWhYZ3lXOGFFTFJWSmNxZzNHcTFxcENFSzVjQnNY?=
 =?utf-8?B?U2U2S3RSNS9YSjMzRlBQK0tqbnpSUDJrVEtKTDh6d3NuOWdWNTFwMWZOblZt?=
 =?utf-8?B?c3piMFArVlREV0RrVTh2YVlvTkFNSlpSOWo4SGZsNkNCNVA1MitOMmVCNnVH?=
 =?utf-8?B?ckJ2Q2xhTDB0VjZ5amRNM3ZoTi9aSTRXQmozWE1Za3k0OTRZRVQ3dDY5SDh2?=
 =?utf-8?Q?XC9oMfHNla4x1H28DuYus5klh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0341209-bdbe-47c5-14dd-08dd479d21f5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:30:36.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8VIfIyyGPrA+LylUpXk4IHwubfQlT3Rx+5kQFAsNMNjbqG+Re63gEX2Kv+H0uaG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216

Hi Reinette,

On 2/5/2025 5:58 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> The event configuration is domain specific and initialized during domain
>> initialization. The values are stored in struct rdt_hw_mon_domain.
>>
>> It is not required to read the configuration register every time user asks
>> for it. Use the value stored in struct rdt_hw_mon_domain instead.
>>
>> Introduce resctrl_arch_mon_event_config_get() and
>> resctrl_arch_mon_event_config_set() to get/set architecture domain specific
>> mbm_total_cfg/mbm_local_cfg values.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
>> ---
>>   arch/x86/kernel/cpu/resctrl/internal.h | 15 +++++++
>>   arch/x86/kernel/cpu/resctrl/monitor.c  | 46 +++++++++++++++++++
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 61 +++++---------------------
>>   3 files changed, 72 insertions(+), 50 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index ab28b9340ee7..cfaea20145d0 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -605,6 +605,18 @@ union cpuid_0x10_x_edx {
>>   	unsigned int full;
>>   };
>>   
>> +/**
>> + * struct mon_config_info - Monitoring event configuratiin details
> 
> Same typo as previous version.

I am really sorry about this.

> 
>> + * @d:			Domain for the event
>> + * @evtid:		Event type
>> + * @mon_config:		Event configuration value
>> + */
>> +struct mon_config_info {
>> +	struct rdt_mon_domain *d;
>> +	enum resctrl_event_id evtid;
>> +	u32 mon_config;
>> +};
>> +
>>   void rdt_last_cmd_clear(void);
>>   void rdt_last_cmd_puts(const char *s);
>>   __printf(1, 2)
>> @@ -674,4 +686,7 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>>   bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>>   void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>>   unsigned int mon_event_config_index_get(u32 evtid);
>> +void resctrl_arch_mon_event_config_set(void *info);
>> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>> +				      enum resctrl_event_id eventid);
>>   #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 8917c7261680..6fe9e610e9a0 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1324,3 +1324,49 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>>   
>>   	return 0;
>>   }
>> +
>> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>> +				      enum resctrl_event_id eventid)
>> +{
>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> +
>> +	switch (eventid) {
>> +	case QOS_L3_OCCUP_EVENT_ID:
>> +		break;
>> +	case QOS_L3_MBM_TOTAL_EVENT_ID:
>> +		return hw_dom->mbm_total_cfg;
>> +	case QOS_L3_MBM_LOCAL_EVENT_ID:
>> +		return hw_dom->mbm_local_cfg;
>> +	}
>> +
>> +	/* Never expect to get here */
>> +	WARN_ON_ONCE(1);
>> +
>> +	return INVALID_CONFIG_VALUE;
>> +}
>> +
>> +void resctrl_arch_mon_event_config_set(void *info)
>> +{
>> +	struct mon_config_info *mon_info = info;
>> +	struct rdt_hw_mon_domain *hw_dom;
>> +	unsigned int index;
>> +
>> +	index = mon_event_config_index_get(mon_info->evtid);
>> +	if (index == INVALID_CONFIG_INDEX)
>> +		return;
>> +
>> +	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
>> +
>> +	hw_dom = resctrl_to_arch_mon_dom(mon_info->d);
>> +
>> +	switch (mon_info->evtid) {
>> +	case QOS_L3_MBM_TOTAL_EVENT_ID:
>> +		hw_dom->mbm_total_cfg = mon_info->mon_config;
>> +		break;
>> +	case QOS_L3_MBM_LOCAL_EVENT_ID:
>> +		hw_dom->mbm_local_cfg = mon_info->mon_config;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
> 
> This new arch API has sharp corners because of asymmetry of where resctrl
> runs the arch function. I do not think it is required to change this since we
> can only speculate about how this may be used in the future but I do think
> it will be helpful to add comments that highlight:
> 
> resctrl_arch_mon_event_config_get() ->  May run on CPU that does not belong to domain.
> resctrl_arch_mon_event_config_set() ->  Runs on CPU that belongs to domain.

Sure. will do.

> 
> ...
> 
>> @@ -1683,33 +1653,23 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> -static void mon_event_config_write(void *info)
>> -{
>> -	struct mon_config_info *mon_info = info;
>> -	unsigned int index;
>> -
>> -	index = mon_event_config_index_get(mon_info->evtid);
>> -	if (index == INVALID_CONFIG_INDEX) {
>> -		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
>> -		return;
>> -	}
>> -	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
>> -}
>>   
>>   static void mbm_config_write_domain(struct rdt_resource *r,
>>   				    struct rdt_mon_domain *d, u32 evtid, u32 val)
>>   {
>>   	struct mon_config_info mon_info = {0};
> 
> As discussed in previous version it is unnecessary to explicitly initialize
> the structure if it is fully initialized in the code. This avoids need for
> future cleanups like commit 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")

Yes. Need to change it.

thanks
Babu
