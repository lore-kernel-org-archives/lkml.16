Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A41D5ACE;
	Sun, 27 Apr 2025 22:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745791948; cv=fail; b=PzpLU/nfilJtZ6el7IQg6scH3tOqkgc/yaxLWXQPiLa/mnS9TBAUw1EllMbhEyy8b/u7T4OmLcT3zIwfES1yNy74t3/Ix4UZFLSvsnHHq8p+fZ5Lb1Oh4J3m9CemRPO/Fl+wnpNQzHNdv0uR1XnXnzivpYya3JUwswRXMPS0fSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745791948; c=relaxed/simple;
	bh=flFv9bK6e44WiN12Xo0OKo3mvInToj7ImHwoUzv4z6k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hLav+nG0Vbo3weGPVRph4f2ZmR+SyfrnTccUWWienAk9VdLU37tVg2sWHjXN+wM6KqTyHj9+4GI6M9MQkSsgH8EEqlxE5N/ptyxOJEQaDVPJBGGwHLmBXBF3pgVog8n0flrN1380A2FMx82JckvSg3398Nw6tJXfyT5ppjv0RuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=or72TEyu; arc=fail smtp.client-ip=40.107.100.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="or72TEyu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwJy+6xOXC96M7vDRKcyvnTeVFUVIV4amAcLXAziRcS861b4TobbEExZasor3EgyrqItTWYJDqqXviUSAvomYVtgdBKjqsfJrqB9IyhY7TOlWgTGlhcgA11G22wzuItmvlYoXWxc9zCH1+vfSSk8uiHaIaQ9/DQtmnFhqUAf6+dRbjs8tqQh0F4IEo+NfVIUmMWT+4tKugg2xltcJ2w+h/rcTuYhaAH/bwCrWoDfiSqYdTnLcXu+wg4QhDPUM9LyS22hgtQ0afFMAL8EH2CjdLBMPUSPMue83N34/2qj1a0KWCQibTW6zknzZ8Cr1AsZd3T2BfMHm1asARLRinMDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39chpzhovg1n3HUuGs/n00QIH+CWE4AKRYvL66dKZRk=;
 b=t/FZRER2HT52mtq0xj8Bo/UvTVKbxA5YyP/HtdhbKLGD0vN45OkzFKjuZqh3YpoJPVB/nUkon+RSid6vqjB5vGDUV5gwdaORxU+4I7CPm9nGmkINhvSmYjcarKbF7Z4VtoTnBXnfx7nakLLHl8Wet9TGsxEzOQN6q1lgFsgLeLbBGYDn9nyB5kKfySLQKBd+e6b5xCJIA68ccUaF/0AZRuQDf4CLUQEVtgje1nGBZhNRv6Ow4EQwCskn3w7duAQ9Qsfmhw8776mdg9gIXftrZQ11/XyjMZR8zXt/a/ND6MvC25FRlfx37Bb3ZT0AdLkDlFUaxwxBW4eUwu5JpH+bBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39chpzhovg1n3HUuGs/n00QIH+CWE4AKRYvL66dKZRk=;
 b=or72TEyupJohTSThNsTgPX4/zVXgIT1nGUst14rOAsl/9SyULy+08flzcSg0VC//2wTeqNKAWL57G6U8Re/M+2qsYZjtUbvKFvf3bGEQ/zGgwRgJy+rUqtKX33wwnvXHNMF8e2FEXgJFIxBCCLjYhngqLdW+1BU2wty4wmqsgvxrgopg577YNo5KfiMpRpFMLYGQHujxiks3/v5QiSsRdK43mGMdRRQ329m+V3CIqe7ZbfoPhj5L7TW7wmQGHdt32k9KO2mDLCthYNB7vQDyIqEpJEcXbeb/M8JvfC/EbDya7QDM7kDZcWEf0+nR/rw1Nixxz8R7DG6myDEBmHx3lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Sun, 27 Apr 2025 22:12:21 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 22:12:21 +0000
