Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644F230D3D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844358; cv=none; b=oKPQPBUU9KOqa810tPPExaM/HbV94iDM8GEo6BfFK5ryGHpiplbjHtb4aOBuz9kfg1Dgen3/8iWTWx41t+AK9lJgB1SIo6//i4dvDbepNS/EOx1q45Dmld8r6cxEz862NyO/ltMJaQxzJD9+MHzpwpBZZMFHTa1vTgLY4M8zf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844358; c=relaxed/simple;
	bh=razgLfbYxRY7uFeweFjPfCpodvXxctUIGvfZZeItlCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqvXcjpR6wFKg2yeISJMX6EpRDg+WjCVR2vmfuydkISPpnYGqJDqlVpWk0XFPkN4oSTkf9FlkHyUjkUDc0Tpf1J0AWjmjCjbWJc5xq/6051FXHTyGswF5mOQ/vyg2A/gz9rXsMOwnuZHAZ19Ek4LnboeBvBfcgx80p0ng5qDW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZRoYNB6L; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZRoYNB6L"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c3e7b390so88525b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744844355; x=1745449155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0SEFSDms0Srjc0vCBYMqkmnUZuH7wz5CdiiKrbnvac=;
        b=ZRoYNB6LnmOda0Ssg08hw9Ubd16mC8uI//baUKj0B/YZNcTRvUQBNQysaluDfxWyNi
         GuNjgQXojwwEf9e+RJax4yTeIKhq/7rPE6+n/lAo39vvZJBYT/qW7D52LKCFj0uFhZw/
         piHUBS+zJRBLJlk21vLLVIgQceZojFPB4VQ1YaVA4z6yourgmlTBdUsYU9ZsjFD26JHg
         1L7wyFiozLZ2Rb2sB5u0gVchOl5WmrBJtFvWj4mu7ImjH6QPdmrZ8MG6qMVaKZ04HY5z
         PCKnOwLMtO+k+QLuNjiNZEjEn+Rp3J22ZBP2cJdKhq61Pv+rpsro6CbWXbxOsKDrb3AS
         TZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744844355; x=1745449155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0SEFSDms0Srjc0vCBYMqkmnUZuH7wz5CdiiKrbnvac=;
        b=FMi8Sjq1oKt7+BrYoxYj3apQQFHPMM3i6cN8uLhKSRENsVNjhHBAp2+LZ1fuQgxOfg
         UMyFAffXU82k8U4am+EffT8Dur/xeU0tDbXz1m6BjtBdW1gz03ikQAxpOiZJxk2kW5Gy
         Nks5l0YDKrbzaJa3/mbWxXMUpkplvXgkB0O9YD7Ohd4zx9M4o+d+P3nRyV+vzjo9HeJy
         OhXdRn127xU2uYnawCAFCoO6LfzDQK7hfl1wjZpFVTxAiXqsfgHPYvWNXqh/LOtgblVu
         86KmaIjQBNqd4YSI3dAv5U954+4z6YVXZLhkR84oKgNY3OjmRUmsZXt2625n00f6DVZu
         r/TA==
X-Forwarded-Encrypted: i=1; AJvYcCXrTk9haAvdsh940Wa5B4PAWTT9yO7SudotA8Qk+aub5VDQMNkOoy6yA8DtjJYDUjDEhEGmoK3yF6l81oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywd1EK/TCXMe1+rxEF07rehqwXS46/SE3psK/ESzA5ETI6S2Gi
	YmEtIfrPT6Om0aKZOl6x3dsg7fhSgP6WcdOhL0YZKLyDVoyMBC2f5OyvE4eKXLU=
X-Gm-Gg: ASbGnctb7/ruIA4iyFWUAYSiLQ9jfAiY0J4Nz9YT6wjI7I/pBlkJSWS3qZulxHCdN13
	V3EWI98exM60Rbqe/+XN3ETfv5lTgjnVlLFbCGWwnUQFyWjdU69uMol6h4X7TpjQWgLjaHBcOMD
	OU+lx/Wd9ADH742bSGKUC/eBHrZfUpffrmeGesL/1sWvxnP37nra5cjfIdbV01JL10wOVO49jcF
	cgW1BvjSxrcV7Yqdtos+3MnV5KdY7hCqSV2bz77KZ/VuuLL6KEPtHIuagEiuIKdgA+5QZENzpZm
	n2yy7b9ty/+6eyrGHt7kG/YwaFRo/K/Rp97Ah9D67DB/VBw=
X-Google-Smtp-Source: AGHT+IFSEYg7McQOY/czenNGbNNAfA2OUrmKCVnpYselYnTzk2rudOCU17EHO8GEU4xVRm4hqObtOA==
X-Received: by 2002:a05:6a20:c797:b0:1ee:a914:1d67 with SMTP id adf61e73a8af0-203b3e505f1mr6482906637.2.1744844355423;
        Wed, 16 Apr 2025 15:59:15 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2601:640:8900:32c0::c137])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b0b220e997asm1836362a12.37.2025.04.16.15.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:59:14 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:59:13 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Daniel Wagner <dwagner@suse.de>, Daniel Wagner <wagi@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250416225913.GA2476975-mkhalfella@purestorage.com>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <20250416004016.GC78596-mkhalfella@purestorage.com>
 <3dad09ce-151d-41fc-8137-56a931c4c224@flourine.local>
 <20250416135318.GI1868505-mkhalfella@purestorage.com>
 <df6cd26e-551a-4bc1-bdc6-9c715e502aa8@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df6cd26e-551a-4bc1-bdc6-9c715e502aa8@grimberg.me>

On 2025-04-17 01:21:08 +0300, Sagi Grimberg wrote:
> 
> 
> On 16/04/2025 16:53, Mohamed Khalfella wrote:
> > On 2025-04-16 10:30:11 +0200, Daniel Wagner wrote:
> >> On Tue, Apr 15, 2025 at 05:40:16PM -0700, Mohamed Khalfella wrote:
> >>> On 2025-04-15 14:17:48 +0200, Daniel Wagner wrote:
> >>>> Pasthrough commands should fail immediately. Userland is in charge here,
> >>>> not the kernel. At least this what should happen here.
> >>> I see your point. Unless I am missing something these requests should be
> >>> held equally to bio requests from multipath layer. Let us say app
> >>> submitted write a request that got canceled immediately, how does the app
> >>> know when it is safe to retry the write request?
> >> Good question, but nothing new as far I can tell. If the kernel doesn't
> >> start to retry passthru IO commands, we have to figure out how to pass
> >> additional information to the userland.
> >>
> > nvme multipath does not retry passthru commands. That is said, there is
> > nothing prevents userspace from retrying canceled command immediately
> > resulting in the unwanted behavior these very patches try to address.
> 
> userspace can read the controller cqt and implement the retry logic on 
> its own.
> If it doesn't/can't, it should use normal fs io. the driver does not 
> handle passthru retries.

passthru requests are not very different from normal IO. If the driver
holds normal IO requests to prevent corruption, it should hold passthru
requests too, for the same reason, no?

IMO, keeping the request holding logic in the driver makes more sense
than implementing it in userspace. One reason is that CCR can help
release requests held requests faster.

> 
> >
> >>> Holding requests like write until it is safe to be retried is the whole
> >>> point of this work, right?
> >> My first goal was to address the IO commands submitted via the block
> >> layer. I didn't had the IO passthru interface on my radar. I agree,
> >> getting the IO passthru path correct is also good idea.
> > Okay. This will be addressed in the next revision, right?
> 
> I don't think it should. passthru IO requires the issuer to understand 
> the nvme
> device, and CQT falls under this definition.
