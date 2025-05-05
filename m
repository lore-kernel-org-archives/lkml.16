Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113D023774;
	Mon,  5 May 2025 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746422092; cv=fail; b=opnJTuwbOxXlC8Ir0L1GC4jeIBLo5LFvKz+fojKbJ2ujfixwfY+85nui1j/QqSHAeGfu1K9mi1neiLOE/2R/eaytzNeAlIpN+NQ8rjnvGFmaOpO9Nmqo8/9+bJS7p3q3gbOT3KsVC7ci6Ki3uH2lgO1uM6JZRPZ/RjOU4Gnvmlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746422092; c=relaxed/simple;
	bh=wCWlgbwmePcVr+ARVpMO0URjf0ufRg0H8lDx+shNBP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WcGBFvN7pxmF7U+jTevZnxTlXVrsJuZ8vmi0HhD0qFmowxwuyUfgpjZZQLT8bNCyVtifb66SdvyZHwUlPAJ9P7WpeKC8IyfzX76Nx4DgDgpbSWJKxM2ERKK3GNaauP+XpvVA8Xu617n7uI38MtPDXBj5k8yO6aSWmbOWUMbWAFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=jcq59Vr3; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="jcq59Vr3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UigrapYiMqMZ46NMQqW9XoVmlrxfFLUX16Dymg6f5HEK5uhiuSYgG5+RD7UJp8Sg9Xc0b8eu9hFMEia4wZMAWUM/bOWREuxe9VHOHpmUqBSh4s7J9Xuxy2Kiv6TMyVmAhTa3ZAcmgaQD//h7zmLEUImnG7nYXl/3Nrgezz2/ms5NOfXcrIEM5+cxk4jeoceTq1HJ9gqRQ6NF3LTv3Dzv4VdzIO44qsZOB22QNLfVIjly1Pk0Ounrp1u0Pkg5jedB8RUIKx1Ff08SU53TWbAoUvYI28WR1+A6f7FGW2fddSx4qdNYsrVBBYJBvI6L3kA65y8AxvXrTujkNmxUHrAfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BhaR2h5imYVwEKKxZokIqeBy9ilFw6nihf00AmTdlI=;
 b=fha9y3F8zjIN2FvWvB695czQMcPBGTd1ot4Cee89brRyuWdiVAyUF/b4TrN2I28+6b2lbAlB0aYvd0I6/sN8OjasYDFc/uG5M+ur3BCzu7c3SGbO6LxtIz8Srw0ih7EX7wL9c9X4o9oik/lFRsDkInTpBqPflgrkzD5TMm/ckDCYZIYxwFW6AciCGwSyfVTF6f2QSCvJ2tXVPJupPflZ/AmwU2uSl9wuTnGSKHrUSP8gdrcEhIamYIFXZB7XZLu4CgevL7CLSbN5p4Rp9LUWl8a1y8ew6G1Q8PFwQms7OkAbBuxHWepg0+6R+XAwRb+IJYa3i1QQqe6MK8TerXzoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BhaR2h5imYVwEKKxZokIqeBy9ilFw6nihf00AmTdlI=;
 b=jcq59Vr3Xu2niV1KcOjyFGu4UxfO7EmFEyJ4dAgjsikZlGmfw6w8ai1P7lYIfnn0drx7mrRLwso8o6h35Qv9EPouOE1rdlVXcZVO19SihLvJTofqQnD0pFkyJVg+HIFf1REbIYzhcZbNiOGeq/TLzLZpYXCF3c7H5xUb3kMXNwFWz0pwGIRaXZ0jscukQqh4Q3S4gU0S8FArW3p5iyX+OhlvL6f0hUCk5TIksVCXTz2IRQhHoQTIiy1oyfDMWbYMtiBHp/ZzlvGqxHyBKiR3UhxRWVXZTPnaLod0o/Bf+Yy/nELmerTgWikifnUJ+IMlwcBPXTqUxDPgoikjP5tKRg==
