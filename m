Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548311DE3CA;
	Wed,  2 Apr 2025 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596054; cv=none; b=hdRqBvy/KbA8RYseHPpN5xmjP6s/D43P6bkXQLDkPVshAo18xGpzniuNUFpAqwS4Vailqnk69FsxENarNpFLvTd1jnCJbwM3Z972NH4OP6DeG873GTCfOjEaYWEV2GGNr6InHEosFDzL7epcIZGbjfPwVUsqSZdw6ZD+AMjsy+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596054; c=relaxed/simple;
	bh=4vP1zg4NZRz6pKqIx6I2YGi9rhlnszDVD/oz83EGiNc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DKY2Wvh9s2nY1ln8bNtfBE6plITzDxPIUC0ENd6s68COridTAemgJnc+QVzUGif4mO72Hcq9Epikwat4ldT7v1hoZeM5YdIHrHEP++xcMdiyZMqMNr+8GwZdbiXsa3X4PlEnoe3YnRnRKSiSteKgvXcCzN3haCPMQI0BSb2QGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Rbz6e/Ky; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=irhf6zkT; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Rbz6e/Ky";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="irhf6zkT"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 431211140214;
	Wed,  2 Apr 2025 08:14:10 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 02 Apr 2025 08:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743596050;
	 x=1743682450; bh=FKDNjdFnETrwUcjHp4ivsB/tkaU6T/LRyMcbCEGcodM=; b=
	Rbz6e/KyIEj/j76qr1DrEXSbc5ZQ8Jl3gkPl12w6JZnhVVBOXUPfdv/d13EYYNoR
	DTNxN5OZgQEWQBTbt8tf1+2ZHNxGs9sH2YqtUmo3UXN29XKnCor+S9tqNp5yfCgM
	UqUSpnsk0m42aL8pSLCLsMZtYuIc7kviipP/IymPh/2mvljfFGz3sCuL8p9775TQ
	oNynbD8rd+cJhBuJcQnElZgDDYOJRDckDgMJ2Aj+63PKDfQK3oczQDFrprWy0JNo
	5jd8GwCHwWvpPgKiKnQYyy2vlOMJQfM9pUNFZFxD2J7wKWf2UnXjixSXMSWTjFPD
	HNOphkFXlzkpENYwns5RfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743596050; x=
	1743682450; bh=FKDNjdFnETrwUcjHp4ivsB/tkaU6T/LRyMcbCEGcodM=; b=i
	rhf6zkTwa0vSHsNdwecBh925dAMBBayG+bAsI5SOFCf8ttHFNlZ4JLQ84+gnNVbb
	M4bjUy3JvuTxMCJ/aA6abJ7eBPnpQBYiU4SXMwJjNEzBcbzIfyRbUSs2QzBfNMb/
	3luqP6rXqfQB3BouutlR53uSrzfDWd8E6gXE1sCcjBv1fcMk1tXedU//jOCLyhRl
	QDr9e7G9++anZBdSAI+yqRHH3uStFU+5VsD5es9P6sIw5Ik41F5LcvOB87ZwumRW
	8X0AiSpR8oI5lGU2HVtLqVXrlagm4dGQ52DBqyiTHxAv4UHXBs2aczt+nQWFDRd+
	4aGwly0fluQv8uQCWbcyA==
X-ME-Sender: <xms:ESrtZxQtgVxmVopG6orknIeo1eegYgVWqzJqJIXmtCBx7f8o5ZSVRQ>
    <xme:ESrtZ6xF5p8NnRxSsgsOkhAZ1HXgFJkHvFtsL5seS7dEpZ8TBZYjlWAmjXf6I3iCo
    52ePjvKHuPqwPbTk0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrkhhshhgrhidrghhuphhtrg
    esrghmugdrtghomhdprhgtphhtthhopegrnhgrnhgurdhumhgrrhhjihesrghmugdrtgho
    mhdprhgtphhtthhopehgrghuthhhrghmrdhshhgvnhhohiesrghmugdrtghomhdprhgtph
    htthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthht
    ohepnhgrvhgvvghnkhhrihhshhhnrgdrtghhrghtrhgrughhihesrghmugdrtghomhdprh
    gtphhtthhopehshhihrghmqdhsuhhnuggrrhdrshdqkhesrghmugdrtghomhdprhgtphht
    thhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehlihhnuhigqdhh
    fihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ESrtZ22KlFG16JI7xd-R1JCkE4gysN35sglxVKo1uSvJiQa9N80khA>
    <xmx:ESrtZ5BK_JcUUxm_gDmndGTegCvLTfxvsjrV94Vvh4XKYexlMlwjnA>
    <xmx:ESrtZ6jjbDqnaedWHB-P1DUXMWb1UutARsqG9D4sYi8WlmHux-wLMA>
    <xmx:ESrtZ9p6rMSN3e6Y_RL1QvClEIA3dg-hH0RVbxh0bF9-dLo32AnpJA>
    <xmx:EirtZ-mj9veMXKqXpL236kgklIqoi97VXiUywJfZRirbbftxGyezERCl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2EBF2220072; Wed,  2 Apr 2025 08:14:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T26b50819d8e1d81f
