Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB11E3DFF
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341682; cv=none; b=uhzfPzxWPtUqtGQy/VjFSpX8S3GYaoQ+CjsMNax3hIS0dGEYRu6iCwzcBIwZo7N8/jAoPz6++cOhKrqDymd2qsM4v2jn4KEkhPhFH0bdVeoQKiAx8esJRYFRj8/TMapzt5l08wFtCE4WIZbtaqIUFEJpQiskPYqGdEQlKBj+LGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341682; c=relaxed/simple;
	bh=vYqcK28rlnAXUTMWzDVKIWmMxjod4LKRg0bWBlV1A68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxZ4cxL125SntvmW0oZde9OE8CuYYzfhV8fbIRHeQUgdulMg23bXF10uPhmQqDDXo9IzschrXI4O81ckYtAJ3rSh2Xm7YN6APL64xr3TK3pNhFGxdSrlE7BWEBRReGNlnnKL6gJ+I+9rQwAIZWBoFbPjmvfh3U947hGbpqm3VNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Uq3KDUFS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Uq3KDUFS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43626213fffso21541065e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738341679; x=1738946479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzHjJrpyeP9mqc5JWkuMLQPalXYBqZxzyJtrO92iNow=;
        b=Uq3KDUFSO0a/LL/NTHQfIpiS46zaXiu5OsGdS0ujUf8UuVw7bs198u5plFv62IOblj
         V055LAWjdbNmrgoj0F7Mt3pOG37xUXgpxVGn5uY8b6CCYIIUytCZi909kpGbNuVXshlJ
         f4HkgC2PgwqGNE7nsat8LwvJtX5hXX8VFDb2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341679; x=1738946479;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzHjJrpyeP9mqc5JWkuMLQPalXYBqZxzyJtrO92iNow=;
        b=MfO/REEdIxEh4Yo7Jtf1Q8l40V1KscGorjHeNQP7WGVSI0dlJEBIC40nrZcgdUwAvo
         ySRLGc7kmH3VRUrH7iKw5rG2FKkBpL0feBypeiGeRdqkBQgQ9wHVH3kNR7VwSeiIWnm/
         dS7LO+IjzgQjNtzf3tGmrrQh/PUwq+m+yiOVjFKY1U293LNaY8l8bW4KQQN+50d79FvX
         0qVFvgRPyogwd5Y/rrQITFmn1SZAUi/kbxfVpWB9W8X8qIwkrudgmlLX4/sNuxvdmhf0
         B0q9qcuZllm1K2dmd99bOpjmTVbcatG9T1FwVENHxJg98uLfCJ13pssuD1OIJ+HNuaKx
         dyLA==
X-Forwarded-Encrypted: i=1; AJvYcCWZVwyDNyd9f0IeGVkwiqZCJ+i9f4d4Z+i/EUs9sJAp38gW/n1X5NnSUqSI7jAloZX7rfe43E3qiKXqVrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGzvKCgtchNzNR/yOqta6SCr6eUUC7/NLoeCLceS7lGQG+R6We
	ALOkaKJ70d2cEIVjR+ut8iJJZQ9n9a8qYdGkQ3e6pJw+OwUc8yxbJHvxeRJUC3M=
X-Gm-Gg: ASbGncuaFWVPBVMG4EKRwLInvsTZ04E9VFyEYk5UbvsP4XMW41zj3SnQupm9fvdfdlA
	PjkdbYcMoxSDibha0dOHExuZzsfvHogcF1ocR6P1Yd16i7eCsj41Tf4urlcRk0UQ7KjyYBEJLws
	+dGjduFPi9ixJFxMVtJh3HqhSU6CHBTO6u7nssU3UhPL9SfIIhzSzAt85wFxtfmFMvIPY2HESoU
	9GTEvG/C7BBJjqrg2JFqY89TRAXWLE3ntZhDfWOG0rIyJuvkF9DBFkiFBzKbqjfnGr0I+EhXLV0
	8+NAXy/tds3wgsluOoszjEoHY1Q=
X-Google-Smtp-Source: AGHT+IGGDNp58bJr6qYY2kJIlfhFeC89Du/2iP4Ei/5xa7Mm39ysUYRti1e2Tbipv2p0tujjvYi4wA==
X-Received: by 2002:a5d:6d08:0:b0:388:c61d:4415 with SMTP id ffacd0b85a97d-38c5a99037emr6251050f8f.18.1738341679367;
        Fri, 31 Jan 2025 08:41:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5edasm4973797f8f.80.2025.01.31.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:41:18 -0800 (PST)
Date: Fri, 31 Jan 2025 17:41:16 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 2/2] rust/kernel: Add platform::ModuleDevice
Message-ID: <Z5z9LPzNuF2IdPGa@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
References: <20250122235340.2145383-1-lyude@redhat.com>
 <20250122235340.2145383-3-lyude@redhat.com>
 <2025012329-candied-walk-f57d@gregkh>
 <0bb7270e879ae3a40d4e5500f9a7992563a68d9f.camel@redhat.com>
 <Z5NzTsm7Hw-OD4n5@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5NzTsm7Hw-OD4n5@pollux>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Jan 24, 2025 at 12:02:38PM +0100, Danilo Krummrich wrote:
> On Thu, Jan 23, 2025 at 07:33:28PM -0500, Lyude Paul wrote:
> > On Thu, 2025-01-23 at 07:23 +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Jan 22, 2025 at 06:49:22PM -0500, Lyude Paul wrote:
> > > 
> > > And modules are code, not data.  Let's not start to even attempt to tie
> > > lifetimes of device structures to module code, that way lies madness and
> > > rolls back the work we did decades ago to split the two apart :)
> > 
> > To make sure I'm understanding you properly, by "are code not data" you're
> > suggesting that resources (devices, driver registrations, etc.) should have
> > their lifetime entirely managed by the kernel and not as part of the module
> > data structure correct?
> 
> I think that's two different things.
> 
> Driver registrations are bound to the module lifetime and in Rust, where we have
> a structure that represents the module lifetime, driver registrations are part
> of the module structure. That's fine.
> 
> Device are more of a concern here, since they ideally orginate from real
> hardware and hence shouldn't be bound to a module lifetime.
> 
> I think a virtual device would need to be an exception though. What else, if not
> the module should define its lifetime?

Yeah for virtual devices this should be possible I think. We do have plans
for vkms to gain configfs support, and then maybe the current device
wouldn't be needed anymore and we'd just register the configfs when
loading the module.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
