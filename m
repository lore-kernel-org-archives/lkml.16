Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020097.outbound.protection.outlook.com [52.101.196.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757EA28EA;
	Sun, 22 Jun 2025 22:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750630641; cv=fail; b=OQvVKlgllSgE8hof1JUu/Iz5uzPDR06y3dyPWpiShIJYsUZ+K1ALSKojzC3M5J3R4uFrvO7EjCFUFCnpESFQlatnV4OvQlhnjOb8DMuEQDviIsdb+IkdkOQjtov/jlKtyKZh1F52YLV/AE8GS2m3a+6/T+CPhL4ITm41E83MJgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750630641; c=relaxed/simple;
	bh=SxuZeARWGqJsicqjlJ/UWveNuAmw1u3M+/vqyLQHMkc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YFeapuqryDzfgTULqAm6VMRCX4ld+FYZc9E3UoV62NW09+qTPf57RERsj92S4DSz6fkb8Ew6HCLWJPQFx5n+l5HGactRxRysNLdTCjNckJGrt9ID1pd14LebYlSvfLboyn3SpJeUGQ4OfVMTaSnt4BoR6IvJAEaZFsc80Wsj1zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RZJ16B5a; arc=fail smtp.client-ip=52.101.196.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RZJ16B5a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sABiybQJBIMdGd2xa5VAi2pbVAcI7NM6Aau4Qdzu8Kq2Iw1DjH6/feNevjwOBlnaxrwgqqdHrAJ40q6SPitvRcI5g4fPfqycWrcI/vS6xAy+UrOAXD2CiqD97IGymMgYynjRRcEyzYIp/75RDLSaL8iYgHukmZcuDcPROzt2BW0/IX0fdKLId0q0hg3ves1dVx0OaxNYiakrcO3jsV1/NLyxgND8Wx9rMFDTW7MgJddOJ79YShcNoisMJoeCp62EldNJXJCRwpQ3zi7eL1m00yrvoH8jGXHwRZjMgHI0sLSI3Fbz5lB1SlngsKPHSbOZ0xAgP9k4oRQe0hEzefoPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGr1nfW4jFF4SlbI5IU8YNFnp7XzRFYlGmbN/mlrBlM=;
 b=cMJOFS0Iw1/WV3mnpeLJh6Uq64adFFJoEP1mtWLgwqdJ+/+ArUaU72ehuHKVLwCSs5SlD4hnRYNCKUrLge91p5nWGBB+RZrSumJkgPwYR4OsY7Aii1I2ihKGaoRvrv4DDTfWLm4MUrjK533PG4nr42qZhLwqbsEZ4TiYki7Bld4rk2+6AbLPOZw1a20Ic2LkaGUHlMNz+ZDgB4nYBBVRtIgz++2p/RDYWuFi7CiasTibmAS7aHVnspBvIGdA6I5BcEeA8vPg47sWV/x0H84hx1PvudhHz3bVMKR6G4ZPHJPHBDMB35aCkeo4/rN4URSPHyBsjSP4SPrvwfz8p4OIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGr1nfW4jFF4SlbI5IU8YNFnp7XzRFYlGmbN/mlrBlM=;
 b=RZJ16B5a7S9ddmJT+zoatWVlDjnECtaTkKYRJgDjTm7VfAsqv29jPviWnopvBD6YWfGhjszGSHwqB7JqP2yGpJFSRgjpFD05b5943Qvtci/9VflZqcUlkAnmkSQBd71z+XAiQ1JsrpVf6+rwyiBAKwYWtjPq07qh7PNlgqC5zxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO4P265MB5993.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:292::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sun, 22 Jun
 2025 22:17:15 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.8857.026; Sun, 22 Jun 2025
 22:17:15 +0000
Date: Sun, 22 Jun 2025 23:17:12 +0100
From: Gary Guo <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Gary Guo" <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Tamir Duberstein"
 <tamird@gmail.com>, "Ingo Molnar" <mingo@kernel.org>, "Mitchell Levy"
 <levymitchell0@gmail.com>, "Lyude Paul" <lyude@redhat.com>, "Wedson Almeida
 Filho" <wedsonaf@gmail.com>, <rust-for-linux@vger.kernel.org>, "Fiona
 Behrens" <me@kloenk.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] rust: implement `kernel::sync::Refcount`
Message-ID: <20250622231712.4f6aee00.gary@garyguo.net>
In-Reply-To: <DATD8G28N47E.HWFYVQ7MRX8P@kernel.org>
References: <20250622125802.3224264-1-gary@kernel.org>
 <20250622125802.3224264-2-gary@kernel.org>
 <DATD8G28N47E.HWFYVQ7MRX8P@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::17) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO4P265MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: c808d298-34af-466e-18bf-08ddb1da8ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5M4Z8fNJoUizk4XyWlfL6bNU0kXBJJM5/AxFCgD2iW/08n6APbQpL0mpLb83?=
 =?us-ascii?Q?Ozj2kHgDKwdYYODwxcfMlRdTpNyP1J6mFXMEpc699FQlGf8UWe+Nrjm1CRXT?=
 =?us-ascii?Q?4H0niMvOdK9zgXB5dKKx/NmrCRd+8c8CKv9xA8idQmo7LdDocUbMv/eUXHAo?=
 =?us-ascii?Q?IzFfPUCJkXESO5r5LoQlfZtgqUBSeRGTyFLs0gsscAMh02thEpyShyvseHXy?=
 =?us-ascii?Q?4gicwVek97OnlMud741Zd8Ck8zPDBRzMJ4PKtwLCUfy+WYJxEbPiY0zpza6M?=
 =?us-ascii?Q?YKYkKxb+rMOkSk8crg1Wzrcb6/qhTWbXm0u++kyKQ2juUUA73ebE4hz/OVs8?=
 =?us-ascii?Q?6aK3QixfQVfn5B00F+zRlcfecP6d4o5MCl2kEj/Oa08w9a9UVixy8Bt/kzm0?=
 =?us-ascii?Q?fMTemP48iq3Ra/Rx6uSmEMJQTVLZoYsqqofAKhyTYFjrPHjfGNc6Yfl29lMR?=
 =?us-ascii?Q?bIWI/N3nXBGF5LH9kiQ+cZeAG2hzKavaqDju1o88ROQvZoTim18FywDjqUY6?=
 =?us-ascii?Q?39piO7hXp4gOFmkKkjzj0n0TC4RJii0eWq+txU/H0M8Pp0Sfj4juk3k3Zq/u?=
 =?us-ascii?Q?ViK/yxsJC7o9xwPirdF/d735ywyms5UX/RFFvob36Zf8bkXZGc0Y+LJzWtB4?=
 =?us-ascii?Q?4ztDkObtl9eJ6XRD2JepiQ+zx9axNCPpv/XUYBKGwL+BUuOBrHZhqFFKOr05?=
 =?us-ascii?Q?J1LpOrdq0UDvq7iH712wzsVSv9p/XaKjgcCue9YI9pyhyuWZXK/6pF+Z9Y65?=
 =?us-ascii?Q?1oWTxRrmQYRRfDOSCuvALdk5t0dTUH822Q0Urd+ZbWFZGw0WazGelkpIfr+M?=
 =?us-ascii?Q?+tBPZPezrouTTWDFbwkHdIhbyX6KIUE0Tso8BvEj0SR3PNiB+nHGS7SNW0dK?=
 =?us-ascii?Q?VOE+4an0x4q+8LGsUU/iEPmQsL2o+hh28msK3Rwvx9RQkjIhCN5W1ABYwEjG?=
 =?us-ascii?Q?q/yRhhHpASyPWso5ztmqgaKcINoejc+ncy6wkJGZtIzxUNdDRBF63dvDOKoA?=
 =?us-ascii?Q?JGa/G4xms+uczgwMYhcvYBjJ3/zTvFhmwuaaHSc7kliVeo4elFAJ6BQf2Gsc?=
 =?us-ascii?Q?546nU/+urQJfwj9aur7giMfEvTSITqi9iHI5wEIx5nKFIWRS5ocKvQSDKvzM?=
 =?us-ascii?Q?krwloSj+YWSdf+YdeHLfOtjPsRFxaSrTt3MrJsJocyFpPbR96k3fnWh3PVc+?=
 =?us-ascii?Q?e/upBjqDff90PTW5uJufmcBGDRhlUxfXQ5LtcYxMahKkA3DVdHH4fHXz/tpN?=
 =?us-ascii?Q?x+Fh/4Mr+sNz5YSkIgkB22ua8tEfH9CN54vz/GZvTfw5W/V3R+T/h5+L6m+w?=
 =?us-ascii?Q?GsotBBfEXmDp7gajSKjyII0LG7G44oGPpzdSEk/x4VfRIwHAY7lbXteHgYWc?=
 =?us-ascii?Q?AJCElxLIIBZZXzUpjhng3r+UgWMP1O7UaUqM5mPCjt9TuBmtl3QsyOg2KHuE?=
 =?us-ascii?Q?4a5ZqwR/N/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tLNoMRqeDPx9kw/zcHoMdTcBwako+uVfzvmZ5I/2pomrGKayD2KSDzMUQ73t?=
 =?us-ascii?Q?ARC1a16588NJX4U5YUOyHorcD6MOk8rq+EceDQj9byWgdQFENdFxrkJJUf9i?=
 =?us-ascii?Q?9sBx0KeBy+v8DGlX4R5O3PLTPjTA5ZqG66VbHJWQBHBWXowxGb3hqrJ4H60M?=
 =?us-ascii?Q?zPHbM0gPEqfbk4KmJv2AYD+Q/GmAEmwIQ+Nbyw2QoJ+bRh++8MXlDHSR7bnG?=
 =?us-ascii?Q?PTB1FV+JsdZiG2cKYgZvO8WjgjF9cYQBs+3NabkQVVSdqZPTFeXHUE5h6MCK?=
 =?us-ascii?Q?yUbq7aXaX2xX0Y1dvYqOBqyuPKUM9OV0VCtXBxqLbwZ0g1a3afI9yJ8iN5Cz?=
 =?us-ascii?Q?3M2gwgz6Uzui+/PAB9/zJguo4oQUJ9NsJ9CkEw4N9EKNsp16SfwamtuGkPB3?=
 =?us-ascii?Q?mKCmVo6LI9Vzeqkexb10iFwAq4kkNgHnmQWklufCkyStsNqQbjnfAlVuOfyt?=
 =?us-ascii?Q?Trj9bvStjcY+mivcEl4l7K5xZ5Su/z8BL2dmRWWWPH0h04PV34iLtjMsZ5hT?=
 =?us-ascii?Q?DhbuL8wTseAt8CoY/s9Gwliuy9SbeR1qO4+klpqp8b74d6BtfXyIf62l/qpL?=
 =?us-ascii?Q?Zwzvb+bBmySOgoFTXmPAzBa1YHlw0maiizHD7YaHEfsQFi3qykLIdQHV7mi3?=
 =?us-ascii?Q?L1+npmZpYdjgtpOR2jdpBV8IWfPaysmUTjm8fhbj6v0Ym2JS1+rPF8ugnHxF?=
 =?us-ascii?Q?I9dH4DmzzrcZl79JcQ+gToZmh1vDi5Vt6K15cYW+IY3qJCbnmGVG8HjeoP6r?=
 =?us-ascii?Q?S6XarTA/viB+wUJzKCDewTGtwO5BRK36dzhvfi9Re7ZWBrKkHqA44BMmbMok?=
 =?us-ascii?Q?ZaZjL6Uu0q3LIX2ldAtCtN5deXbV6prHsrO8b83H5FM81/5F7mJ6r6RzJ1oy?=
 =?us-ascii?Q?mZN2krmV3LglFaUikO3fPNx4kyM+3QGwzI5yxIRm0keN37KgaIFq6NcglWJW?=
 =?us-ascii?Q?dUo2cVhxkaqnvJByxVGkvlgEkk7/2u/ci6Gp2hPTRqXVejQBwm0sftXLRDuN?=
 =?us-ascii?Q?T/iL9Ap7eGlcQHqwK7+euhlUYsqpjQLH35JDqR7WxQfGwiWPEZq2M6GMYHgg?=
 =?us-ascii?Q?nF90dv1xKZ5S1x4B3lBo3H2YZmb5gEyP+loKvAuKKv1+tH9Zecp64/EX4xXA?=
 =?us-ascii?Q?zmdC6oRyFYBovfnpkcmTBHSSqPvbOJ0sKnV3lVNedvkjNUk7GhRigw2xbjdR?=
 =?us-ascii?Q?9NCOhvUdyPN6ijudUWQY7IPX9T6rcwWnYgyxJNYf+daPtUHpTtuVipLFjd/T?=
 =?us-ascii?Q?YZVO4zMW9oYGIPo2Om4/eGXy5WrQLI62DXB9ePI2KRfyXrSx7xZima+7KKw8?=
 =?us-ascii?Q?I2whwCBR7p7yZDdx6YzxD7+azPXDVD1lisxEna0l4ydmlu7v3pwWZPAHj5ZM?=
 =?us-ascii?Q?18Ykz9sPAOfBhG5YqrZRhXnJVjEUMqDZrvAPYwAjd8XnkZ/PmdcPsca2D1RK?=
 =?us-ascii?Q?/yc6OIlFiXrlXhZV//9Squ3GoSDsD3ViMRLujO/bqdVXhsLpFGVPezl38SJt?=
 =?us-ascii?Q?KsvTFY8/yCyyYhahly6GRDs+9zQtTTLnoDjfpVaeoIqEOfyq7uywz+75qSEv?=
 =?us-ascii?Q?HFd0/cUSuz3jBDCTZ0d24h1/1PpGx5lUnzTbm+ol6kTtVzq9z2xziL/EedIe?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c808d298-34af-466e-18bf-08ddb1da8ae5
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2025 22:17:14.9996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGhYE0WNOx+4dxPr50xwgay9xsZdLs27uYrl8vj7NPdKK+bfnCm0mqVbRFW6ZSHGmJl13gNotq6Y/GsrO2f7Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5993

