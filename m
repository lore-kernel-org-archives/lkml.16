Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFCA1E9B23;
	Mon, 16 Jun 2025 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750103524; cv=fail; b=A25wsnuD1PlmHtjtBvpy3DIUIpkiwqRXv553CIgyidu3tpMp1YJASTiI9GwgCNs07rFVxxOQQcTZmdooDnIVndp/Ukkdx11RmQvKEId/wur0lb4knoe1hbmGFijQMGioBqsVodkqVbSSb0PLzGe2aKO2tJwqj+FDGpnJBvd9tmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750103524; c=relaxed/simple;
	bh=8jGUlUyCunom/dURtofOwxnNzGGDRmWheozmUWKiC2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UojARDI95Y/+GYcGSw2FE1L9RqgQpBZcqogGOnfZ8+otFzPolLb68ZrkuWwqMPDYAxgnnRN2sIBdW636pLFIOZbu7VCiqYcaPB9UTTsOehKYsrZqF84oJ3N9fsW/3al6Fdg6oiBdbmz5dW6lsYhNY3NSLG8ss8fIqoZ5hKBZzLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QWAy6DKV; arc=fail smtp.client-ip=40.107.92.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QWAy6DKV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBGpfdynpWOTtJUGM/i7zIpAh8sLImirdFoXOkCn7nyutOgGxoK/weJLZxpX/jGt2pa0vrlXZs3AgUL6h47Q9YZqYg7as9IEWdifIRNwQ7zP+PKBmnZQNUvRCuVk9CJQJacP6hBRf6f28Mi9o1+F4oie9vrEW2NJ83TX8Tct3IR7srjNB1SeMN+6eQDB/TwQspptK4uZ2KUC0To2Nfa+uzy+Mwp5QkCnkUKxOOpHYVSMS69Pig+8cDlHMnpH1ILSz9i8R/sjaTCgi0184isrKfpl+TYkvuRn8HrpgyDy/UYwTuO1p8rDmuPWm9U/0D8rBvsmHNb6fbmzyMjYQl6d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1KuQ3OKZZBJH2RFcX+oNkQugmcTxnEv38UcLx6xuGE=;
 b=rJvVG2Yv+bweeiJXcn3If62Ffq8xlQmKn/xJrA1M5xTE4QoxItYu2MgMl7lj8luv7koVqk4jE4+fD/vSiiGtwD82N71QCE1wn5IdIYoH726my+2ozcYfOhZ6xiAJrmyOi0z1B/Cvl2SQCweAMkth+P401J56tAxFka8JjoN0+XWIAKd1FWs6B/QMJw7UtzBPAAmyCKGBhE+nWZWFL6ulTnj6UXrNZ40O27bknwVXElUdXan9qTGKean+TthjkIRWMQKGV08QMWsEH9ZGoNZtwk5xhXEVQ79HSYlWN3os5HNi7U9wX1Y31aG2oWL87Z2VEZlo5BLeQMqHzbJCw/M5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1KuQ3OKZZBJH2RFcX+oNkQugmcTxnEv38UcLx6xuGE=;
 b=QWAy6DKVvP0gDlB3VPjuT3TJ8YrIfXDJixukcKzYRgS8SSi9jYaDx24ewQLCn3R/HKYy7lPK8BnowUAg+q53aH7gwVBeomSzIrn++tsiOt/l7Wbpd+uHCi1wClkjx2bvOoveDquFddjvtWeDN2Lkk0yksVlDCxuTKm2LZNYEzNINzMVu2njYnK+K3o/dATfI2pvbzx4u0LclOmRy/rRRxa3kxSt5xC0j8ZMIdiZWZSRKz/Z2faoc3P4BP7eyIoItxNoYnTHdNKlYZqyovxRIibX4I1L5wLZ/1a7Gj/CJqnAVtJEVIKKbTo9DVFWIPZg74XgKSl+rtLUYTPPAol7QOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB8058.namprd12.prod.outlook.com (2603:10b6:806:348::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:51:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 19:51:56 +0000
Date: Mon, 16 Jun 2025 15:51:54 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: Re: [RFC RESEND v10 06/14] rust: sync: Add SpinLockIrq
Message-ID: <20250616195154.GA921422@joelnvbox>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-7-lyude@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527222254.565881-7-lyude@redhat.com>
X-ClientProxiedBy: BL1PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a456d0-8c1b-43e5-ab12-08ddad0f3fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3/cTomlw6KqTsbIYqp1rQYRZtTxUV/WYLKkrrE0SLOhMEaReku8l+bcoGMwm?=
 =?us-ascii?Q?K17dEmMI5Npwz/LCQDiGOWJCOpJr1yzzgl80JZzw0d/RZ+j9nqPl0ZgAGrpP?=
 =?us-ascii?Q?YyrtPgNOsm27coXdnzuvZM7RPMOF3tXxDs2suzXX1Y1G9hEc9JMhQxj2y2a9?=
 =?us-ascii?Q?5dPo05+CWmdhZOsOlDMZ4RWHKoPR4b4aPKbO+8LLsQkJiRjeIpOBJJQ9IoKr?=
 =?us-ascii?Q?a5cn5sSWTCkuuSOloqDnsKeWEMF+at1mSGIB91lFXtJX1D4rVLXGbZomTswe?=
 =?us-ascii?Q?rNL5z6BtWBUqQFbzDpueA01asMVUxWtwtWOWWeoJfoYzf1IcpnYd7z1oiJfv?=
 =?us-ascii?Q?jXV+Ag17whs7scXCePNukHQ736SHr805IHLziulfVQcjNqZ4AoHv8n1U0LCc?=
 =?us-ascii?Q?8XA+wvmhPfrLe2wLfD8MAl03zr3JxkXqEzB8APwMhG+vmR+9r8YFLJdrsGcz?=
 =?us-ascii?Q?n/F6p44s265Q0BkaLr/e7rix68hixH3kwMK+0HSfafKwM7bzLj/LeeVNqv3v?=
 =?us-ascii?Q?6vOYeWwu+ym70adkr/g6nLoPnz2dM0XAp2U+i5HYJzfGvNRpMu2RfUTOe1XS?=
 =?us-ascii?Q?il7ikWl2OS9tKmno8cgHY+u0eP4zbGIS4jN3M5JGPN0ct2g1+JhTb+ZNOf/j?=
 =?us-ascii?Q?JGH/sPFCOoscmf2FUcabCd00u5Md+UjWbBJfYifDttn0KwluGzqPfgqftrgu?=
 =?us-ascii?Q?JRTD9aKjQdouNqDkO0HKMu2Bwd7ztqL2rSDSjQySRf6W9WAHZg+i9W7gGdbF?=
 =?us-ascii?Q?Yed1rVXhLDyN9Xk7mVj69Aa/IaEclawguAht9Jm0GcJg7phrg+w5/PLuu1Hh?=
 =?us-ascii?Q?NM1geJn5d0JDLv8tLqA8Wj9yPRY9+FXzzwwuamqOwe/dnlIlPSQaAVjtT0Dh?=
 =?us-ascii?Q?Sox21pEGtSwoPT4W7U0nxLpm5OgVDZbC75LdmpCJqzYlxkZ+oB3Mo1qvBIWf?=
 =?us-ascii?Q?x6kOLy1ktsZQthHl4BUrLzk8i0nmIfQXYPrfqO3qRCvU+ynvCiKV71tYAwX5?=
 =?us-ascii?Q?1dTHakdjh1mp+4Jy13EUlVHYWqw3H1sJIaT/hWxlBMLhixCNltWahMnbp0Ce?=
 =?us-ascii?Q?oTxXMdQ3df5WgjiZcg87lSf6BAGdskGiCupvKSeUsIYJI5ISpEQTl7QHn0/U?=
 =?us-ascii?Q?dRriVc1eRBPhDg0K7zn48S3RoL9z2ioBx9v8pC+eOzjz8yrUIUU2KmN2sdJ6?=
 =?us-ascii?Q?azuw/qbrPZeG5Pcx52MUpqRksP74ejJ6rApfHZqSGOR7pnJ7Pw1t5sFqxGwp?=
 =?us-ascii?Q?iyEuWTr79fe7Eo0wfAHA2qBO4Wyk3sg+VHeOUNcVwCG3gedCBTObLX9t4lK4?=
 =?us-ascii?Q?Y1cK7TCYMxw1mYGleY11d/9l0Knmo/UaJSW3NwyEU4mgKkZZPWYBRvCcDoAI?=
 =?us-ascii?Q?r9PzkDcXrdtQY/8VX4G31BuXJR8IP9BDVu+bOXLiVpt8S9ubw+D4Y8ln1suy?=
 =?us-ascii?Q?hvZmhuZphMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NiVEOK05BpIiE5OZdqTaGDm8S+//krJeY/Axl5XJM1Wd7kyR5MJw6wA7IHcd?=
 =?us-ascii?Q?/TrWW4zp9fpzKa4oyqDp8p2u5FqLaAsvlzQjFo9xzj2Ds7NIVoF/7GIJ7BO0?=
 =?us-ascii?Q?EF3sisKv3Aii/sGIL3oA5LWOI4M4IXaPh8dxpjjH5V3RjAzK/LXsrMwsq6Js?=
 =?us-ascii?Q?b8lU+WofFrKHzrGjKYwWdtuTgw6aFmKL62keQjW3N/prw1raY4qFVRvu5D0J?=
 =?us-ascii?Q?0TGbZqEeQMod1vcYjeRMbvX31uURpOvHSwD/SI8qR9IpAMtIEIySlcMX7Szo?=
 =?us-ascii?Q?7GE3i1squ0/xRj2Ity3KYUdQlT0Xs519bWv/tP0QfPEQ6G8dAzD1OoBxN9Wl?=
 =?us-ascii?Q?RxgajDMXkFqblWTbyOPejn2fZHW1/HujMtqNKxpGcLM0N7R6C2ROyjIJvuOg?=
 =?us-ascii?Q?iD4SDGGudmjd6RenaXogYApM8u5I5022r/1gkWhw95R9hgUF9ZuK0XzYNJmZ?=
 =?us-ascii?Q?1aoqXF/nkK0g1dU9YPCoPucSLdX0w6qRqlTWUMYdF7s/OTjmmy2AeU3CFfWt?=
 =?us-ascii?Q?2Jwb9aoeZTXpWvnJSFnmzjlLWmDl1P38FLs5EPWkk24BQPddo3dr0MKXmwEM?=
 =?us-ascii?Q?LGm49eT0ELG82naIQ5bub4khDaSVGt2x6Pu9SjfSQf57wiUksdxzBzy3Rzr4?=
 =?us-ascii?Q?1n7KmOBkGj61cDGq6uazocfzbi6EXaW2fZ2BQ2EbW3AigQ/Gg766J3Mb2OAD?=
 =?us-ascii?Q?HG/BbA0WjpHKcLBBNDZKimDrmyfy18lm7WXRvOMSc5CqcRp41k27FpoLEAVT?=
 =?us-ascii?Q?qPHS+IZFOcS4TE5D14Er1AfD056MtSA5G/eCshgklvInC0lW+GG/vOI4PSZW?=
 =?us-ascii?Q?Zssd47YFppi1E/Ok5WcGLLzr+X9Rkny86YPm9yhLJLor81N6zTC6WGA0YFG9?=
 =?us-ascii?Q?VPT/XdkasPUzJO3g8+ktxHMgp/VjPsTidXI8EulHTtpMC4N08/xYiZebcEUn?=
 =?us-ascii?Q?Ky3HwC6jv7OzQVoBsoPvyPyD4lhjnJ1oUfVOZ571FwOMblMHTWLYTp3hvJc7?=
 =?us-ascii?Q?rl9YhS2+7vwtioKFQ13V0fCTfr928lQfchqBpUq7DVQinfBxI5a1TZKDHEX3?=
 =?us-ascii?Q?zc1nwapsh/dcW9ZbDUOlHEKdJr73iNdz4lgNAdU9pz0M8Bj259/EDa/cR9H0?=
 =?us-ascii?Q?OFzlBbPnQS9NVM6V+lU26xaXkfiUxzqiG8U/kXBAxDRVdsChxPz1ddwxONxf?=
 =?us-ascii?Q?NYlcXXTzn/oZ0inu6rMAzWI6DYcuOV0Cc07DzudLC9zsjN5l94dcWj83ShGp?=
 =?us-ascii?Q?j/rM4SOOnkYbNrFLjka418HwpUPCaaiX3W4nYElIc9lXd5H9hWTzXuQ9tlXq?=
 =?us-ascii?Q?Wa1no9JqpJr+ZBNQs0JJkJwzf65XjovLfQQyXYINXwKoOZFK7K4ykJ46w2tc?=
 =?us-ascii?Q?mMelpMGPruR/aHiT0k589O9jIQB21O/nEG6iFR/QQQGmP4Mz/gNxwRlktVO9?=
 =?us-ascii?Q?mwxtGNHA2zQJkn401s/d9S8GKPy9Q+3Cris0+/0e5DHsvrzsI7qL6Ez8hD8P?=
 =?us-ascii?Q?J/imrXr6+fzm7h2crwV2ry9zkwdbwo51gDAonW2jgfN2BTMedEHhG15thtpm?=
 =?us-ascii?Q?JwrYf59L0gFa8asgTJuqw8uD0v7nJZ0rA5r31Q0N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a456d0-8c1b-43e5-ab12-08ddad0f3fa9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:51:56.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP0AMJTkDQlY5P7/57kBWLkT+SRBr3D028zpixn4yFvOCz2e6Y0YZGGQ+Q1vUsKgW51nshKIrNRYu2h3HQEHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8058

On Tue, May 27, 2025 at 06:21:47PM -0400, Lyude Paul wrote:
> A variant of SpinLock that is expected to be used in noirq contexts, so
> lock() will disable interrupts and unlock() (i.e. `Guard::drop()` will
> undo the interrupt disable.
> 
> [Boqun: Port to use spin_lock_irq_disable() and
> spin_unlock_irq_enable()]
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-Developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> ---
> V10:
> * Also add support to GlobalLock
> * Documentation fixes from Dirk
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/sync.rs               |   4 +-
>  rust/kernel/sync/lock/global.rs   |   3 +
>  rust/kernel/sync/lock/spinlock.rs | 142 ++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 36a7190155833..07e83992490d5 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -20,7 +20,9 @@
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
>  pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> -pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
> +pub use lock::spinlock::{
> +    new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
> +};
>  pub use locked_by::LockedBy;
>  
>  /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
> index d65f94b5caf26..47e200b750c1d 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -299,4 +299,7 @@ macro_rules! global_lock_inner {
>      (backend SpinLock) => {
>          $crate::sync::lock::spinlock::SpinLockBackend
>      };
> +    (backend SpinLockIrq) => {
> +        $crate::sync::lock::spinlock::SpinLockIrqBackend
> +    };
>  }
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
> index d7be38ccbdc7d..a1d76184a5bb4 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -139,3 +139,145 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>          unsafe { bindings::spin_assert_is_held(ptr) }
>      }
>  }
> +
> +/// Creates a [`SpinLockIrq`] initialiser with the given name and a newly-created lock class.
> +///
> +/// It uses the name if one is given, otherwise it generates one based on the file name and line
> +/// number.
> +#[macro_export]
> +macro_rules! new_spinlock_irq {
> +    ($inner:expr $(, $name:literal)? $(,)?) => {
> +        $crate::sync::SpinLockIrq::new(
> +            $inner, $crate::optional_name!($($name)?), $crate::static_lock_class!())
> +    };
> +}
> +pub use new_spinlock_irq;
> +
> +/// A spinlock that may be acquired when local processor interrupts are disabled.
> +///
> +/// This is a version of [`SpinLock`] that can only be used in contexts where interrupts for the
> +/// local CPU are disabled. It can be acquired in two ways:
> +///
> +/// - Using [`lock()`] like any other type of lock, in which case the bindings will modify the
> +///   interrupt state to ensure that local processor interrupts remain disabled for at least as long
> +///   as the [`SpinLockIrqGuard`] exists.
> +/// - Using [`lock_with()`] in contexts where a [`LocalInterruptDisabled`] token is present and
> +///   local processor interrupts are already known to be disabled, in which case the local interrupt
> +///   state will not be touched. This method should be preferred if a [`LocalInterruptDisabled`]
> +///   token is present in the scope.

