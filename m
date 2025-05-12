Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833E24DFF3;
	Mon, 12 May 2025 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082094; cv=fail; b=AnnkdQH9azgZtQA8XdgH2iV0nVoCj+RxPVJJlEhtBfeKqZoINtGji8D5hkZGmJSLvbCc4KPQaV+y+6SrLnJixnpl7J3wkMENL0Sh9zA4JbFkg37XSilTUzxjShfwoqDPxOsFw59YpUi2nl/N1Y0ctDLpJXTRW73OmKVapi/wS+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082094; c=relaxed/simple;
	bh=Yv412PkC8Kl8UTEGiqW8BvxQUrDLZeNBhWJw5Mpt4qs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A0pwcExYNYknx/1PFT2awm64N0YoXIJn0hhx3Mk+mlGofWa5rKJRyZzlkUoh9Dnl9sCL/hhIn6xviwba854W9FOx2qRy2ISw3pUOjrIQdYOucD0trtVHU3CqqB24iiMBU7+RYh1nB8/QcdyUIYBdkZVq1AWAOYmg67XejKv1iXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bWmdtv3N; arc=fail smtp.client-ip=40.107.94.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bWmdtv3N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwtSP5A+H+me6IpWilidwV76d3tO3cRDkEziDI9z+O74QhE8FS2J6P5MzaQ5p/0QtLMnlQGNy//bdKCW0xQd6V+YFW8Nok8+KBdgtBThnYV9GAiZSbcOxV5ae+UymZF6MxnQ+GVtEKn4RX2xeq8HVOKUyGcykkeKfs9GtgMDqIAyXkK1uwDJ96hGh2tax0ZVCP06hNqQMH2VMy4SObENlS4gQu1fY9UCci3imusbs17/eR29W5r2YeaIfZWUaKpBF3zDeNb6xxxB1Kki9D3kEKE49BEU4TH2100k6+FRJxFWGdmXQvKcjarAJISLEorb0h4aBDzS6oEvGH3IWJ/jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFOf62HekbDQnuumAV6NTFS6z8j7h9ZNAeEaiejtTGg=;
 b=hUu/0alB0gTbJEvDQ9U7ufC2p3zfULalfT0q5swuo5W10bZ2+vyBTQbBFKEScmB+o5Mb/qO+5vNFOUlOicle/ST8WXzZTFb5o3FpZEu1KeLziNBzroWFqmXvJIbX403DhOj3O6Dy6W/srThjeoTL4KVY43uzYcdcVQ/WnPMdeVQ140hk+NgOryyAINRGTr6vygFK/eWltdSdXg4GE/cqgjjvUZnOiMj5xajQm8HDeRx74KTFW3dPv2D/3I4We2zgRZFGfLqm/PDNwO/boe2ad0spmJISwWAw/ilYg2F9TQCsI/ub0wvcON6WZiuZ9q1ZxzVsBapBnkScKp5RoDw4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFOf62HekbDQnuumAV6NTFS6z8j7h9ZNAeEaiejtTGg=;
 b=bWmdtv3NSjnm0GrTvIlMcZXM+ORdFoTxoZmLtr91nqPzvtjy4JZHDhwSGeWyTn/xVGt1Ft2t3dVHRLp3yckHtRGOVk/Pz21R3CKfi1M2JRWQLC81DQbSR55PswaOpoDwg7+pFUgvsmZI6aErU27G166+0GEIrh7pmzZRcmQRgxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 20:34:49 +0000