On Sun, 22 Jun 2025 23:05:09 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> On Sun Jun 22, 2025 at 2:57 PM CEST, Gary Guo wrote:
> > +impl Refcount {
> > +    /// Construct a new [`Refcount`] from an initial value.
> > +    #[inline]
> > +    pub fn new(value: i32) -> Self {  
> 
> Should we really allow users to set a negative value from the get-go?
> Here a `u31` might come in real handy...
> 
> > +        // SAFETY: There are no safety requirements for this FFI call.
> > +        Self(Opaque::new(unsafe { bindings::REFCOUNT_INIT(value) }))
> > +    }
> > +
> > +    #[inline]
> > +    fn as_ptr(&self) -> *mut bindings::refcount_t {
> > +        self.0.get()
> > +    }
> > +
> > +    /// Set a refcount's value.
> > +    #[inline]
> > +    pub fn set(&self, value: i32) {  
> 
> Same here. We should of course provide a `saturate` function, but I
> don't see a reason to set it to another negative value.

Well, it's unlikely the caller would want to init/set the value to the
saturated range, but given that refcount is effectively a thin wrapper
of atomics, user can always obtain the atomics and modify the value.

Also, I did a quick grep of the C refcount API users:
* crypto/algapi.c uses -1 as a special value, and has invocation of
  refcount_set(..., -1)
* lib/stackdepot.c has a invocation to set the refcount into saturated
  range directly.
* There're a few cases where runtime values are set, so `build_assert`
  will not work for these use cases.

Ultimately I think it should be fine to expose `i32` to the user of
this API. Use of `Refcount` to manage resources typically require
reasoning on the user side, so unintended error would be caught that
way.

> 
> ---
> Cheers,
> Benno
> 
> > +        // SAFETY: `self.as_ptr()` is valid.
> > +        unsafe { bindings::refcount_set(self.as_ptr(), value) }
> > +    }  

Best,
Gary