Date: Wed, 02 Apr 2025 14:13:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Akshay Gupta" <akshay.gupta@amd.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, "Mario Limonciello" <mario.limonciello@amd.com>,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
Message-Id: <c7efb154-9e44-402f-b0fb-c9bce54645b2@app.fastmail.com>
In-Reply-To: <20250402055840.1346384-8-akshay.gupta@amd.com>
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
 <20250402055840.1346384-8-akshay.gupta@amd.com>
Subject: Re: [PATCH v7 07/10] misc: amd-sbi: Add support for CPUID protocol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 2, 2025, at 07:58, Akshay Gupta wrote:
> - AMD provides custom protocol to read Processor feature
>   capabilities and configuration information through side band.
>   The information is accessed by providing CPUID Function,
>   extended function and thread ID to the protocol.
>   Undefined function returns 0.
>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
> ---
> Changes since v6:
> - Address Arnd comment
>   - Add padding to the uapi structure
> - Rebased patch, previously patch 8

This changes the UAPI again. since you change the common structure
layout.

> @@ -134,6 +279,9 @@ static long sbrmi_ioctl(struct file *fp, unsigned 
> int cmd, unsigned long arg)
>  		/* Mailbox protocol */
>  		ret = rmi_mailbox_xfer(data, &msg);
>  		break;
> +	case APML_CPUID:
> +		ret = rmi_cpuid_read(data, &msg);
> +		break;
>  	default:
>  		return -EINVAL;

As I previously commented, I would prefer to have a highl-level
interface per specific mailbox item you transfer, but I think that
is something we can debate, in particular if Greg or the x86
maintainers think it's ok, I'm not going to object.

However, having a combined ioctl command and data structure
for rmi_mailbox_xfer(), rmi_cpuid_read() and the commands
you add later seems to cause a lot of the extra complexity,
and I think this really has to be done differently, using
distinct ioctl command numbers for each of them, with an
appropriate structure to go along with it.

This does mean the existing userspace tool will be incompatible
with the upstream driver, but it can be easily updated to
support both kernel interfaces (trying the new one first,
and falling back to the old on after -ENOTTY).


>  struct apml_message {
>  	/*
>  	 * [0]...[3] mailbox 32bit input
> +	 *	     cpuid,
> +	 * [4][5] cpuid: thread
> +	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
> +	 *	[7:0] -> bits [7:4] -> ext function &
> +	 *	bit [0] read eax/ebx or ecx/edx
>  	 * [7] read/write functionality
>  	 */
>  	union {
> +		__u64 cpu_msr_in;
>  		__u32 mb_in[2];
>  		__u8 reg_in[8];
>  	} data_in;
>  	/*
>  	 * 8 bit data for reg read,
>  	 * 32 bit data in case of mailbox,
> +	 * up to 64 bit in case of cpuid
>  	 */
>  	union {
> +		__u64 cpu_msr_out;
>  		__u32 mb_out[2];
>  		__u8 reg_out[8];
>  	} data_out;
>  	/* message ids:
>  	 * Mailbox Messages:	0x0 ... 0x999
> +	 * APML_CPUID:		0x1000
>  	 */
>  	__u32 cmd;
>  	/*
> +	 * Status code is returned in case of CPUID access
>  	 * Error code is returned in case of soft mailbox
>  	 */
>  	__u32 fw_ret_code;
> +	/* Add padding to align the structure */
> +	__u32 padding[2];
>  };

So this structure would become something like

struct apml_mailbox_message {
      __u32 cmd;
      __u32 mb_data[2];
      __u32 fw_ret_code;
};
#define SBRMI_IOCTL_MBOX_CMD	_IOWR(SB_BASE_IOCTL_NR, 0, struct apml_mbox_message)

struct apml_cpuid_message {
       __u64 cpu_msr;
       __u32 fw_ret_code;
       __u32 pad;
};
#define SBRMI_IOCTL_MBOX_CMD	_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_message)

       Arnd
