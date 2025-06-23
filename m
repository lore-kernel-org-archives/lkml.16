Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81847221D9E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678170; cv=none; b=vBeiVQsbQQ8Jxbt3M3tMx+I2tavNm77dX/nTrCmzDhnCgzpT2ICgUxmG6BAbJ8XxXZrbTFn+na73RxlHz9ATIbDYUV3GJMNfhDPPLNxTkWrF84OBRJKboPqa5sWMRPGRWyTMkVevdxS3QAZdtU78dlV57Gwr8onqcRIXesA+Ods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678170; c=relaxed/simple;
	bh=wLQFKtSJGzFg4lKtATX7H7j9UPlk+P13KegXT5k15Eo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwyVlRKZ6arpAMPLhSlhT0vaDuCr9OZsriEGJV9lKtP+a+N527iINCIrzYWZUkMO7qyPd7/IFHNv7RHjADR5ll7KzSlKg5aVnwIjFGm90XqUrDTfcM2QZmOSNeYD1PPj4RIXoehaNqQxBxwDYVUB3unZz8KQmMBxvRDYo3EisPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKZFyNac; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKZFyNac"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32addf54a00so31734031fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678167; x=1751282967; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YgfPRIB+BYAuUXDEK/9DOfwH7aJtQFPBBRMLIHLTgX8=;
        b=KKZFyNacHddMm53yaQUFjAj10PbclA0ZqHQUMuYH1dXqrwEWMVWQLwsNfk0IUIgSCH
         r1J7F0bZ16ww2e/HhpH90C4mGYP+nlq9OyY5wMrzQOqdFqHVyozJqJ0LuhLsYId00Cfy
         4xnIc/FWiXzduUOGcWbMpbLQq6D5DjigA36uyxLYdi71uA1QQSdCMZ0XQQHFEH2zqGMA
         BPxNqnIGKo+Gv9Haf6WyKfiUNdZZ2C6dKP8zL8kNfN/QAopqKto3Ihzr/Hsu5V2fcGKd
         SapDHJ36DSRzqoJ8zlfzSy7B0qtw4GAC5pNitOnLpdySxyMYHhC2Rwgfwz8xzK1mrr5p
         2ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678167; x=1751282967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgfPRIB+BYAuUXDEK/9DOfwH7aJtQFPBBRMLIHLTgX8=;
        b=GRhI5Z+1r+vzRh3A1Vc06+bR+yyS57VNTPNfOOVeBOBNXSmLWjH5OcynBnf543iFTx
         vsVyZHnX4QRMtWTRSvc9DYSAb+uKma31juCCNiiAZEi7mLDnpjOccBnfLalATgrAii/H
         PEejn9ABmWs2U/uRLPT7q8T/SkX0Mqh5+4OMj9F511jjC0Xuy2xW8XMELJ3PzVO7E3yf
         unDzamtykkGTf3DySuX9RXuiNTbPTjBoBGHEcR4ySsCMN2WU8kmJF8rqo8+yIHuGFpLL
         CZamqVb+KLwCiY56BauNo3iLzupdL7zBU11g4MxSsuuycvM62x/wOgX3d93X20+2N9gN
         UxNA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIJ56SVc8a8zxB6mtnlWR5yTyNsf6SC8MuIlkAVUr6dNQkiYxWwOwtlLcboGWiDRSLw5hY0UNYnqXQYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzetUGgiBeVjKjOWDrikemh7NFDqttkjzfJr/Y/7zkbnRR1GtwN
	C20WMOKr5858mHHscthGXm8p/0vEVbZtW+H+EWAiC+qycfnd895ne/tq
