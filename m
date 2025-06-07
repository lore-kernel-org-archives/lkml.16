Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0C1A31
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749316313; cv=none; b=FSUnlwhH3IqPj9BwThKb0N/SghBEFVrchIVGhDGXTb220SctUJGphJrIgzVXIYd3Iz5bkzhhzk77kFH7VOiQT7zBJmdav6qjkPIoaGVk2LRyQ9sWHX+tQa+FdnY6/IcelcCpVb19W4mEqHABt3T1/VJgj23aYsQHoYIWoeZ566Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749316313; c=relaxed/simple;
	bh=xCjDvC5VWjJ5q6LZN7UNywkRQBZa6ThceH1qu0z8bUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk9h1FA1VL1xy+sCl0fzBcCnI1XmA6BRTbp6rXd2AuSE7WVQfu6PS/mP/SyzozDjviJL6h51DZmH78vQem01Bo6vWpDRUaCvvAHiL5NwXBLgs4H+xbVpUmSSiv5UcLVGSXVCUQHPt6qEucRMS9bOPTLwjU4pDjG+CtxNtaHa/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=SG+A0ZfT; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="SG+A0ZfT"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43e277198so24689911cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749316311; x=1749921111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCjDvC5VWjJ5q6LZN7UNywkRQBZa6ThceH1qu0z8bUo=;
        b=SG+A0ZfTRvZ1EZK/PAFxgmd1jwdfVOqh1Dy4PV1c5G8fctyAYa1SDMXn05MhoQdAOU
         4Vxsq2iROyiWYOP+kvsxKyO37gdV7ohriayK9mcUdgQ2cOXfdTcYrjRT9YcrzxzlrevA
         9SGao3NbD2fNDZ19cg7nwsMpjI8T3PmXjug3RUOmb1EnIqvnu88nl8VD9s87/RJpHpvM
         pXn5D0Y0TaO3m6y/foqoOAQitkgSFB54l4kM3PQNjLU1frVacURCXsdq9NQDs8ROvnU4
         bV68dcpMk+/u35N8KcpiBKrAxX5UtmqaqpU/JOByX0bJPcSFDSOiiXuR1RyTGABSY53M
         mwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749316311; x=1749921111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCjDvC5VWjJ5q6LZN7UNywkRQBZa6ThceH1qu0z8bUo=;
        b=lBAKSbloDDtCOyusZ/uUSKZdScfuwAduTKwSRc7HpA4OfhHInVML5Iqz7G9gnc31UT
         Yk4xai3v8ENuXTEWEPz+WKSUiNOCtrFcVf6VqptOZkpHkrStq7Wcq3ww8bxHY7jxPnGr
         y1sqbAc3ZqcmSh5dTE0rmsZimLViSlC3rh20o1161e7Ml8Z7ui/zY74A3anE7dlzXLeC
         D+cHuX4cq3vtP5QaH3ATlqt3sFdGz+43rVzMxAhlDdjiKEIug51/EMBSdvqKAgTqMeOC
         N8UqTgMMM/TMsWfwnHl2PmerUEodtvHpYFdRWoZOsn8ztGsVPs7I6mzZ9zdOIM6a01HB
         lyBg==
X-Forwarded-Encrypted: i=1; AJvYcCVohU5Nr9J2tOSfdw7fVEwEafQvrR25gVijY2eoq/lZwD45W3iKv4+Z8WzLGd8CZ0lnq+e9y4w0vraSpiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0uHhSZZnk4pzmuvm0VuLFCrG+/VwZS4xnf6tJNHQyys60ngzc
	NLTbpMid0Ha9hfoRpOIvyS2vZ2wZ2OPXY3S+YFRpjLHQM4diFgOyY+c2ZTlE/3/3CSU6pfxAPoW
	LfN/RHkt1/0CbzTLBCo+ZxgnJLoJw0fLtVkw6/Gvk5A==
X-Gm-Gg: ASbGncv4/cMrcEGK1eq4aknwicqsCdnmhFhS7Jmg9JoKoW1jeN6CaW5vTWa0rfQn+au
	jBxFoEhB6edkz3ozDmLJfR8Ou8uSUWftFdxLFwwHK0QbQE8J3+ndlKuizMYmDHK08OkQSRhYvrH
	GAQzdhWCqZE+8jgVE5P3dUx0iGjSPjNRI05kyfOOdzqYnNj7X1l+4=
X-Google-Smtp-Source: AGHT+IHlSewL0I2vem9w0XYHFAWl27pFyN/ynItNRVl7X1CCmIYg2bBDpzo/TCiXt0R5950IoAoIr0C9zLp8Pm4BRfk=
X-Received: by 2002:ac8:7dcd:0:b0:4a6:e7a8:65b2 with SMTP id
 d75a77b69052e-4a6e7a866a8mr81570511cf.10.1749316311198; Sat, 07 Jun 2025
 10:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-5-pasha.tatashin@soleen.com> <mafs01przv8m9.fsf@kernel.org>
In-Reply-To: <mafs01przv8m9.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 13:11:14 -0400
X-Gm-Features: AX0GCFvnA9qdFD2JyIoGnpA5SZYSuxL26F_4ltSyZwRGc77_a-JtPWOeIGmCXfU
Message-ID: <CA+CK2bABr_Y-t=Cmfz_6nZcvorqePUiBbb7AKJbS_ruze5zxyg@mail.gmail.com>
Subject: Re: [RFC v2 04/16] luo: luo_core: Live Update Orchestrator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"

> > + * Based on the outcome of the notification process:
> > + * - If luo_do_freeze_calls() returns 0 (all callbacks succeeded), the state
> > + * is set to %LIVEUPDATE_STATE_FROZEN using luo_set_state(), indicating
> > + * readiness for the imminent kexec.
> > + * - If luo_do_freeze_calls() returns a negative error code (a callback
> > + * failed), the state is reverted to %LIVEUPDATE_STATE_NORMAL using
> > + * luo_set_state() to cancel the live update attempt.
>
> Would we end up with a more robust serialization in subsystems or
> filesystems if we do not allow freeze to fail? Then they would be forced
> to ensure they have everything in order by the time the system goes into
> prepared state, and only need to make small adjustments in the freeze
> callback.
>

The reboot syscall is allowed to fail. Since freeze happens once we
leave userspace, it is the only chance left to conduct proper
verification that serialization assumptions have been maintained. For
example, if, after the prepare phase, some mutations are not allowed
for preserved resources (such as DMA re-mappings, etc.), the freeze
phase is the only place where we can perform this verification and
return an error to the user. So, while I agree it could simplify the
state machine by allowing cancellation only from the prepared state, I
think it is important to leave this ability for the freeze phase as
well.

Pasha
