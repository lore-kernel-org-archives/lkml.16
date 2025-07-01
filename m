Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724AB15B0EF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751335832; cv=none; b=efBE+EQjYBFciWz8E+OoHPKbShPvObhlQMIj4Xgs7pYAikV1vbRSZQowQWeXGPTvsOzRYbicWUVDUefr/oXwxGWsvWEXQ8rzMbiBxahZ1faRlIr6VmHcwJhmRS2FTSApYPMWrW/bY+Ehr1D+zQoLdFjLqRg2SOeFOOFoCTwF0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751335832; c=relaxed/simple;
	bh=chZSupA45hhC66A5Nbn69IBMjngEXaYkp2gQAo5xfl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TfnESKUB9PA2bnZPOHDvSvPDsgSkgk4V/9v0N2ycq8G4ul0055iZ5sGuMxrriPrf1scvolrdNCCL9iLkg89t/VPi0DXCZ/veD6mhpr4Bf+gAe75GTjQyNEWbKBL9YPr1oh1gLO2pQHLu2RnUGrbk8C3IdR/LaGg33v4AgCsqnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MEFUQOZ+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MEFUQOZ+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-addda47ebeaso1088447466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751335828; x=1751940628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//ycUvlATJpUfVbD8kzQ8AkDWoLdct992Z4BuFsvuYY=;
        b=MEFUQOZ+0WGMFGL7MXbQhVFwa2rZn+0U0qBc6Ihobd0h12Sxfm2RTM8viARA3+JD5D
         ZXuJleKmb9pD2tXYzl11QkiEb4QeSmA+80JlLKd5E2a65w9iYm2gdrlGFZwmch3Qmbgx
         qjOLN3If0QMLBQHSvwOKr/moZ3ZiU8Rcvli1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751335828; x=1751940628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//ycUvlATJpUfVbD8kzQ8AkDWoLdct992Z4BuFsvuYY=;
        b=rzn4SZeZXJtlwuowrXtECwGJ+bzQ+Ry/eMOyjrLbWVBCJti2mcqzTt93neOsYiW5TM
         viM/YqYpUQyJFwoxdooeMnNK5pXPAl6qaG7MehgbGNvH/k7RDV82KkahfN0XgCAxJNs5
         fqbC7puESDWPFy7zBMQFuvEmh/GVviyokeXMi/BlxL/jQE9pxL59eZKBgWht40I0Ishv
         c7DaFblz13FnQEQSMKQ9jpIYffBOoywpGYQQw+BHvffo7mqxtEIXitkspnH7OgiWa4Nf
         25R8ZkicqbVZdiUbC8FmESdWm9oOs154hrknwBX3scVmfV0yZsKVqZ9WJFs393uvonbk
         1bFA==
X-Gm-Message-State: AOJu0YyBgYik168M3J+Xb33I4D2cNJrK2s/Sg8ilUkkqwrARkKmdmQL5
	iU/ZjNRIvr6jo35kdQlnF9ylD+Of+td48QnmQCBRRYQKKHQb+osWUeXfFchoUsHrPC2+4+tIe+d
	O2XUNqK0=
X-Gm-Gg: ASbGnctL1tp7nc+DDSu09gZ0E+/CPv9AEn0HwyX6EUjDAwOx6PFd9uoEMO7MWpvH2iF
	szg6aAxmCr7qUAB7cIo3k2ElNslYne3xaJ0XnkFLXcgxnRyDfnyvklmAlQ/6cc74zaqmZWtB70v
	shvcC069bJUIhIpH1U+KPBhFPeR/bqr/nGP5OpoTq47VQHHPCMQqyqlsWwgvav5zSVOTHChWrc+
	NkOpxe4Z8WN7yq52zZlChXtc+zimbRPjzlU8AeTqDbQV3Xg+bHmhEHIpQm+U8cFCxKaBg8LPIV6
	GE/hHE+3E9QZVC1HH1NlUHnZn5ajsOxT0mS/hgrJSy9CM+dBN1YWYpskQtdSBRecYnxKMgDp1iC
	8WXT3lDpOAQjuaV5b+z+4oHTWmCTGXItsNJ+X
X-Google-Smtp-Source: AGHT+IHck/eW59+XL0nAeV95Mty8g7sm3qU18hB/+CsjMvMbAxSZLEIc8OwDGCCO5MtgHhO4HLX4tA==
X-Received: by 2002:a17:907:9713:b0:ae1:a6a0:f2fe with SMTP id a640c23a62f3a-ae35010fc9bmr1668428166b.36.1751335828432;
        Mon, 30 Jun 2025 19:10:28 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bcd7sm752768166b.121.2025.06.30.19.10.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 19:10:26 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so8614623a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:10:26 -0700 (PDT)
X-Received: by 2002:a05:6402:90a:b0:5fd:c426:9d17 with SMTP id
 4fb4d7f45d1cf-60c88e750a8mr13090570a12.34.1751335826112; Mon, 30 Jun 2025
 19:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701005321.942306427@goodmis.org> <20250701005450.888492528@goodmis.org>
In-Reply-To: <20250701005450.888492528@goodmis.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Jun 2025 19:10:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiWOYB4c3E-Cc=D89j0txbN4AGqm0j1dojqHq3uzJ+LqQ@mail.gmail.com>
X-Gm-Features: Ac12FXySn_pdB3lLzP12Vm5gk2T8ADap-82-V7Zr3xVfhtlJ2K8g-e3E8mi3zzI
Message-ID: <CAHk-=wiWOYB4c3E-Cc=D89j0txbN4AGqm0j1dojqHq3uzJ+LqQ@mail.gmail.com>
Subject: Re: [PATCH v12 02/14] unwind_user: Add frame pointer support
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, x86@kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Jens Remus <jremus@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>, Florian Weimer <fweimer@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 17:54, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> +       /* stack going in wrong direction? */
> +       if (cfa <= state->sp)
> +               goto done;

I suspect this should do a lot more testing.

> +       /* Find the Return Address (RA) */
> +       if (get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
> +               goto done;
> +
> +       if (frame->fp_off && get_user(fp, (unsigned long __user *)(cfa + frame->fp_off)))
> +               goto done;

.. and this should check the frame for validity too.  At a minimum it
should be properly aligned, but things like "it had better be above
the current frame" to avoid having some loop would seem to be a good
idea.

Maybe even check that it's the same vma?

             Linus
