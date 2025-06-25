Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351B26980C;
	Wed, 25 Jun 2025 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864183; cv=none; b=Zoddwvfey9W6ClXnfbVjyLPZy1nhkkt4yBdd+WQhaxIOrekVcdi/hl+dnA4631XRXoZOKtUxdBFysQDtqG2d47yK9U/HY6PcmF26FZ4lRWaMP7rsRzaiw/sXBgLpcRe2cOTbYtvNl8gA5eCZBzhueLQbHORa5tdjxT/IYZ9FD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864183; c=relaxed/simple;
	bh=gXTrknQJEN2InCoQs4DfBMZwTkg+EzezKbyu9cjLKd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQ+YPpcPmPLgojQ/zYRF3DYOF2fSafD58t1WtbOgVWuMpVQrahJpCfZz1QgxzCtoIWBKSHsMKiBUv3Y968Y6YNOVELpwdA52xTw7/uY1Tr0KZyQRPBZzYGfPTTiPsoROjGK86dAymNVieDEUaaWrRTeiMAmKpo3sNJ8zTc2Bxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0PLn9cr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0PLn9cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3131C4CEEA;
	Wed, 25 Jun 2025 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864182;
	bh=gXTrknQJEN2InCoQs4DfBMZwTkg+EzezKbyu9cjLKd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u0PLn9crr+axy2rYzqoJGjcvfEiSGK9hhM979kA+/G695wC1d6YWe8ziw5ZSuK1Vv
	 Bvt6fbecPTYZFWJagWccaBrKgkNeYQSCOcPZcoEy1v8R/qIR0azzTjCZaHQBQU9gTr
	 dXg9n+caddyGG6WecQZWOnsqL2Im+/AifJaxSyFR3k3s/NVJ6zMbBUxqvDLChCkjZc
	 Qs1kOvjrXsikBZN8kF3GYJfyTU90ALf5+Il/AcK8bN7kNwp3NBCW1MTusVza5k22Mu
	 b7IWSsbs344BQm1JAx05KbkC61ySuBbZwok4cWMQgd81u4UOMnIl/l1FhI19mymaJL
	 517W4942n0O8Q==
Message-ID: <bcd9c013-4df3-4c35-82d1-e6fdde7829ea@kernel.org>
Date: Wed, 25 Jun 2025 17:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] samples: rust: platform: Add property child and
 reference args examples
To: Rob Herring <robh@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Mark Brown <broonie@kernel.org>,
 Dirk Behme <dirk.behme@de.bosch.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
 <aFXipz-B1vEYkww9@cassiopeiae> <20250625143930.GA1006384-robh@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250625143930.GA1006384-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/25 4:39 PM, Rob Herring wrote:
> On Sat, Jun 21, 2025 at 12:37:27AM +0200, Danilo Krummrich wrote:
>> On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
>>> On Mon, Jun 16, 2025 at 10:45 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
>>>>
>>>> Add some example usage of the device property methods for reading
>>>> DT/ACPI/swnode child nodes and reference args.
>>>>
>>>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>>>> ---
>>>>   drivers/of/unittest-data/tests-platform.dtsi |  7 +++++++
>>>>   samples/rust/rust_driver_platform.rs         | 13 ++++++++++++-
>>>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
>>>> index 50a51f38afb6..509eb614ab2b 100644
>>>> --- a/drivers/of/unittest-data/tests-platform.dtsi
>>>> +++ b/drivers/of/unittest-data/tests-platform.dtsi
>>>> @@ -40,6 +40,13 @@ test-device@2 {
>>>>
>>>>                                  test,u32-prop = <0xdeadbeef>;
>>>>                                  test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
>>>> +
>>>> +                               ref_child_0: child@0 {
>>>
>>> child-0 or you need to add 'reg' property if you keep the unit-address.
>>
>> Adding child nodes here creates the following dt-test failues.
>>
>> 	[    1.031239] ### dt-test ### FAIL of_unittest_platform_populate():1862 Could not create device for node 'child'
>> 	[    1.031647] ### dt-test ### FAIL of_unittest_platform_populate():1862 Could not create device for node 'child'
>>
>> @Rob: What do you suggest?
> 
> This should fix it:
> 
> index eeb370e0f507..e3503ec20f6c 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1856,6 +1856,8 @@ static void __init of_unittest_platform_populate(void)
>          of_platform_populate(np, match, NULL, &test_bus->dev);
>          for_each_child_of_node(np, child) {
>                  for_each_child_of_node(child, grandchild) {
> +                       if (!of_property_present(grandchild, "compatible"))
> +                               continue;
>                          pdev = of_find_device_by_node(grandchild);
>                          unittest(pdev,
>                                   "Could not create device for node '%pOFn'\n",
> 

Do you want this to be a separate patch? Otherwise, I'd fine just adding it to
this one.