Just a nit:

Is it also worth adding debug-only code to make sure at runtime that IRQs
are indeed disabled when calling lock_with()? Or is there a check for that
somewhere? I am just concerned, even if rust thinks interrupts are disabled,
but for some reason they got enabled when the lock was acquired. Then we'd
have code failing silently. That might require implement lock_with() in
SpinlockIrq and checking for this, and then calling the generic Lock's
locks_with()?

thanks,

 - Joel


> +///
> +/// For more info on spinlocks, see [`SpinLock`]. For more information on interrupts,
> +/// [see the interrupt module](kernel::interrupt).
> +///
> +/// # Examples
> +///
> +/// The following example shows how to declare, allocate initialise and access a struct (`Example`)
> +/// that contains an inner struct (`Inner`) that is protected by a spinlock that requires local
> +/// processor interrupts to be disabled.
> +///
> +/// ```
> +/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> +///
> +/// struct Inner {
> +///     a: u32,
> +///     b: u32,
> +/// }
> +///
> +/// #[pin_data]
> +/// struct Example {
> +///     #[pin]
> +///     c: SpinLockIrq<Inner>,
> +///     #[pin]
> +///     d: SpinLockIrq<Inner>,
> +/// }
> +///
> +/// impl Example {
> +///     fn new() -> impl PinInit<Self> {
> +///         pin_init!(Self {
> +///             c <- new_spinlock_irq!(Inner { a: 0, b: 10 }),
> +///             d <- new_spinlock_irq!(Inner { a: 20, b: 30 }),
> +///         })
> +///     }
> +/// }
> +///
> +/// // Allocate a boxed `Example`
> +/// let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +///
> +/// // Accessing an `Example` from a context where interrupts may not be disabled already.
> +/// let c_guard = e.c.lock(); // interrupts are disabled now, +1 interrupt disable refcount
> +/// let d_guard = e.d.lock(); // no interrupt state change, +1 interrupt disable refcount
> +///
> +/// assert_eq!(c_guard.a, 0);
> +/// assert_eq!(c_guard.b, 10);
> +/// assert_eq!(d_guard.a, 20);
> +/// assert_eq!(d_guard.b, 30);
> +///
> +/// drop(c_guard); // Dropping c_guard will not re-enable interrupts just yet, since d_guard is
> +///                // still in scope.
> +/// drop(d_guard); // Last interrupt disable reference dropped here, so interrupts are re-enabled
> +///                // now
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// [`lock()`]: SpinLockIrq::lock
> +/// [`lock_with()`]: SpinLockIrq::lock_with
> +pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
> +
> +/// A kernel `spinlock_t` lock backend that is acquired in interrupt disabled contexts.
> +pub struct SpinLockIrqBackend;
> +
> +/// A [`Guard`] acquired from locking a [`SpinLockIrq`] using [`lock()`].
> +///
> +/// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLockIrq`] using
> +/// [`lock_with()`]. It will unlock the [`SpinLockIrq`] and decrement the local processor's
> +/// interrupt disablement refcount upon being dropped.
> +///
> +/// [`Guard`]: super::Guard
> +/// [`lock()`]: SpinLockIrq::lock
> +/// [`lock_with()`]: SpinLockIrq::lock_with
> +pub type SpinLockIrqGuard<'a, T> = super::Guard<'a, T, SpinLockIrqBackend>;
> +
> +// SAFETY: The underlying kernel `spinlock_t` object ensures mutual exclusion. `relock` uses the
> +// default implementation that always calls the same locking method.
> +unsafe impl super::Backend for SpinLockIrqBackend {
> +    type State = bindings::spinlock_t;
> +    type GuardState = ();
> +
> +    unsafe fn init(
> +        ptr: *mut Self::State,
> +        name: *const crate::ffi::c_char,
> +        key: *mut bindings::lock_class_key,
> +    ) {
> +        // SAFETY: The safety requirements ensure that `ptr` is valid for writes, and `name` and
> +        // `key` are valid for read indefinitely.
> +        unsafe { bindings::__spin_lock_init(ptr, name, key) }
> +    }
> +
> +    unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
> +        // SAFETY: The safety requirements of this function ensure that `ptr` points to valid
> +        // memory, and that it has been initialised before.
> +        unsafe { bindings::spin_lock_irq_disable(ptr) }
> +    }
> +
> +    unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
> +        // SAFETY: The safety requirements of this function ensure that `ptr` is valid and that the
> +        // caller is the owner of the spinlock.
> +        unsafe { bindings::spin_unlock_irq_enable(ptr) }
> +    }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
> +        let result = unsafe { bindings::spin_trylock_irq_disable(ptr) };
> +
> +        if result != 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
> +
> +    unsafe fn assert_is_held(ptr: *mut Self::State) {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
> +        unsafe { bindings::spin_assert_is_held(ptr) }
> +    }
> +}
> -- 
> 2.49.0
> 