Received: from BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4]) by BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4%7]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 20:34:48 +0000
Message-ID: <7e46c769-7c5e-4a54-a216-c85c667446f9@amd.com>
Date: Mon, 12 May 2025 16:34:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13] platform/x86: Add AMD ISP platform config for OV05C10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250509181220.1744783-1-pratap.nirujogi@amd.com>
 <6b649ebf-6f03-4050-18bb-788bbb3a664e@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <6b649ebf-6f03-4050-18bb-788bbb3a664e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::13) To BL3PR12MB6426.namprd12.prod.outlook.com
 (2603:10b6:208:3b5::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6426:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b868891-32eb-4fdd-9899-08dd91947059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUlvekUwSldQUEdyOEtsaUU0NkNqd1FIODhhSjV3ZmtJSlVOK0txQVYreEcr?=
 =?utf-8?B?ZEw1YUFBTTZQOFJqcXZheTQybGl1RXErOHZFSmtiU1o4UW8rU2dSWXUvaHBk?=
 =?utf-8?B?ai9WOVBOcDYxYVE3RnRpbkdzSE9jK2FGUXhYTVNEUVNNaFpxWW1OUnRrbll4?=
 =?utf-8?B?clcwWlpkeE9RR3cvVVlsUVJqb0xPbk5vdDB1ZHBya24wNnMxaEhGNVQvY2Vt?=
 =?utf-8?B?SnRGQ1lIaWpKckgzbnVIQmhFQzlXeURoa1VUYmQxM2gxTXJUNXh6bUp5Qk0r?=
 =?utf-8?B?cGdHbDNPWW0rbjFDV0xlK0FseS9hd2puQjdTakpub203bFYxbE1aVml1bkg5?=
 =?utf-8?B?VXBEWXVONE0zRGlJVzRWRDJhUE5yOHNrK1NtNTdlVi94SXRsN2dKYTZTUVZB?=
 =?utf-8?B?eWZSaVVUL1hhTmdOK2dKeXczVUhxcVd5Q2d3cjRDcWJYU2hIRUdRa3NPdkZ2?=
 =?utf-8?B?emMvUVpyT2RKRi9Qa25xUTMrNWUyVytOSGNIdGJnK1BPVGFwQ1BzS2hCTkZm?=
 =?utf-8?B?NkpFYjlLV09PN1RWNlFMcHNyVzdWSnNPOS9IbjJDL3krOTVnU3ZyTmM2eno1?=
 =?utf-8?B?cUI1cUVZN0FTSExEUHQ3RFBEOXM2RXJpcHlZdnllbzExUVd1Y21VSjlpWCtV?=
 =?utf-8?B?dks1b2lXeEprSVZUYWpNdmE5MjVNTUdwakU5bm9heVhNcFRaaC85dWsrbzZr?=
 =?utf-8?B?NXpxWkVkdHkxWEF1R3hWL092d0tSRDRRYURJTGRwQVYrNDF5S0k3ZGgwU2Qr?=
 =?utf-8?B?NUNLU001MzlOeDBUeDhWV2ZlRUlHeFVRSWpGWDBnWkVjcVplNjYrWlRjQ3NY?=
 =?utf-8?B?UlRGcTExZ2JVUmJiblc1RThUQXdnOFBhYTEvbEFnUlR0WGVxU3RYSzByaFdK?=
 =?utf-8?B?cWNpN2ZabzcwRXIxQ0thRVhyZ3BmVUNrVzk0eHFzQWNuY0p3M0dRZHVMSWo4?=
 =?utf-8?B?b3gxVWtxOFp0VHZNNTJjb2MxcWpqMmlhYkduMVBrMnB3blQwWTViWFE4UVhR?=
 =?utf-8?B?V0FrNGhMR0FzdjBkbnVsdjlPM1VwY3Y3M1VtZ0t5WE5lY3Z4b2w3YmpxSUpu?=
 =?utf-8?B?RUdVakQzM0hUODBqcTIzbnF6b2tVV2tHRDlWNnM2cjFJR3ZQSFQ3U0o0YlRk?=
 =?utf-8?B?UzI1UHk2ZkZRSU9DaTlZNSswZXdaM1grbHlNZXF4YVBodHZzbU1IWW03Z2ty?=
 =?utf-8?B?OGpJWm1NZCtyclEvUnJCWHNzeTBtRTlPdUJ2YWs5bGZneGpLNUhMKzV0dnhv?=
 =?utf-8?B?NlZxc3phZGxHVExiMVlQSUtVWG5SYVhkQ0trVDlZUGtZaTJXVzJWK3FIS1hN?=
 =?utf-8?B?bEhtbjgyVlFQR0tTNVIyNXNFTmVkb1Zoc2xUdXpyRE9oa1RhVjl3UEd4aHIy?=
 =?utf-8?B?STU4T0swSy9ORlU0bXZxS1FHejl5bk9ZY29NaGJVZWN5d1U4eXFMRUlxcTZo?=
 =?utf-8?B?bVc0c0ExclNpN3VYRGhLUHpnOHdZYUNVWlFqSkJKRWI2S0o3VnJySDR2MUJH?=
 =?utf-8?B?S05tVHU2N1ZOc0JMYnR2NThycmloTk80ekpTeXlOd0RyQXgwaDVvdk5EZ3Ez?=
 =?utf-8?B?SjdUVEZKMWw2ZUdENU0zTmVqRXFEOXIwNnp3Q005OStMb1JHNUx3cXdpdE9I?=
 =?utf-8?B?bDRETkhLSzFmaG9DL1FBanN1b0w0UXR1TGNOcWxuU1JpNlhUdENSYlNVb0NQ?=
 =?utf-8?B?TjZJUTNyUithdjQzQUxNVUdNTDBHRko5ZTlXZS9uMXFCbkZXZE1IR1BFL3Fx?=
 =?utf-8?B?R1FZdERISCtwTVN4bVNyaVhCaVB3dXNDQ2VUMk44ZUREODlrQWsxc2NYazFZ?=
 =?utf-8?B?dWZBTXgxZGpWUStXZzNVQ3FxQlltTDgrWFhyNWZLU3o5d1ZWcmUwQ1JzNmJH?=
 =?utf-8?B?dmVkTmEvN0pKOGI3ZUV1ZHRTd3ZyR0ZTZjdhZG02Uk5pbC9NbVNhVGhCQkdE?=
 =?utf-8?Q?NLacS3BRnJE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6426.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1kvY0taQTFURUpTREQyZlFJM05kdC9WVzdvMmNiNllmaE1SU0E2ODM3S1ZR?=
 =?utf-8?B?TWk0OUU3TktTODRZc3JOaHUyQ0ZIeENJQjlPRi9VV3JMZEEvQURFVnlDYnJh?=
 =?utf-8?B?dUZremdDcTVyT3AwTG82NDQ2UCtMOEUxQXVvT0daZGxUdGpKVnozdDU5cStM?=
 =?utf-8?B?eHVDdUJ2emdocnNCYWJ5bHVscjY5eXZFSVh0eGNFSml6cS95ZS9PcTZIN1A1?=
 =?utf-8?B?Z2FLeStFYjNrOVltZncrckkzMUJqNmkwb1FzMm9lOXZ2Rk5Dc1hjaFU0bGgy?=
 =?utf-8?B?TlhIM05qaWgzVDF3MEtQdWt6eVRVYlpyUWF5bDh0OUM5QzU4VW9TcEIrQ04x?=
 =?utf-8?B?WEhBdnhWWi9CekpETTFkSGFTaWJtZllHREdtbStnbGxLdk4vVmRpajZSMnlU?=
 =?utf-8?B?WnBvckFUN21rbXNoMkhGa1ZmWXB5SnFnZFJ0V3pRVlFsS1gra2lvd3dMS1lX?=
 =?utf-8?B?VENJZGswMVhvRjZaMjY5cC9JL1llODIvenVPT1h1dGFydmMwbWZEaUtWRGc3?=
 =?utf-8?B?L3V4aTI3R0ZLdGxzUGNiMzFnVFhZUTQ0SVFjaGxqZjJVS1RDWWhkeUMwaUZG?=
 =?utf-8?B?MUxhT29OaFdaUmc1WkhnOVBVV2VHUTJXRStTN1VBM2hUWXAxVnVaZHBSZjF5?=
 =?utf-8?B?bEtwWEhoK2tNRzRyQzhNNk51bTRHUjlERnNaY2FjZlNEUWlxWW4ydHIwdFFK?=
 =?utf-8?B?VUlaekI3RU10WlhNNkgzT1dJZHVLVkNIS2xNTDNnN1FrVDdyN2JzRVlzbEdN?=
 =?utf-8?B?VTJnL3NaWUZZbmFUYW1UZW9vS0toaHo1SzhYdFBWV0JkUVZMUmdVZlZtSEdi?=
 =?utf-8?B?cHVKMThsVnhwNE80clZucE8rQkpwK2p1N0dlb0pQajB5aG5uN2E2QXNoeWpB?=
 =?utf-8?B?SllZaEhRbkpIaGVuVDM5ZGMyQW9vUzgyM2FhY2NpTlBzUnQrVGRjSnlYTUVp?=
 =?utf-8?B?K0kyYXN0MGlsZVFsS3BDdUFsb2lHbGpOSUVTQVlVZ1cwalVtbEp5enQ4emxT?=
 =?utf-8?B?ODRnd29xK0s3YzFtTHFwU2c2Um41aXJNOUxYTDhOMWlCczlnUU9hQlliT1J3?=
 =?utf-8?B?Q203UktxR0krN1VjR0ZqZlhnR3BsZHZFMGwraTcwSDRNZVhJRFRpSkx3dHBB?=
 =?utf-8?B?Z2FFZG41a0pnT3h1by95TEgrcFpOSTlDRURzaTdYcm42VTdqeW1IakpXWjVP?=
 =?utf-8?B?bEdDd0hNYitlMEV4REJVbkh0M25BcmRpaDJNVllFV25TZGExM0xtM2hMWi9V?=
 =?utf-8?B?SUpBc1hmTDFMS2RqNkg4dHZQQXJPN3JOWmtuMW1KR2hoL1h4RlBMbzhTSnc3?=
 =?utf-8?B?QXAvZGY2WGRncjA0NllKRWxoR3J6dXFCa3dwUWxpU1JaZlF3NXlONEtOUXkv?=
 =?utf-8?B?RHB1QnVlTzByL0REc3o5Y2J0Nk5zMVV3UCtJTzNTaDZyWVBKSzlsazhGdGJN?=
 =?utf-8?B?WUNHNks2S2p4SmJzOTFVWWVXTHpQek1Fa3B2MGYxeTV0bXEvMUhITE1nNGdr?=
 =?utf-8?B?TlA4SkZ3RzlZQ1VVL2Q5eGE5TEFkL2wvL0pjREZiaXRPcGh1TkltbU5OdTNo?=
 =?utf-8?B?T0JqejhlZ0cvZG94K3U4Z25OOEZ0K2Zkb1FMZUF0UVNBMzU0T01uQXdVSkVp?=
 =?utf-8?B?L2RGd3BBbTZxVVNTUTl3aFRhZ2FCQ3dwOEExV1lQR0JsZ05ZR0ZJaFltK0Rv?=
 =?utf-8?B?VTFWaXdBc0xXVGM2SVJuY000azRDQWNhQldBVmRSRXhTUkMrRllNWjhYOVh2?=
 =?utf-8?B?U2VFWlNJZkRIRXQxU1FaQ25OazVCTTFnaFFxUUZ4U1NIR2NBckVudHJ3V09u?=
 =?utf-8?B?ak90K3h3Z3U2OFQrRU5Ha1NESElqY056R2dTSjlVN3QyTlJleHY3KzVhaXlN?=
 =?utf-8?B?V1VqNWZQcHZNanduUlYySzBiWWIxMnc0cVNleUw4ZXMvSC9qZzcvTkYyQUhU?=
 =?utf-8?B?SUF4cVJOT0NOT2E0MGhwbGtwTFloY3dWOHdTTXhSbUM5dFNiSnZlZThJZmJ5?=
 =?utf-8?B?NnJJUzNMQ1JrdWFCR3BNVzAxZkFFZ3F3U2Jsc3hqbzFhUWtPZmxWZi9ySWFt?=
 =?utf-8?B?ZldCakZRcW9aNjJCRXdpTGtpTE9hbUVHRU9UQldPN0YxL1ZpZDNIVHZVc0Yr?=
 =?utf-8?Q?tGVeh9P8qwJ6PhQEONtIJ/y93?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b868891-32eb-4fdd-9899-08dd91947059
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6426.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 20:34:48.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fk9fU3D4kBZW9/u/VL0m2TCRiRTZ2ga7WuQhXhXBBxzMliXUV0nYcbBgy7J3gn/UhU92NV8fYOTHK7aIo18klw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573

Hi Ilpo,

On 5/11/2025 6:54 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, 9 May 2025, Pratap Nirujogi wrote:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v12 -> v13:
>>
>> * Add "struct amdisp_platform_info" to pass sensor specific
>> configuration and make the driver generic to support OV05C10
>> and other supported sensor modules in future.
>>
>> * Address cosmetic and other review comments.
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 +
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 309 ++++++++++++++++++++++++++++
>>   3 files changed, 321 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..152a68a470e8 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..27939020634c
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,309 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
> 
> This is not used anywhere?
> 
Thanks. Will remove it, its not used anymore.

>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform info definition to initialize sensor
>> + * specific platform configuration to prepare the amdisp
>> + * platform.
>> + */
>> +struct amdisp_platform_info {
>> +     struct i2c_board_info board_info;
>> +     const struct software_node **swnodes;
>> +};
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     const struct amdisp_platform_info *pinfo;
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     struct mutex lock;      /* protects i2c client creation */
> 
> Missing #include.
> 
ok, will #include <linux/mutex.h>. I have not included some of these 
header files seprately as they are already part of one or the other 
existing headers in the patch.

>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
> 
> + #include <linux/types.h>
> 
ok, will add it.

>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +static const struct software_node *ov05c10_nodes[] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +/* OV05C10 specific AMD ISP platform configuration */
>> +static const struct amdisp_platform_info ov05c10_platform_config = {
>> +     .board_info = {
>> +             .dev_name = "ov05c10",
>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +     },
>> +     .swnodes = ov05c10_nodes,
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> 
> Missing #include.
> 
ok, will #include <linux/string.h>

>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,
>> +                                    struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &isp4_platform->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     guard(mutex)(&isp4_platform->lock);
>> +
>> +     if (isp4_platform->i2c_dev)
>> +             return;
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
> 
> Missing #include.
> 
ok, will #include <linux/err.h>

>> +             dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     isp4_platform->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *isp4_platform =
>> +             container_of(nb, struct amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(isp4_platform, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +
>> +             scoped_guard(mutex, &isp4_platform->lock) {
>> +                     if (isp4_platform->i2c_dev == client) {
>> +                             dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                             isp4_platform->i2c_dev = NULL;
>> +                     }
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
>> +                                                    const struct amdisp_platform_info *src)
>> +{
>> +     struct amdisp_platform *isp4_platform;
>> +     int ret;
>> +
>> +     isp4_platform = devm_kzalloc(dev, sizeof(*isp4_platform), GFP_KERNEL);
>> +     if (!isp4_platform)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     ret = devm_mutex_init(dev, &isp4_platform->lock);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp4_platform->board_info.dev_name = src->board_info.dev_name;
>> +     strscpy(isp4_platform->board_info.type, src->board_info.type);
>> +     isp4_platform->board_info.addr = src->board_info.addr;
>> +     isp4_platform->pinfo = src;
>> +
>> +     ret = software_node_register_node_group(src->swnodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp4_platform->board_info.swnode = src->swnodes[0];
>> +
>> +     return isp4_platform;
>> +}
>> +
>> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
>> +{
>> +     struct amdisp_platform *isp4_platform = (struct amdisp_platform *)data;
> 
> No need to cast from void *.
> 
>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>> +
>> +     if (!isp4_platform || !adap)
>> +             return 0;
>> +     if (!adap->owner)
>> +             return 0;
>> +
>> +     if (is_isp_i2c_adapter(adap))
>> +             instantiate_isp_i2c_client(isp4_platform, adap);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     const struct amdisp_platform_info *pinfo;
>> +     struct amdisp_platform *isp4_platform;
>> +     int ret;
>> +
>> +     pinfo = device_get_match_data(&pdev->dev);
>> +     if (!pinfo) {
>> +             return dev_err_probe(&pdev->dev, -EINVAL,
>> +                                  "failed to get valid ACPI data\n");
>> +     }
>> +
>> +     isp4_platform = prepare_amdisp_platform(&pdev->dev, pinfo);
>> +     if (IS_ERR(isp4_platform))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(isp4_platform),
>> +                                  "failed to prepare AMD ISP platform fwnode\n");
>> +
>> +     isp4_platform->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     /* check if adapter is already registered and create i2c client instance */
>> +     i2c_for_each_dev((void *)isp4_platform, try_to_instantiate_i2c_client);
> 
> No need to case pointer to/from void *.
> 
sure, will remove these redundant casts.

Thanks,
Pratap

>> +
>> +     platform_set_drvdata(pdev, isp4_platform);
>> +     return 0;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *isp4_platform = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
>> +     i2c_unregister_device(isp4_platform->i2c_dev);
>> +     software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
>>
> 
> --
>   i.
> 

