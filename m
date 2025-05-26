Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FECC20DD40
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270406; cv=none; b=jje8jXwNRRTXTH30fGpntUv4YI7B2W5bJy1+ypQAjAw9+WUGiF5UIBtGJhvaOzp9ie1Hslek5rVDkBdPfXgbT777rmz6W1TDSFNerC0/QLnsy8SHIkZEJ0l0aqGRi/WnbPA9WyVuo49AS9k2JrVNKN4sH/n3SOjnDL7pHakIotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270406; c=relaxed/simple;
	bh=/e+vyLtK0CFZ4t4mAapQB9b2M2hDkw8sV9L58+jnCMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QatrFEC4fmBY77RCPPrv7UayMgqWurdtLjd84/iPTvj2GERjxg7TOnNawI1ySLlKShmlgqDNfbhwiWcyb4ZEpvduPjuaVXliiw0bIEen2YrknAOk9i5iNpM3v++OFdVl9rC6PxcYV556iPtRLdBb3/s+PFW8FkE13Inls8SAUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aheNg0PD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aheNg0PD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748270404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RF6pS1ObcOVvDlmvm5nj8NiMFIwIn9dVx82Hog1fdnE=;
	b=aheNg0PDayRvTiYWH9J5Rzn8LqIl1mXaB87ao6Bknxra7nDMmg0cg+9Q1Gn7tBvTgtR9jC
	cJuOLPWYNOKI1WjmbLwo9O0y9zzbMjobymRjlnSWcIWOqYiQJL+feNth+VE+BEUbdgBl0o
	mzhwq88/7wqMoG+f7vz09suj6KEf9Ho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-psltW5aSOrKXQyl1PyGUVQ-1; Mon, 26 May 2025 10:40:02 -0400
X-MC-Unique: psltW5aSOrKXQyl1PyGUVQ-1
X-Mimecast-MFC-AGG-ID: psltW5aSOrKXQyl1PyGUVQ_1748270401
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so15730455e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748270401; x=1748875201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF6pS1ObcOVvDlmvm5nj8NiMFIwIn9dVx82Hog1fdnE=;
        b=dvfqzSPOws2oLZ6DrHn62bily17Mhrq+BzaljzDU8dLV8UUHZsRGwhvtxUeCakJ/61
         gasTpFYAL6gfYNuth27jMDfz2xUSffeRN27cbEtUDp6+6l1g0DbOoCv9JhXNmXUR1JDH
         SUcNcEw/+W0yQUfzpM9HKHcdowpTXh2ATDgNYZU/nKaS8HVy0srPAhPLxZqsvxoMn9pu
         Hbu7BUgz/80o2hvHJWRiqGfdDEVy7AveqTTOA4Zna0TaVx/YnkrTGp6TpHliG69qb6rY
         3hUCq5H310btB3nuzJfuBYMkj8FQ+SwVc9CdsGtaDINegqOTpNZLv1Mx6aFKl+fPFG6f
         KbCA==
X-Forwarded-Encrypted: i=1; AJvYcCViVEPcT0WhBvr1SUs9b9FcUPnJvwY8uwr7OWrLGeceO+vzM2sqRJZeQf389eFfm983KDC7nJLhqtwazzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjVtY6C3zHF6TZCkfSUZFKY3b3NLdOfbbCIS8U7+ABhqcOSdP
	k163UJRLY0z4ZrWeqm9bK0h6emcRzSiZIqYFgPtOkxTeBHqVnYYfe1Y53yLpcFPWo8R8SnrR2I3
	vxY6h2wpAs7hTqmZ9hjD4/EfDzjkhWyzUlPdehCZ91SDf8Mzv0RsXCOBMu7WJruL3pA==
X-Gm-Gg: ASbGncuHYVrdQcZ61W6NpbcOMIs2R+s1JI4/e5mMga/wINT8WQkSvxViTCfeaD2PNuu
	O/DCa6cfeRLYSlh/qg7peTkNVpTDSUxHOKUnWeCjvw9V5g5+O1zZ+4eXbP13/EFeTpFV0venNxd
	Bo9I8ZKg/JB28QkMThztI46TklmFKKfBV6OHp8nhfhXp7InziO8vkTQoioO1cJOhsPGSyXSLtY8
	IQglF9QUKElp7xpVRUNVIw0wZfUO4qU5pcTbsI11kUShkVFJIvh9i+rMNx1QZbcWaf4R08lhAiS
	3mp0Ejx4EVCwHm5AOCt1B6o7nOM/FCktpX6LPlfYy2Xl1nVZ+81/RMNzsvNc
X-Received: by 2002:a05:600c:511b:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-44c9493e671mr77932095e9.25.1748270401477;
        Mon, 26 May 2025 07:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWo+GvCwfq/rkNxHnvWQwirh+1VtVO+LjjW3fAOxqDotyizM//UqyOYsGby8MQArjXhlSeww==
