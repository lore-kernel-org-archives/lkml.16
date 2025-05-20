Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A921525D21A;
	Tue, 20 May 2025 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726827; cv=none; b=TTK+2vPVVUzDQrVUaWaF0ExwgX9jk7CORsJSdLQbxfn4PMttSYQHiDv/MQIEV+PfSc+xN+CMdIoCuDpxFwqO/wRGAhoLFtxzJIH1FJgFjAuTNVcxjvTVewhjYoH/zDRPULBtnyeISWE6+yxEPtA9LDJd5wkcw37NZkoAOC85jqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726827; c=relaxed/simple;
	bh=08mUHlhwFK6j04MGXu77lMICbkSqG4hpUQY0b4x4o9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W3JtLLNlrAXfymQm0zIh8ByIowOkoTP/ZYfVrSBQI2ZYkw6DY4g3sYa4cNRYYlW68WnRtkikD+fsNUcE2n2JyA/OeCCAplmpODaqhPIlLTFPNAWCicDQlE8MpN30+/+plduzpOXNJq5LImyXGOwuZS4qtiSA9iAwCOpixCuLtEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2F8FMK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2F8FMK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C312C4CEE9;
	Tue, 20 May 2025 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726827;
	bh=08mUHlhwFK6j04MGXu77lMICbkSqG4hpUQY0b4x4o9M=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=m2F8FMK3o/0DLpDYs6VyFaBixwWYuWqwmoltB6zEAS6tOML5b3GspSNREaVDS21au
	 Hcq4PRY8nqLplV+7a7wQuXS1j9bBtWiZFVMfwT2lxO6z1jRJKRNEuv1OCFp3vxmbRQ
	 0UnKVh8UYr7ZGOpW8TZQzFVRFv/uqayxUy3KAnW3yx+Mux9bUQQN4IQRoTLXZ2AFoz
	 U2b/E6brfrJRPhW7G+qGt6xes9L664J/p8yb7l1+jSU3PVvAj24h3CB6dDCpf2EkK8
	 pv++efDsNUNlMzWrD6z7L1U1chMwUihSZR3oUGy3Hyx+qeCKwLhrgLcj92Lup6BTrd
	 pKieWXnF7av/A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 09:40:21 +0200
Message-Id: <DA0TG9P9N7CI.3STZPSRIV6NDX@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
From: "Benno Lossin" <lossin@kernel.org>
To: "Remo Senekowitsch" <remo@buenzli.dev>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev> <aCH5WgORn9ZGl9Il@pollux>
 <DA093HA2415H.29OCPLS0M7H84@buenzli.dev> <aCtici15vSCBDbzE@pollux>
 <DA0EDC6W54E5.2CO8VXPTOXXJK@buenzli.dev>
 <DA0T1M8YEHZ9.1AW3IGD1IZX7Z@kernel.org>
In-Reply-To: <DA0T1M8YEHZ9.1AW3IGD1IZX7Z@kernel.org>

On Tue May 20, 2025 at 9:21 AM CEST, Benno Lossin wrote:
> On Mon May 19, 2025 at 9:51 PM CEST, Remo Senekowitsch wrote:
>> On Mon May 19, 2025 at 6:55 PM CEST, Danilo Krummrich wrote:
>>> Also, the PropertyInt trait itself has to be unsafe, given that it cont=
ains
>>> unsafe functions.
>>
>> I don't think a trait necessarily has to be marked unsafe just because
>> it has unsafe methods. Marking a trait as unsafe means that implementors
>> of the trait must uphold some invariants. This is not the case here
>> IIUC. Here's a good explanation of my understanding: [1]
>
> Yes this is correct, I don't think that the trait itself should be
> unsafe.

Ahh, I understood now why Danilo suggested this: if the trait should
guarantee that `fwnode_property_read_*_array` is called, then the trait
would have to be `unsafe`.

But I don't think that's necessary, we don't have any other unsafe code
that needs to rely on that.

---
Cheers,
Benno