Received: from AS4P190CA0038.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::17)
 by PAXPR10MB5157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:285::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 05:14:44 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::32) by AS4P190CA0038.outlook.office365.com
 (2603:10a6:20b:5d1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Mon,
 5 May 2025 05:14:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 05:14:44 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 5 May
 2025 07:14:43 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Mon, 5 May
 2025 07:14:43 +0200
Message-ID: <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com>
Date: Mon, 5 May 2025 07:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
To: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-6-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250504173154.488519-6-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70D:EE_|PAXPR10MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: 80140183-58cc-4196-df1f-08dd8b93bf46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFo4cGlzVDdDOGVxWHpvbTdCdDhyVkhWSWdTRG03cjFtN2UwN01qUGFnZXV5?=
 =?utf-8?B?YWFBSnFTanMwaXZvalQzekFUb1V4ZXR0ZzBMaE9HbGZ6b0Z4d1hsOVFDOWtr?=
 =?utf-8?B?TS90VjdTbm9VMHYwT3NONzBZd0ZrYjJLUnVYa2kzcGp3dWVQVGZBZjU0R1kx?=
 =?utf-8?B?dnpQN1dndEtTWEJjWkxkbVY1d0p2b3BGbFRlRFpld2VQMnpSSjNxZzdmTUE1?=
 =?utf-8?B?aFh6VjM5NG5hd3ZQdTkxS1Z4WHhkc2NWaWhKNityT29JQUdMQlZPckxYdGc1?=
 =?utf-8?B?UTQ4TUNhWGRqciswOFZLOGFLT3d1VHZMek9NWXA5WE1iVVJXNUs5bmkzVkh1?=
 =?utf-8?B?c0tGTExRZWozNkZQMVpiQTFIWEswOERYYy9aYzY5Z0h4Sk10VnZia0FkNTN5?=
 =?utf-8?B?SFI3YzRkdmw2SThuUHgrcDNQZVdHSzBNdVF3YzFkTVcyLzVmYjJBT0dOWE9z?=
 =?utf-8?B?RjF1WVZMdnowMG5lOUNzQWF3WkJPTXFwcDdWelhaeFhlcWlaVzRpOVJyaWZR?=
 =?utf-8?B?WFhhUDR1bkw3N3I2bUE0WUFhT0FSWGZYaXdmVHczRk9YMXF1dDQydmJEZGQx?=
 =?utf-8?B?WVZYVUhGcnJUUVFNV3NqUU53RVZjYjBzTXhvdnR4QUtPOS92UjFVeHQ4dmZZ?=
 =?utf-8?B?SG1LRm1MNkxFTmpQSVRzK2xsa0RoS2h6RlFMbEM2TUpHRzI5OHFZMVQrUjBi?=
 =?utf-8?B?NmRmVkFQK2x5K0kvQmVLanhkSE9JWC9zT0pRVWE3U2lYais3dWRxZGFsaWFV?=
 =?utf-8?B?MFk1MUJpY1dGWmhxcnhZemZCTnAyMHd1QUFjWXF4eVNCalJnVk01UmhpQkNN?=
 =?utf-8?B?Y3hWRWMyQzVpVlVKNTMyZWcxSTNjbGRsMnptSzFudXhVUmxNTnR2Siszcllr?=
 =?utf-8?B?c0FEc0IyUzhjcitxd2VMeFBjc0RDRGRRWDVGUk5UM2dlWlEwTFN6T3FxNnow?=
 =?utf-8?B?bWkrN202VS9HS1lsbmdTYW9sUXYzTXJKaVdtMFBETjlidWNkb0xNdk1ReVZo?=
 =?utf-8?B?QlE2UFdJRnNPZkM3UHBEaGgvMllZUUZqZU14WlBmdkJaZHJTdW51M0dJOTBU?=
 =?utf-8?B?cERPL0tXbUV2UW1HREp4V1FqRkVOd1JqbE1wS2g1ZlRzRnI3U1RscEFWajhs?=
 =?utf-8?B?TFVPMFlwZ01CdWdTT2NaR0pwcTRyVSt4TzA5amEyRzVlc2NBVkpPOUVoRk1M?=
 =?utf-8?B?OG1LcGFpMUhkdUl1NW0rTUE5YU9HTm9DYTRDSW9tN0xTL0hiZXA1K2UyS3A1?=
 =?utf-8?B?d0d3REpZVUoya0NYNWZ6TkNnYmJMY2Jza2daN2tseDg1WW1OcS8xeldxSkpt?=
 =?utf-8?B?UVdCOUFrd2pwTml0WFZFYUJ3TjRzYm9wZGJsVjJDVXhEVWJDWS9UcVNFZUx3?=
 =?utf-8?B?cVI3YlFFN0xJUDAyV2VKNk1Oampib1hodGJZa0IxbmlsU29TTVpTdW1mUURB?=
 =?utf-8?B?OEM3cTBnRmhTWFdrY0hBd0UrRW5WRUQzdE1WWGJGcUt4Sk1jSHkrcXNQMmho?=
 =?utf-8?B?TS9jcXdtdTRiTC94VFVYdjdDcTMyT1Q5VzhGMFZybGVtd0dkQXRKQW00NDVC?=
 =?utf-8?B?OTZFSXhKVUY4MDA3eEkvVEV1TmIxNlRJc0xiaGZjSEdtVWFEWHJKRVFnOVhq?=
 =?utf-8?B?T29oQmlJM2lGeE5Gc3NVQm9sZWpiRGtTUUMyZWFnbVY1MmFqL0JPaGM5UVNL?=
 =?utf-8?B?L1dSaE5VaDIxdzJCR3FjYy9BaHdqYW1IczFpenppQ2pnUkRkWk1pd1hxMmlP?=
 =?utf-8?B?MHZXUVdIZVJscDcwR251dDBmejRjYTJBRWhJdlJvS0JhcG9SaWdDSWEreFNS?=
 =?utf-8?B?bTNqQkpmWVFRMjloL2tyK1grc3Vnc1hwZi9ZSjRRTGJNczBZbkxVVzBkbGty?=
 =?utf-8?B?R0k5ZllZMUhXaGZsL2hab0ZJVGZKWmNNUzMxUys5RWF4Y1FKRWFibmkzZzdT?=
 =?utf-8?B?dUFvOTQyd2Yvb1hlMVFRMnhkSUpvWWxaYjI0QTZlN3E3VC9SdXRjaUExZXkz?=
 =?utf-8?B?Rm8xeEZLcFA2cWxKcm9nM25OUUxoUS9Qa25GTmtPYlI0YjdjMVhnR1paNEpV?=
 =?utf-8?B?OTVhSy9hSzJpbE5zMEdRQXB4ZXo2Y2U5TnRKUT09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 05:14:44.1309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80140183-58cc-4196-df1f-08dd8b93bf46
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5157

On 04/05/2025 19:31, Remo Senekowitsch wrote:
> This abstraction is a way to force users to specify whether a property
> is supposed to be required or not. This allows us to move error
> logging of missing required properties into core, preventing a lot of
> boilerplate in drivers.
> 
> It will be used by upcoming methods for reading device properties.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index 6ccc7947f9c31..59c61e2493831 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>      }
>  }
> +
> +/// A helper for reading device properties.
> +///
> +/// Use [`Self::required_by`] if a missing property is considered a bug and
> +/// [`Self::optional`] otherwise.
> +///
> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
> +pub struct PropertyGuard<'fwnode, 'name, T> {
> +    /// The result of reading the property.
> +    inner: Result<T>,
> +    /// The fwnode of the property, used for logging in the "required" case.
> +    fwnode: &'fwnode FwNode,
> +    /// The name of the property, used for logging in the "required" case.
> +    name: &'name CStr,
> +}
> +
> +impl<T> PropertyGuard<'_, '_, T> {
> +    /// Access the property, indicating it is required.
> +    ///
> +    /// If the property is not present, the error is automatically logged. If a
> +    /// missing property is not an error, use [`Self::optional`] instead. The
> +    /// device is required to associate the log with it.
> +    pub fn required_by(self, dev: &super::Device) -> Result<T> {
> +        if self.inner.is_err() {
> +            dev_err!(
> +                dev,
> +                "{}: property '{}' is missing\n",
> +                self.fwnode.display_path(),
> +                self.name
> +            );
> +        }
> +        self.inner
> +    }

Thinking about the .required_by(dev) I wonder if there will be cases
where we do *not* have a device? I.e. where we really have a fwnode,
only. And therefore can't pass a device. If we have such cases do we
need to be able to pass e.g. Option(dev) and switch back to pr_err() in
case of None?

From the beginning of our discussion I think to remember that the C API
has both the fwnode_property_*() and device_property_*() because there
are use cases for the fwnode_property_*() API where is no device?

Thanks

Dirk
