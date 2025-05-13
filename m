Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F642BD006;
	Tue, 13 May 2025 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160233; cv=none; b=fXyuZSG9OmwKJEzI+xzdZyMElk40MY4I0xKQ+0XG97I8j7eUd3h/4nEZKTF/0bKVpFI4JmgyXHvmspnXCclUWX4vg9HK6imyo6mhgCEPzuH6sTXQkaGETC0o8qmE8MQ6+nT0lq2MGm7Vy52k5gL50br0anY5VH5TOrPrep2j3SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160233; c=relaxed/simple;
	bh=f3g7bRZ4FvihhFwwShTNxqzYwQQ53AijzEInO3x/yas=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQG+v1kfKYnWKFgXt3l8JeWtqkGsRDFDN1Q53h+jQ0H1qzQ4mw7zTLr6h71Mq6lRxxX8rQyEpqd04CO/3O0IKJX8odrh1pyf5NH5yLTtgOC1WmDO5fv3xeOvXlcKkNYUCJmlaRlHo1r209Ba0cd5Ox8XRDkznJS50tyiKYqx0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC19C4CEEF;
	Tue, 13 May 2025 18:17:12 +0000 (UTC)
Date: Tue, 13 May 2025 14:17:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] x86/its: Fix build errors when CONFIG_MODULES=n
Message-ID: <20250513141737.3ce95555@gandalf.local.home>
In-Reply-To: <20250513025839.495755-1-ebiggers@kernel.org>
References: <20250513025839.495755-1-ebiggers@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 19:58:39 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> Fixes: 872df34d7c51 ("x86/its: Use dynamic thunks for indirect branches")
> Cc: stable@vger.kernel.org

No need to Cc stable. This isn't even in Linus's tree.

-- Steve

> Signed-off-by: Eric Biggers <ebiggers@google.com>