X-Gm-Gg: ASbGnct76ach1WCV9tvd57bdQ0Cqc8WusH2NYp1M34ecE0ViN/GQSM5uXz3zT2Mqa6x
	v4jyk/AmGc7Wn/zv3lQayCDrVYdK/rza9sOjjLuu3E+a6r2TBhciO3o8I37MogPvVDr6pPscJP3
	BHalOhuit6KioCxDsv6ReBzuwfirJX4fXPAHNtO5zgWj+p6sG+TvPvrN5G4JbSbJEdWDWkdpyAo
	N9kbQur5d1kmUSLjAOrl9Y0+EeXfHIqC+ehEaILgzBPPmEgzfdK8wlSQR8zodFIYr5HUjaB6Be+
	SqJRswQQQH1mLJuNPWF0uzCJjSqcKxthquLeUMqinbQcMcIcDcGkadpjxMM0/W8tz0sVmNs/XJ+
	IOGyurb8VMcE=
X-Google-Smtp-Source: AGHT+IE1MZF6wlC72ECSHVOr+2VOUjVmkH4XiG30NEvX7gqf7FRE361lIOqKCXeUz4nUIgSU9qz8Zg==
X-Received: by 2002:a05:6512:3186:b0:553:34ea:fc41 with SMTP id 2adb3069b0e04-553e3d0ecdcmr3278922e87.56.1750678166243;
        Mon, 23 Jun 2025 04:29:26 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc0d4sm1359864e87.197.2025.06.23.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:29:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 23 Jun 2025 13:29:22 +0200
To: Suren Baghdasaryan <surenb@google.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Harry Yoo <harry.yoo@oracle.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Adrian Huang <ahuang12@lenovo.com>,
	Christop Hellwig <hch@infradead.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFk6krRwyMtbH0y4@pc636>
References: <202506181351.bba867dd-lkp@intel.com>
 <aFQaY4Bxle8-GT6O@harry>
 <aFQnEj0UASzl2Lxa@hyeyoo>
 <aFUgJgrc_eIHRy5-@pc636>
 <CAJuCfpHRVq+T8v-7J0kJ=mnbSJYX2kjG_8spgZFdfe4Tzbcs4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHRVq+T8v-7J0kJ=mnbSJYX2kjG_8spgZFdfe4Tzbcs4g@mail.gmail.com>

On Sun, Jun 22, 2025 at 03:54:51PM -0700, Suren Baghdasaryan wrote:
> On Fri, Jun 20, 2025 at 1:47 AM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Fri, Jun 20, 2025 at 12:04:50AM +0900, Harry Yoo wrote:
> > > On Thu, Jun 19, 2025 at 11:10:43PM +0900, Harry Yoo wrote:
> > > > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > for this change, we reported
> > > > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > > > in
> > > > > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > > > >
> > > > > at that time, we made some tests with x86_64 config which runs well.
> > > > >
> > > > > now we noticed the commit is in mainline now.
> > > >
> > > > (Re-sending due to not Ccing people and the list...)
> > > >
> > > > Hi, I'm facing the same error on my testing environment.
> > >
> > > I should have clarified that the reason the kernel failed to allocate
> > > memory on my machine was due to running out of memory, not because of the
> > > vmalloc test module.
> > >
> > > But based on the fact that the test case (align_shift_alloc_test) is
> > > expected to fail, the issue here is not memory allocation failure
> > > itself, but rather that the kernel crashes when the allocation fails.
> > >
> > It looks someone tries to test the CONFIG_TEST_VMALLOC=y as built-in
> > approach test-cases. Yes, it will trigger a lot of warnings as some
> > use cases are supposed to be failed. This will trigger a lot of kernel
> > warnings which can be considered by test-robot or people as problem.
> >
> > In this case i can exclude those use cases or even not run at all unless
> > boot-parameters properly sets if built-in.
> 
> Sorry, I'm catching up on my email backlog. IIUC
> https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@oracle.com/
> addresses this issue. Is my understanding correct?
> 
I checked/tested the .config from the test-robot in order to reproduce
the kernel crash. Unfortunately i can not trigger this. But, people from
the another thread already confirmed that it solves the crash.

--
Uladzislau Rezki