Message-ID: <c922d67c-ab20-4e46-9359-01fb32223d17@nvidia.com>
Date: Sun, 27 Apr 2025 15:12:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
To: Remo Senekowitsch <remo@buenzli.dev>, Danilo Krummrich <dakr@kernel.org>,
 Dirk Behme <dirk.behme@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dirk Behme
 <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev> <aAzrg31NB2g0X4qL@cassiopeiae>
 <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
 <aAz1f2jhdwjXmHex@cassiopeiae> <D9GWI4GT3ZK4.25N3DYX5MSX0P@buenzli.dev>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <D9GWI4GT3ZK4.25N3DYX5MSX0P@buenzli.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9d4b51-527a-4229-f0fc-08dd85d894d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXV5VmloRnp3SG9RNnBFMGtEODlYektic0J6Z1BhMFpYZktjNm8xWUlMRE9q?=
 =?utf-8?B?cTl1Tlh6c01rUGxOVTdQdk51aDZBeFdLTm9GV3hyQkdkQ2w0S1VxTFNPdzFX?=
 =?utf-8?B?TThROHU4SWlMQXRwL2tSK0lkYWMwRmQwMWRwbStBWldxQnVmL0ZyTTFKSlhl?=
 =?utf-8?B?bUFqNlpIYlhORmJ2TnJlcmE0c3hyN2NhRVBJa0JXWThXdVp1cmJvRnhMRXJO?=
 =?utf-8?B?dXFKRDVjbjBNTnRRM05BZm9ZdEJIakZodDdCOG1MNGxIL2x5SVRoMGREV2ZL?=
 =?utf-8?B?eGpESDdNelVRTTBtcFFVaDJtOE1kVVNHOFdQdU1pVG9pYkxpbkxuVEEzREh1?=
 =?utf-8?B?UmNFSVMzQ0hUNHNOakEzT0haNGhUaUhSVlJ6Vkk4Q0Q1WlFDT3FtbWtSS0Qv?=
 =?utf-8?B?dHFiZitxVzBkTVJLcWZ3SXR6SThmWnZOVU9LcFZmOUFrNE5HVGlLK3B5TTFE?=
 =?utf-8?B?TXNOdmhpSlNaK082ZzNFRlhmZ3I1RFV6OWwrL0UreWUwQWczVmFTTW1wM0Zt?=
 =?utf-8?B?TnVXMHlkWk83MTdsOXp2Vi9TNUtYc1dhaDJjOERCdEZkcCttMWZLOVhXMUls?=
 =?utf-8?B?bjlOUHB1WEtrbUZYRXg3dWtodzJsV0kxR01SdGdHcVVGdzg1TEJCRlg3amhz?=
 =?utf-8?B?Zi9oTVgyMWhTakRnbE0xY1BwMU1RbGp4bEIydXZRbHFvTHcrSnA5OWJOaUFU?=
 =?utf-8?B?QVFrUjRIdVhNY0doWkVDRmpuYTI4bFh6RE9PMldRemNaWDJGdEkvYWhiclJk?=
 =?utf-8?B?Tjk3WjhvMXFJS3lYOFUveHYrK3pKcFA2d0FQYkwxZkI0SElRS3R0TTJXbjRF?=
 =?utf-8?B?OEdJYXpKMjZ2ci90cElsanZNck44bnViT2hlVlVpMlU5QWVaNEwrWE5POVpt?=
 =?utf-8?B?TGNLeFZObmdTVkNtQk9xVUpSZ2FLS250YjNDdStQQllLWW1xaS9vQkZncDU4?=
 =?utf-8?B?NVIreFdWMmE4dUhBZWJUS0U0bTJKTkRTRE5sR2hjQmtCcURydkszckh3NEhH?=
 =?utf-8?B?WGgzSjBmMCtNUFNWWkc1WTRjMnpzMU9xeEg3YjNKakhEeTlMS09JbCtjLytE?=
 =?utf-8?B?S3V6dWJhcXhqYlpTTzFqbkZPMlUxclVtaUJhWWR4UEd6M3g5dXRDUlVwbktx?=
 =?utf-8?B?ZWN5dUdMdEE0L21BYTZQRDdBYUlhamJDMTdJUjlLZ1pQMzlnTGVMNytqa25V?=
 =?utf-8?B?ZGhXK0s0eE5GZkdhS0JzR25Yamh5KzFmZ2ovUEUra2tVeUs0QnZCTHVua2l1?=
 =?utf-8?B?eWlIRHdQcTdJVTk0QllVRit2T29YZk90d2psV0pabCtyRDdhZXhZZEM2UXp5?=
 =?utf-8?B?ang0SDIzbU81aDdRdDI1R05zYjNnbHhIcXhuTGN5elRwU01lakhPcDJOWVZU?=
 =?utf-8?B?aUNiOGJ1Ym1tQzUwbjlmak82SFJIQmNocStCZVExdVk4WmNvR29oL0JuTXdG?=
 =?utf-8?B?aHAwek5vRWdxM2RMWW1EUW1RMnZVbHY1WEduSXp0UkpETnZXOER4ME16aElr?=
 =?utf-8?B?enN2ZHpDL0tES0xuOHFWRGlGdWRWSDZjVkR1Z1F6YjJWam1xakJFNXB1bDdS?=
 =?utf-8?B?T2M3WlNacUhFTkdvZUJ2SHhFZUZjaDNidkxxTHhpTDFpdDRDOW5TYlZTTG0v?=
 =?utf-8?B?cjhFRFJFOWFKZUhhdkEvT2I5TEwrdEpjYStZS3BZU25Za0haSzVWQ2FkTTM5?=
 =?utf-8?B?d1AvSldDTjlZZStLdjZVeFp0eDBzRlNTY0VpbWdzRlRzdHRPeTZOQ1BRVHV0?=
 =?utf-8?B?Rm9WOGFnNWJMTXdOV1FwZUFiOEwrVVpWbDhQQ3FkQ1hKc3hpcjN5S3Vmemtt?=
 =?utf-8?B?TnFCakxqbFU4RE5NUSthNlJmOFlYSTgyVlVLZHUxQWRybTk5ZGpoYWZzanVX?=
 =?utf-8?B?L0Y0N0owK2ZXVitMZlB3Wld4OUQ0RThGWXM4SUt6YmpNRFlWV1dCZmpVandm?=
 =?utf-8?Q?3DNKzyn/4H4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEx5NHJyWjhKQTRuLzBnc0tmMUxxV1o3Sm9SNXIrQ3VuVi9KMTR0WU94bHBJ?=
 =?utf-8?B?OG5mYjJjMmZHdzVZaDBKTXZPTlY2S3dhUG1VRWNSMSthZFJ4UHR0di9Od1Fr?=
 =?utf-8?B?UkozTXMvQllzNWo3bkpjS01landJSFNTVzVPQUoyYVNmSzdBWEVYZkNoaDQx?=
 =?utf-8?B?bnVTMXJ0blBBOVZQNEtzZnVQaCszeFltVU5iQXMvWGd0QnpDZlcwaHl1NUlY?=
 =?utf-8?B?YUZZa01VdG9ZdjlKbXZUamxHVDJiSm1QOE9taGtBalNjWWE4QnNMUDlWcXRX?=
 =?utf-8?B?c21uT213cW42amF4aDVMKzVqSU5PdVlIWFZnWVF1YXVtYjZBbFBwWndxYjlI?=
 =?utf-8?B?RTNuT09uM1ZGaWFQTzhDeWx2QjNOaHJFSStqNkxZbHByYUwyVTZQdmcxSHNK?=
 =?utf-8?B?RDYvN2x1QW9zbU9yWmJPK1RuNGZ1TXFTQlUwQ2FRdmkzUXFmQ1V5Vi9xQUpk?=
 =?utf-8?B?MnN4YnV0OXRwak1MY1hNZ28yMXkyeTdDdzVEVFFSRmkrcDFjaUFQampxeTVZ?=
 =?utf-8?B?cEVvcEZnKzYwZStoL1dQZTZodTc4LzlNdUFUbzRqbXVvZEFKN2MydmxLMnhD?=
 =?utf-8?B?bStiTzkzUGFwQjNDZW85ODU3NEt1THZ1UzJuM1JrcWVaRmdPVE1Rd1ZMV2M0?=
 =?utf-8?B?MUgxQ1pSZkx2MnlhQmJwd1NmcDdqbXp0MDBGMkYxbThQSVZzaHZ1eUpzNkFY?=
 =?utf-8?B?TkRrdWY2V3EyWElGd1pWOHNvdiswWENoQ3FkVW9HcDJNcVlVVWdhaGsrODIr?=
 =?utf-8?B?RlZuTU9Iemc3UGRpY0NrTXJkUTIrcS8yekRBVUp6bU5KbWRtTzVGWnNZbGhy?=
 =?utf-8?B?K1ZNVFVXWWtDbENaRE8yT1B4cjJvWU1lN3BqbHRBZzIzbmtZcHlwaXdNYWo1?=
 =?utf-8?B?SXVWWkszR1gvZCs1Mnc0cGsvNHFhRVV3cVM2ZlVITHlWU0F1QnZacmt0UXF6?=
 =?utf-8?B?OE9pZCtLOVFoVFdqaEplMktacWhtcGtVTS91RFFoMWYwbTVSMmZBVENjZ1Yx?=
 =?utf-8?B?cHdpR2cyMlpFNHhoc2NkNFdCTUZVZmxUWkFGKzdYU2VOcUFiQ2c2czZ1QVdw?=
 =?utf-8?B?SEZNZmZPZHFMOVhoRFNTTVVjSllMekpVdENpMHREbThtbmxTMlpaU3hkOWRC?=
 =?utf-8?B?N3FzUTZucmVMT0dyanFNcExLUndzWmEzY2NqUTJDcGEzQk9ZWWovS0c5a2Nl?=
 =?utf-8?B?UE04WTE5WjVjbWV6TkQwWjgzMWpuNFNmektGWHVkMWNRL3U2azNKRGJjNEJk?=
 =?utf-8?B?OEVXYVhZZFRaQm56RGZjY3g2MnorbHN5KzNIUWZvRXRJOTBITVhOSDlmd0Ir?=
 =?utf-8?B?RXNKN0QwTCtQOEtGU2RGb2MwMkM4RXVxSTBJUGhhWGRId3dBVVBZc1lDYnhN?=
 =?utf-8?B?MDJVZ2ZLbytadVVFZ0F4N3lGbTVSK2wrL2FPYm5jVFlQNzB6MHJYR0dDQ2dK?=
 =?utf-8?B?cDBKMVZTTmJ5RGNVTmZpWi83LzN1dkxKbnJoTTMxQTRLV1J4YmZ5dkNXRllR?=
 =?utf-8?B?YW1OVDhzaklSVTd3V0V5NU1IQ0w0TkRkaE1LTjZLU2d4Zlo3R2dpN1htc2dJ?=
 =?utf-8?B?dVdwOHBsRGlLS0szTUxsTUg0ZUhqZi9BTHdlZFJKcU16b0hoaXU3VUg5Z1Vq?=
 =?utf-8?B?WitvRTJMdllQRkQzMjU1dUpaSWdLRG82Lzd6cGlwakRPdTlIWkx5Umxia3Bk?=
 =?utf-8?B?TWQxTnB4a2JFMGM5d3F0MmhUanl4azc5ZUcvODV1Y2xBaTdhSjhtYjNoOG5N?=
 =?utf-8?B?QzUxUElDbHNaZC8zdHpVRFNBaHZOemdRR0g0ckFQV3ZoWVBkazhOS0s0RVJ0?=
 =?utf-8?B?Q3JXRTBYVFl1WDNoejMzeHFRV2EyTjVxUlA3eEpMSzNUWWhJanRQVTFJTUYz?=
 =?utf-8?B?bk16TkZTeUxIeUpXNC9lQkR4M3JYTW5HL05pb1JFWW8rN1ozcTY3cUlEWWRs?=
 =?utf-8?B?OWJDaHkrbksxdWUxZlBoTHdPbEN3Q2tRZDJZMUFQSTJUODUxazV5ZG5DZ3BO?=
 =?utf-8?B?ck53cVZLQmREYU9TQmg0cXdpSDk2Y3ZuVTd6cG9saFZGbEtUdUljTG0yOUZ0?=
 =?utf-8?B?WDREREVtNmNPNVBFYlNaQVBBMmpsdWZWVWFiMmZlQW5yczBDQ1BGMUJSZHB5?=
 =?utf-8?B?Vy9uSVAwbytzOUZIYURHMm5STFJjWVd3UkVKUVFEN1FoQnZFT2Y1bjhXUzBQ?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9d4b51-527a-4229-f0fc-08dd85d894d6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 22:12:21.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgsIC4g5xCZBzt0BhZHdRl2NWGA/1nBaUwYuMCyai9ndaoOE326yDaoKy/t12k7zHuFqmkVMW6h6iQrHw7HAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

