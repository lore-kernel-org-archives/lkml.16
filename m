Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CDF16F265;
	Mon,  7 Apr 2025 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744004954; cv=none; b=VnZcjTYb9IwMzvy8tczagbFJg+es9ofQTxl9dtOBoyy83soII0YT2ODOohE+V14/zrwsnFerZT1thl0PdowC/iaAkP623nxQzqw93MInPQKY6Qb6/41794GzYlbNfrEFEIPP/bZZAzwd7wrFi5TZ5qHSxInqNXe5BbGiPRwICzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744004954; c=relaxed/simple;
	bh=3EkE6C3Hi4paJTsXvx7FL38Xf5iJeS4E1RDchIUHqf0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CsqQWaeVqpTwtcRXu58MIn1J+cJNXhfw5hwkL9+RHrYJOobbLDoR/Z54io06VBcvi4Ev2l1sC+Pdh/4yDijyW4arxxfGKCeRPj30EiECbY5vlkLY1u2gbVXtimLpz+DhMQedMcjTaC7gFiVLYE/C25j7jHDlLGe09Yl2p7/AqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4pDMSpz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4pDMSpz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4897936e87.0;
        Sun, 06 Apr 2025 22:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744004950; x=1744609750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DBPfS0GjVGIawbDaXwoaxlWnYIThlypgNLRuk7GT/o=;
        b=f4pDMSpzR4QZS+MmonOlMmf0w2LEAbWQLdcKOkLJVbfPm3GjmZASg7iZ34yXC3WhTx
         5p+6GdzE5y5HupUcawDWk90bTTZYYqnGIJrUnLFiTKLTdEfUOTimpJgXGKmEKJmD2c4k
         VQRQLIIA6LxbJhlBTLdruA1m8uJdjPax7jyJg5638l8tKlg2KAWFo6AuprCax6ItQg1+
         vzVIPz2iH+96wQutWfyx6V8w4CktJfX4GFeFASxKbWd4jgPYa6HVoIBFxstonAqYmnha
         CAVR3L9HSgSIQeboy/wNlFFSRr3ZeJ++eWjgu++cu42O1O67VXnLw0Cqd6OFZ/Uwkd4v
         EKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744004950; x=1744609750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DBPfS0GjVGIawbDaXwoaxlWnYIThlypgNLRuk7GT/o=;
        b=LXspJ9itORH4257OcXyCHJho7d6LlXKoUclmLQSUzYNnXqmkz9Dp7oW2ADV541WzZh
         i6ni0iIigTXB1dXEeKN+S0nrWHj72lWpLlAatDgXppHZOLPIYhXTt6/7m5LdOrRnc3v5
         GV9FhK2TUlTYNRttNzv5y9VuOcavTo0FUib58sTWdYZI+jMjv7Sahxm9npfcB8VSiWb1
         5khTmuNs21INwS+Ykr7G7AJlJGlgHT6XeN8LLqqdnbjB0EBnO6uxVR9jLMuQJXpSVgcg
         AWgOW2h2unlUYPkzoK87u0dMyyY/FiiYyceU96VCY0ytBio8meY6fWN1TqNLomd4tDHr
         735A==
X-Forwarded-Encrypted: i=1; AJvYcCW5pXKKW68qknUy2hkGWZLI8HE3KuZnpAmqAf0JHAjbj9ZKgE0UDLLAHEb9i3capp3CodPHm1B58O603iI=@vger.kernel.org, AJvYcCX2YfcXfeisN74F1pDm2QDfW5Rt/7N4qAiY8QdGcbNYDofE8ywpL9aoUGdag5vgmCn5pg8umwxI45k8@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9VDHJtyHadVE57gG0xqKhNNQsWfI3Q8y7aQKl6O6UWg+qk64
	ue7mwAMhIYANVTgK7sSpv7Pzqn1vwkMkowzy+Ys5JtoIlhdnFfRMi7U7Fw==
X-Gm-Gg: ASbGncuSp/5LleyJMM9AldBypyJq/c6p+Be6doatUlJ5uekhB9z6p+V/0y8IJcEkwu4
	oLQ1IN2vGmy/DP+hfrE8b0huOLYw+GXvvDdViXcsAur5InCzayL2x0Zyz0cVtaYIZ1WFLnnAuyK
	OE6DCdGb56JCTOZeJ2f3jx8CRhSidtv3ph3hN4JR6kUzNs0ImwX87awxj4vZdY0QLNkz3uWRVCL
	LwEsHY6ae7J6gVYmYmmDbqeIwGgRrIrIbxMXtde7uUt9CMWdL5RjOHf5m7Il3DO/behIm5tYDm+
	yvUK9m7Ys6pYLyWRW6BQF4V8RYELUlHND5EELq5WfWeFyPN4ohSzAmhDJDI9EQ==
X-Google-Smtp-Source: AGHT+IEwJR01hXbLMULdJ1ce4fPFfm7/3Nwtojhl6gvimL2+0rlPDl9abNHuykA7vgP9/AZCTJpwkw==
X-Received: by 2002:ac2:4bc8:0:b0:54b:e70:3657 with SMTP id 2adb3069b0e04-54c297b7291mr1828351e87.7.1744004950208;
        Sun, 06 Apr 2025 22:49:10 -0700 (PDT)
Received: from foxbook (adtq195.neoplus.adsl.tpnet.pl. [79.185.228.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab360sm1170080e87.40.2025.04.06.22.49.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Apr 2025 22:49:09 -0700 (PDT)
Date: Mon, 7 Apr 2025 07:49:05 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or
 ep state.
Message-ID: <20250407074905.2d236fb9@foxbook>
In-Reply-To: <14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
	<84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
	<20250406002311.2a76fc64@foxbook>
	<ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
	<20250406095008.0dbfd586@foxbook>
	<20250406175032.12b7d284@foxbook>
	<14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Apr 2025 15:26:41 -0400, Alan Stern wrote:
> I'd guess that you're seeing the result of the
> 
> 		usb_disable_interface(udev, intf, true);
> 
> call in usb_reset_and_verify_device().  This call is made following
> the actual reset, as part of the procedure for putting everything
> back to the way it was before the reset.

Your guess is right. I added dump_stack() to those calls.

The bug is triggered by this function calling usb_disable_interface()
and usb_enable_interface() after usb_hcd_alloc_bandwidth().

These two issue endpoint_disable() and endpoint_reset() to the HCD and
xhci_hcd appears to be confused about the intent of the former, because
it clears host_ep->hcpriv, breaking all future endpoint_reset() calls.

Since 6.15, this call informs xhci_hcd that device endpoint has been
cleared and pending URBs can be started, so this isn't working now.


BTW, that's not a corner of the driver which I'm very familiar with,
but AFAIU this disable/enable sequence is pointless for xHCI if done
on freshly created endpoints. It would only wait for clearing TT to
finish (there should be none) and issue some commands to clear the
toggle/sequence state (which should be blank).

Michal
