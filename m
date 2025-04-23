Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8F82D98
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442395; cv=none; b=FzBQZBaJyQ+WGlloOSZR4YnzFifamOXOW4sfflAcOTh5oV93//z+dOxn+2wWbbi/TFE9TrYojlKd4tvknlhwC4RLiHvgOFadnsgKMposqqUDN9+/wKkZJOON46CWZ9PqYoJilckRqxDMkoHa6A7WUAekB8wxPdUaUo8QY6SscSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442395; c=relaxed/simple;
	bh=qgnmbrs5R1omCctiVkoCevVxRfXdNIRKhT9uiNX8N8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyha/fk3o1pP9FF1AVx4Ms1giqbDrnbwWxUfSn8YDFRUjhLD+wufoGrhlHlZjw7TlSDv4fK8dmeahErZ0ZOzX71yo2qdwb/pn8IT2ECc1WjoW91oDaiFut7CavXFN2IQHb98wUfXN/GQ9LF1tqHv3NdgYkSA3B1Z8Bg9OfAuZuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Hm3nApL2; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Hm3nApL2"
Message-ID: <99b52c22-c797-4291-92ad-39eaf041ae8c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745442389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74tQ57PHLi6ZOj350BhyOhfjL3E4tvKmSozsLI7eDxo=;
	b=Hm3nApL2VyCOk1R8A1HZ9E99C91Zy63aYzPbt7jJv3V9l3XGw97qwhTzZ7tj6eN7tshG5Z
	zmKjm9EiOmybaMAsdLdtwnVXyFwnp5Tk17ytSPkkl+wW1hXDcliD7PYbcAO1gcfLRp7ln1
	UTH5caPBySOO30o2LNJSQ3vaF0VMn/Y=
Date: Wed, 23 Apr 2025 22:06:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 0/6] gve: Add Rx HW timestamping support
To: Ziwei Xiao <ziweixiao@google.com>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jeroendb@google.com, andrew+netdev@lunn.ch,
 willemb@google.com, pkaligineedi@google.com, yyd@google.com,
 joshwash@google.com, shailend@google.com, linux@treblig.org,
 thostet@google.com, jfraker@google.com, horms@kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418221254.112433-1-hramamurthy@google.com>
 <d3e40052-0d23-4f9e-87b1-4b71164cfa13@linux.dev>
 <CAG-FcCN-a_v33_d_+qLSqVy+heACB5JcXtiBXP63Q1DyZU+5vw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <CAG-FcCN-a_v33_d_+qLSqVy+heACB5JcXtiBXP63Q1DyZU+5vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 23/04/2025 21:46, Ziwei Xiao wrote:
> On Wed, Apr 23, 2025 at 3:13 AM Vadim Fedorenko
> <vadim.fedorenko@linux.dev> wrote:
>>
>> On 18/04/2025 23:12, Harshitha Ramamurthy wrote:
>>> From: Ziwei Xiao <ziweixiao@google.com>
>>>
>>> This patch series add the support of Rx HW timestamping, which sends
>>> adminq commands periodically to the device for clock synchronization with
>>> the nic.
>>
>> It looks more like other PHC devices, but no PTP clock is exported. Do
>> you plan to implement TX HW timestamps for this device later?
>> Is it possible to use timecounter to provide proper PTP device on top of
>> GVE?
> Yes, the TX HW timestamps and PTP device work is undergoing. Those
> would be sent out in separate patch series when they are ready.

It looks like it's better to have PTP device ready firts as it
definitely needs some worker to keep time counting. And it should be
done with ptp::aux_work and replace the work you introduced in patch 3
of this series.

>>
>>>
>>> John Fraker (5):
>>>     gve: Add device option for nic clock synchronization
>>>     gve: Add adminq command to report nic timestamp.
>>>     gve: Add rx hardware timestamp expansion
>>>     gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
>>>     gve: Advertise support for rx hardware timestamping
>>>
>>> Kevin Yang (1):
>>>     gve: Add initial gve_clock
>>>
>>>    drivers/net/ethernet/google/gve/Makefile      |   2 +-
>>>    drivers/net/ethernet/google/gve/gve.h         |  14 +++
>>>    drivers/net/ethernet/google/gve/gve_adminq.c  |  51 ++++++++-
>>>    drivers/net/ethernet/google/gve/gve_adminq.h  |  26 +++++
>>>    drivers/net/ethernet/google/gve/gve_clock.c   | 103 ++++++++++++++++++
>>>    .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
>>>    drivers/net/ethernet/google/gve/gve_ethtool.c |  23 +++-
>>>    drivers/net/ethernet/google/gve/gve_main.c    |  47 ++++++++
>>>    drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 +++++
>>>    9 files changed, 290 insertions(+), 5 deletions(-)
>>>    create mode 100644 drivers/net/ethernet/google/gve/gve_clock.c
>>>
>>