On 4/26/25 2:50 PM, Remo Senekowitsch wrote:
> On Sat Apr 26, 2025 at 5:02 PM CEST, Danilo Krummrich wrote:
>> On Sat, Apr 26, 2025 at 04:35:07PM +0200, Dirk Behme wrote:
>>> On 26.04.25 16:19, Danilo Krummrich wrote:
>>>> On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
>>>>> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
...
>>>> Why do you think it is important to force this error print by having it in
>>>> PropertyGuard::required() and even take an additional device reference for this
>>>> purpose, rather than leaving it to the driver when to print a message for an
>>>> error condition that makes it fail to probe()?
>>>
>>> To my understanding doing the error print in "core" was proposed by
>>> Rob [1]:
>>
>> That is fine, though it doesn't answer my question above. :)
> 
> If the question is addressed to me, I don't think it is important.
> I don't have a particular preference either way. I'm just trying to

Generally, printing in libraries an lower level routines (in this case,
"core") is undesirable. We'll do it anyway, sometimes:

     a) Behind a *_DEBUG configuration, to debug the core itself, or

     b) Desperation: hard to recover from errors, that the upper layers
        for some reason lack context to provide an adequate error
        message for.

The idea is that the lower level you are in the software stack, the
more rare printing should be.


thanks,
-- 
John Hubbard

> come up with a solution that is satisfactory to everyone. We should
> hear from Rob if he's ok with removing the logging entirely given the
> limitations.
> 