X-Received: by 2002:a05:600c:511b:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-44c9493e671mr77931885e9.25.1748270400947;
        Mon, 26 May 2025 07:40:00 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aef8asm247808255e9.29.2025.05.26.07.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 07:40:00 -0700 (PDT)
Date: Mon, 26 May 2025 16:39:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] vsock/test: Cover more CIDs in transport_uaf
 test
Message-ID: <gfmoupl72tjyymhwxcstwpgaabbfaz6f4v6vj4lwwzwssg577c@urkmgn7rapnj>
References: <20250523-vsock-test-inc-cov-v1-1-fa3507941bbd@rbox.co>
 <limbmrszio42lvkmalapooflj5miedlszkmnnm4ckmy2upfghw@24vxuhgdji2z>
 <1f5cc46a-de4c-4361-a706-fc7fe06a7068@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1f5cc46a-de4c-4361-a706-fc7fe06a7068@rbox.co>

On Mon, May 26, 2025 at 02:51:18PM +0200, Michal Luczaj wrote:
>On 5/26/25 10:25, Stefano Garzarella wrote:
>> On Fri, May 23, 2025 at 12:31:16AM +0200, Michal Luczaj wrote:
>>> Increase the coverage of test for UAF due to socket unbinding, and losing
>>> transport in general. It's a follow up to commit 301a62dfb0d0 ("vsock/test:
>>> Add test for UAF due to socket unbinding") and discussion in [1].
>>>
>>> The idea remains the same: take an unconnected stream socket with a
>>> transport assigned and then attempt to switch the transport by trying (and
>>> failing) to connect to some other CID. Now do this iterating over all the
>>> well known CIDs (plus one).
>>>
>>> Note that having only a virtio transport loaded (without vhost_vsock) is
>>> unsupported; test will always pass. Depending on transports available, a
>>
>> Do you think it might make sense to print a warning if we are in this
>> case, perhaps by parsing /proc/modules and looking at vsock
>> dependencies?
>
>That'd nice, but would parsing /proc/modules work if a transport is
>compiled-in (not a module)?

Good point, I think not, maybe we can see something under /sys/module,
though, I would say let's do best effort without going crazy ;-)

>
>>> +static bool test_stream_transport_uaf(int cid)
>>> {
>>> +	struct sockaddr_vm addr = {
>>> +		.svm_family = AF_VSOCK,
>>> +		.svm_cid = cid,
>>> +		.svm_port = VMADDR_PORT_ANY
>>> +	};
>>> 	int sockets[MAX_PORT_RETRIES];
>>> -	struct sockaddr_vm addr;
>>> -	int fd, i, alen;
>>> +	socklen_t alen;
>>> +	int fd, i, c;
>>>
>>> -	fd = vsock_bind(VMADDR_CID_ANY, VMADDR_PORT_ANY, SOCK_STREAM);
>>> +	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
>>> +	if (fd < 0) {
>>> +		perror("socket");
>>> +		exit(EXIT_FAILURE);
>>> +	}
>>> +
>>> +	if (bind(fd, (struct sockaddr *)&addr, sizeof(addr))) {
>>> +		if (errno != EADDRNOTAVAIL) {
>>> +			perror("Unexpected bind() errno");
>>> +			exit(EXIT_FAILURE);
>>> +		}
>>> +
>>> +		close(fd);
>>> +		return false;
>>
>> Perhaps we should mention in the commit or in a comment above this
>> function, what we return and why we can expect EADDRNOTAVAIL.
>
>Something like
>
>/* Probe for a transport by attempting a local CID bind. Unavailable
> * transport (or more specifically: an unsupported transport/CID
> * combination) results in EADDRNOTAVAIL, other errnos are fatal.
> */
>
>?

LGTM!

>
>And I've just realized feeding VMADDR_CID_HYPERVISOR to bind() doesn't make
>sense at all. Will fix.

Yeah, we don't support it for now and maybe it makes sense only in the 
VMM code (e.g. QEMU), but it's a test, so if you want to leave to stress 
it more, I don't think it's a big issue.

>
>> What about adding a vsock_bind_try() in util.c that can fail returning
>> errno, so we can share most of the code with vsock_bind()?
>
>Ah, yes, good idea.
>
>>> +static void test_stream_transport_uaf_client(const struct test_opts *opts)
>>> +{
>>> +	bool tested = false;
>>> +	int cid;
>>> +
>>> +	for (cid = VMADDR_CID_HYPERVISOR; cid <= VMADDR_CID_HOST + 1; ++cid)
>>
>>> +		tested |= test_stream_transport_uaf(cid);
>>> +
>>> +	if (!tested)
>>> +		fprintf(stderr, "No transport tested\n");
>>> +
>>> 	control_writeln("DONE");
>>
>> While we're at it, I think we can remove this message, looking at
>> run_tests() in util.c, we already have a barrier.
>
>Ok, sure. Note that console output gets slightly de-synchronised: server
>will immediately print next test's prompt and wait there.

I see, however I don't have a strong opinion, you can leave it that way 
if you prefer.

Thanks,
Stefano

