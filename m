Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9F253F16
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437307; cv=none; b=RXKFjkCuihfky5nheWewJ8jYb6X+OIkO9sp8GLU83kKXXEev6hdD6SIwYX1uKcxpQAT41SOzpUyKpYl7dATt+pt3M1eHCVrhrHqBBPpuKiv/joO+f3Wlhj6qGwd5blvRtsFdVdKOhCy56Z9XhfAMDByUfmgptSGxOoSnF589BK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437307; c=relaxed/simple;
	bh=oaTRh4ds681QZcVYWaTXlb4ef8A2ijup6tRtesQ4SOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfEC9lM4Nu00pJAduJfRg/57pmRrGK7mMp0jpgvDEXNIF/qaaMnot/26UcaBIH3iNg1OlQWKJUXu5o/qsyyuwjG8WnlkxVRUmNK89MLxDJsE/oIHPutoggKICzykIPTlgMEJoBuy61PCWY5MwGBIFQP7TSB56h+eo5EqI/oNhkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q3rbwmNe; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q3rbwmNe"
Message-ID: <3ff0f1eb-fd69-4452-9e24-738f47b0203e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750437301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Pt53J5CQyhMhBy2UHYMO8n7eZQLEZ2R9chwdbp1yGI=;
	b=Q3rbwmNeb2YVBcJopM73p3v4MtiDUNCI9mWHG/TFSwVNnPebD7QaF4/BgqM6fUTV7RSs9t
	x+sOduJiZ5MM0tyEsz7TPTu7MzYQCtScim8OhAay/pUoPBcdUtSbz0uCTrxgrMWhOi/f+z
	5PFLJIp/YGxBuCohTNfV+cGUbHXzL2Y=
Date: Fri, 20 Jun 2025 12:34:56 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 0/4] net: axienet: Fix deferred probe loop
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <2025062004-sandblast-overjoyed-6fe9@gregkh>
 <56f52836-545a-45aa-8a6b-04aa589c2583@linux.dev>
 <2025062054-tameness-canal-2204@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025062054-tameness-canal-2204@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/20/25 12:01, Greg Kroah-Hartman wrote:
> On Fri, Jun 20, 2025 at 11:41:52AM -0400, Sean Anderson wrote:
>> On 6/20/25 01:10, Greg Kroah-Hartman wrote:
>> > On Thu, Jun 19, 2025 at 04:05:33PM -0400, Sean Anderson wrote:
>> >> Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
>> >> occur even without the PCS subsystem, as described in patch 4/4. The
>> >> second patch is a general fix, and could be applied even without the
>> >> auxdev conversion.
>> >> 
>> >> [1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/
>> > 
>> > I have no idea what this summary means at all, which isn't a good start
>> > to a patch series :(
>> > 
>> > What problem are you trying to solve?
>> 
>> See patch 4/4.
> 
> That's not what should be in patch 0/4 then, right?
> 
>> > What overall solution did you come up with?
>> 
>> See patch 4/4.
> 
> Again, why write a 0/4 summary at all then?

So if I decide in v2 that some patch other than "auxiliary: Allow empty
id" has to come first then the series still has the same subject. This
makes it easier for maintainers to figure out which v1 the v2 is for.

>> > Who is supposed to be reviewing any of this?
>> 
>> Netdev. Hence "PATCH net".
>> 
>> And see [1] above for background. I will quote it more-extensively next time.
> 
> Referring to random links doesn't always work as we deal with thousands
> of patches daily, and sometimes don't even have internet access (like
> when reviewing patches on long flights/train rides...)

Well, the link contains the message-id, so you are more than welcome to
look it up in your email client. But to spare you the trouble I will
quote from it next time in addition to linking.

--Sean
