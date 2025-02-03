Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C11FFC74
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575945; cv=none; b=HI/7A6uFrE/ohzJtGXfjmUikoVyN2j/92LCGh+lvvB5/fs2sm1+KCVaJMXFnrC0/Utrqx5JJ5TS5ydn4WylQaiJRRqmCzuk4NIumvfCe36m11IoRaK1GjrytsNyfdM6iGlXGNgA2QTlYxYI0yygskyDUt4HBFHoZYXWNlG5TiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575945; c=relaxed/simple;
	bh=F9DEP827Yf9q6DBUARR9/3T54ckPf/8fBNAzaAKI6N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irKfNSrt7WfUwVWk0PWOhvUHOwHWMaE3wCfJXM6YKWOBoi0xuIWzX26EmI47n/ymu/IF/Zu1B/qRAh5B08MfpKsanjl5PMcRevSM/NGwnyissUDPInp0+yIhIpDuLuvgXMtRpJX5ro8D8MRG3s1NWFkJ02Xn1Cs+eR9OS1zAoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=VogFafGx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VogFafGx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863c36a731so3238413f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738575940; x=1739180740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77lujEVv3EMAidmfrKRz++J2MUJPK/0SmZ7KBdwq7nI=;
        b=VogFafGxeo5s2XOwECfbQ73fnAWjFC42D+hQdV3A6ej/oVc7bUYu74FcqvrDXYmP5E
         EF91ynUXcpPyqJPptD+FSLZ34exEjnvEv9mv0KZEojure+3eeEYn5jJlTcZ/kIjwXSDE
         AQPIpwHJE5SETXkZnJSC7lZxE9n9MmdHj94cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575940; x=1739180740;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77lujEVv3EMAidmfrKRz++J2MUJPK/0SmZ7KBdwq7nI=;
        b=Cv3vW8G1hDEStgVx8qDI5C0nUSlDUcT2sybSs/YIZL/a509uk47DDy9ToBwa6kfcq7
         e8UfnEBpMldj7Apf3KrntwpmrN7XHCH+bT4YCykzfIlvQommRs+mokgDxHxvnZbmlWBb
         KUwo7LwD0OUFt+B8OtMuEY2TtpvzDyQVAEcl4jQav1JTsaCajATsXmZWnvEPxnhGPYbS
         MBIqDmUmmaX0K+nF/HtAaJu44WTnuU11qeJJsi+tq+HdU22ZPC0mpLqmhgxML6DljM7i
         jY/2l2Urii/A/UrvUJL1qejoBop8BiT68BCze7cdv2+8vXYS+vR1fQuGDOYcaqmZN0eF
         BIAA==
X-Forwarded-Encrypted: i=1; AJvYcCU78k4QyVUZpxUtZ8jq7B3bEvNYLQmljgRhAPFkCRxBmq5A7AdsS+qWsdsvsuw6ufLV1oXCrz2jBwvA9hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5QsMPRQKbAW4rnsBOye9xRONK96pXMWu+FkKvtwDCR3Z1vD7
	a6MSk1kQQwiHx/05QCyjPqSo2uyRrMmWYOwZrZbF8uisGO+C0nveHrFpDkDLvZ4=
X-Gm-Gg: ASbGnctjRddp9BRRcgy9RusLEBjz0wcc/mNjbEiiGvEEbIAPrYAqxRw8uAXaTepnssf
	3SEC52D42mzo9DN2/j3B71v/0nXacR6KvlrAZMPRLCza8b4SDk21HYtbeSds3JUP9WA5STFzswH
	/l/k50mEPz/bN2ONNMZgPFBpRsB00fAnMzNSOqQ8gBVYJJBdA8o0jwuLrtw9TG7G++2CfK2Vooz
	yZut2hhclxvQLFaKIg+XVZUjh47/OJIzTcfVfzf/LoxiZ1t3++t345lwaMVveLjBBC6025Ta+4u
	zwLDpIzeG4ehZzzTdXwOMg1C5N8=
X-Google-Smtp-Source: AGHT+IGtCR6HSkBC+tXLtZ1cIILYqsPDImD8BvFKwvB7f7WEENZ/bnSYuPhTe7TyO11dgd4Lwm9bnw==
X-Received: by 2002:a05:6000:1884:b0:388:e377:8a1b with SMTP id ffacd0b85a97d-38c51b60c11mr16499686f8f.28.1738575940333;
        Mon, 03 Feb 2025 01:45:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f49dsm147899985e9.35.2025.02.03.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:45:39 -0800 (PST)
Date: Mon, 3 Feb 2025 10:45:37 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <Z6CQQZ5fbBwCJ63K@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020106-avert-senorita-4181@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Sat, Feb 01, 2025 at 09:00:00AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 31, 2025 at 07:43:07PM +0100, Danilo Krummrich wrote:
> > On Fri, Jan 31, 2025 at 05:40:01PM +0100, Greg Kroah-Hartman wrote:
> > > On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > > > > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > > > > for the taking - but the vast majority of device drivers concerned with
> > > > > virtual devices do not use this and instead misuse the platform device API.
> > > > > 
> > > > > To fix this, let's start by adding a simple function that can be used for
> > > > > creating virtual devices - virtual_device_create().
> > > > > 
> > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > > > > off the idea that Danilo suggested to me off-list of coming up with a
> > > > > simple API for handling virtual devices that's a little more obvious to
> > > > > use. I wanted to get people's feedback and if we're happy with this idea,
> > > > > I'm willing to go through and add some pointers to this function in various
> > > > > platform API docs - along with porting over the C version of VKMS over to
> > > > > this API.
> > > > 
> > > > This is a big better, but not quite.  Let me carve out some time today
> > > > to knock something a bit nicer together...
> > > 
> > > Ok, here's a rough first-cut.  It builds, and boots, and I've converted
> > > a driver to use the api to prove it works here.  I'll add a bunch more
> > > documentation before turning it into a "real" patch, but this should
> > > give you something to work off of.
> > > 
> > > I've run out of time for tonight (dinner is calling), but I think you
> > > get the idea, right?  If you want to knock up a rust binding for this
> > > api, it should almost be identical to the platform api you were trying
> > > to use before, right?
> > 
> > Yes, additionally, since this can't use the existing platform abstractions any
> > more, we need the bus abstraction for the virtual bus, i.e. the corresponding
> > driver::RegistrationOps implementation, module_virtual_driver macro, etc. Should
> > be a little less than 200 lines of code.
> 
> I hope so as the original C code for this is less than 200 lines of code :)
> 
> I wonder what it would look like to do a "real" bus in rust, maybe I'll
> try that someday, but for now, I want this to be used by C code...
> 
> > Other than in C, in Rust we don't need the "artificial" match between a virtual
> > device and a virtual driver to have automatic cleanup through things like
> > devm_kzalloc().
> 
> What artificial match?  Ah, you mean they would both be in the same
> "object"?
> 
> > But I guess we want it for consistency and to have the corresponding sysfs
> > entries and uevents. OOC, are there any other reasons?
> 
> I don't really understand the objection here.  Oooh, you want the C code
> to both create/manage the driver AND the device at the same time?  Hey I
> like that, it would make the interface to it even simpler!  Let me go
> try that, and see if it is what you are thinking of here...

So at least in vkms we plan to allow instantiating more than one device,
with the same driver, so not sure we really want this. The idea is that
you can also validate the multi-gpu (or at least multi-display) code of
compositors with entirely fake hw in CI. It is a pretty common pattern
though for these virtual devices/drivers, but not universal I think.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
